package twentyOnce.mem.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import twentyOnce.mem.dao.MemDao;
import twentyOnce.mem.dto.MemberDto;
import twentyOnce.vis.controller.VController;
import twentyOnce.vis.dto.VisitorDto;

@Controller
@RequestMapping("/memviews")
public class MController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	VController vcon;

	@RequestMapping("/mypage")
	public String mypage(HttpServletRequest request, Model mode, HttpSession session) {
		System.out.println("mypage() passing");
		
		//방문 통계
		VisitorDto visdto=(VisitorDto)session.getAttribute("visdto");
		visdto.setVisitCount(visdto.getVisitCount()+1); //방문한 페이지 수
		vcon.visitUpdate(visdto); //첫 방문
		
		if (request.getParameter("pwnew")!=null) { //비번 변경
			System.out.println("비번 변경중");
			
			String pwnew=request.getParameter("pwnew");
			MemberDto memdto=(MemberDto)request.getSession().getAttribute("memdto");
			
			JoinController jcon=new JoinController();
			ArrayList<String> cryptlist=jcon.pwEncrypt(pwnew);
			String salt=cryptlist.get(0);
			String cryptPw=cryptlist.get(1);
			
			pwChange(memdto.getId(), cryptPw, salt);
		}
		
		return "memviews/mypage";
	}
	
	private void pwChange(String id, String cryptPw, String salt) {
		System.out.println("pwChange() passing");
		
		MemDao memdao=sqlSession.getMapper(MemDao.class);
		memdao.pwChange(id, cryptPw, salt);
	}

	public void mempointUpdate(String userid, int point) {
		System.out.println("mempointUpdate() passing");
		
		MemDao memdao=sqlSession.getMapper(MemDao.class);
		memdao.mempointUpdate(userid, point);
	}
	
}
