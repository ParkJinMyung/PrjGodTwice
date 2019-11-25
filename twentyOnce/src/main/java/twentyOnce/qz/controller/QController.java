package twentyOnce.qz.controller;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import twentyOnce.mem.controller.MController;
import twentyOnce.mem.dto.MemberDto;
import twentyOnce.qz.dao.IDao;
import twentyOnce.qz.dto.QuizDto;
import twentyOnce.qz.dto.QuizProgress;
import twentyOnce.vis.controller.VController;
import twentyOnce.vis.dto.VisitorDto;

@Controller
@RequestMapping("/qzviews")
public class QController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	MController mcon;
	
	@Autowired
	VController vcon;
	
	@RequestMapping("/qzstartview")
	public String qzstartview(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("qzstartview() passing");
		
		//방문 통계
		VisitorDto visdto=(VisitorDto)session.getAttribute("visdto");
		visdto.setVisitCount(visdto.getVisitCount()+1); //방문한 페이지 수
		vcon.visitUpdate(visdto); //첫 방문
		
		Random ran=new Random();
		
		ArrayList<Integer> qlist=new ArrayList<Integer>();
		
		for (int i = 0; i < 10; i++) {
			
			int qzcode=ran.nextInt(19)+1; //1번부터 보유 문제수(20)까지.
			
			if (qlist.contains(qzcode)) { //중복 제거
				
				i-=1;
				continue;
				
			} else {
				qlist.add(qzcode);
			}
			
		}
		
		for (int i = 0; i < qlist.size(); i++) { //출력
			
			System.out.println(i+1+". "+qlist.get(i));
			
		}
		
		//출제 문항
		request.getSession().setAttribute("qlist", qlist);
		
		//퀴즈 진행
		QuizProgress qprogress=new QuizProgress(0, 0);
		request.getSession().setAttribute("qprogress", qprogress);
		
		//문제 출제
		QuizDto qdto=quizGet(qlist.get(qprogress.getQuizturn()));
		//퀴즈를 퀴즈범위배열의 퀴즈progress의 quizturn(0), 즉 출제범위의 첫번째 문제 출제.
		request.getSession().setAttribute("qdto", qdto);
		System.out.println(qdto.getQz_code());
		
		return "qzviews/qzview"; //proc이 아닌 문제풀이로 바로 감
	}
	
	private QuizDto quizGet(int quizturn) {
		System.out.println("quizGet() passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		QuizDto qdto=dao.quizGet(quizturn);
		
		return qdto;
	}

	@RequestMapping("/qzview")
	public String qzview(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("qzview() passing");
		
		//방문 통계
		VisitorDto visdto=(VisitorDto)session.getAttribute("visdto");
		visdto.setVisitCount(visdto.getVisitCount()+1); //방문한 페이지 수
		vcon.visitUpdate(visdto); //첫 방문
		
		int checkbox=0;
		
//		if (request.getParameter("checkbox")!=null) {
//			
//			checkbox=Integer.parseInt(request.getParameter("checkbox"));
//		}
		checkbox=Integer.parseInt(request.getParameter("checkbox"));
		
		QuizProgress qprogress=(QuizProgress)request.getSession().getAttribute("qprogress");
		QuizDto lastq=(QuizDto)request.getSession().getAttribute("qdto");
		
		//채점
		if (checkbox==lastq.getQz_answer()) { //정답일시
			qprogress.setCorrectnum(qprogress.getCorrectnum()+1);
			System.out.println("정답임");
		}
		
		request.getSession().removeAttribute("qdto");
		
		
		//진행 +1
		qprogress.setQuizturn(qprogress.getQuizturn()+1);
		System.out.println("quizturn: "+qprogress.getQuizturn());
		
		if (qprogress.getQuizturn()==10) { //문제 다 품
			
			request.getSession().removeAttribute("qlist");
			
			MemberDto memdto=(MemberDto)request.getSession().getAttribute("memdto");
			int correctnum=qprogress.getCorrectnum();
			int qzpoint=correctnum*10;
			
//			MController mcon=new MController();
			//db포인트 업데이트
			mcon.mempointUpdate(memdto.getId(), memdto.getPoint()+qzpoint);
			//세션 포인트 업데이트
			memdto.setPoint(memdto.getPoint()+qzpoint);
			memdto.setTier(memdto.getPoint());
			
			/*
			 * 세션에서 회원 아이디 가져옴.
			 * 세션에서 맞은 개수 가져옴.
			 * 맞은 개수x10과 아이디를 함수에 집어넣음.
			 * dao에서 해당 아이디에 해당 포인트를 더함.
			 */
			
			return "qzviews/qzresultview";
		}
		
		//다음 문제
		
		ArrayList<Integer> qlist=(ArrayList)request.getSession().getAttribute("qlist");
		
		QuizDto qdto=quizGet(qlist.get(qprogress.getQuizturn()));
		request.getSession().setAttribute("qdto", qdto);
		System.out.println(qdto.getQz_code());
		
		System.out.println();
		
		return "qzviews/qzview";
	}
	
	@RequestMapping("/qzadminview")
	public String qzadminview(HttpServletRequest request, Model model) {
		System.out.println("qzadminview() passing");
		
		return "qzviews/qzadminview";
	}
	
	@RequestMapping("/qzadddone")
	public String qzaddproc(HttpServletRequest request, Model model) {
		System.out.println("qzadddone() passing");
		
		String quiz=request.getParameter("quiz");
		String choicea=request.getParameter("choicea");
		String choiceb=request.getParameter("choiceb");
		String choicec=request.getParameter("choicec");
		String choiced=request.getParameter("choiced");
		String choicee=request.getParameter("choicee");
		int answer=Integer.parseInt(request.getParameter("answer"));
		
		quizAdd(quiz, choicea, choiceb, choicec, choiced, choicee, answer);
		
		return "qzviews/qzadddone";
	}

	private void quizAdd(String quiz, String choicea, String choiceb, String choicec, String choiced, String choicee,
			int answer) {
		System.out.println("quizAdd() passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		dao.quizAdd(quiz, choicea, choiceb, choicec, choiced, choicee, answer);
		
	}

//	private void mempointUpdate(String userid, int point) {
//		System.out.println("mempointUpdate() passing");
//		System.out.println("userid: "+userid+" point: "+point);
//		
//		MemDao memdao=sqlSession.getMapper(MemDao.class);
//		memdao.mempointUpdate(userid, point);
//	}

//	private void mempointUpdate(String userid, int point) {
//		System.out.println("mempointUpdate() passing");
//		
//		IDao dao=sqlSession.getMapper(IDao.class);
//		dao.mempointUpdate(userid, point);
//		
//	}

}
