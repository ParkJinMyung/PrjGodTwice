package twentyOnce.wc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import twentyOnce.vis.controller.VController;
import twentyOnce.vis.dto.VisitorDto;
import twentyOnce.wc.dao.IDao;
import twentyOnce.wc.dto.NomineeDto;
import twentyOnce.wc.dto.WorldcupProgress;

@Controller
@RequestMapping("/wcviews")
public class WController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	VController vcon;
	
	@RequestMapping("/wcview")
	public String wcview(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("wcview() passing");
		
		//방문 통계
		VisitorDto visdto=(VisitorDto)session.getAttribute("visdto");
		visdto.setVisitCount(visdto.getVisitCount()+1); //방문한 페이지 수
		vcon.visitUpdate(visdto); //첫 방문
		
		int thisRound=16;
		int nextMatch=0; //nextmatch媛� round留뚰겮 李⑤깘 �븞 李⑤깘
		int lastWinner=-1;
		int lastLoser=-1;
		
		if (request.getParameter("thisround")!=null) {
			
			thisRound=Integer.parseInt(request.getParameter("thisround"));
			nextMatch=Integer.parseInt(request.getParameter("nextmatch"));
			
			//�듅�옄 �뾽�뜲�씠�듃
			lastWinner=Integer.parseInt(request.getParameter("lastwinner"));
			winnerUpdate(thisRound/2, lastWinner); //�떎�쓬 �씪�슫�뱶 吏꾩텧
			//�뙣�옄 �뾽�뜲�씠�듃
			lastLoser=Integer.parseInt(request.getParameter("lastloser"));
			loserUpdate(lastLoser);
			
			if (thisRound==nextMatch) { //�씪�슫�뱶 蹂�寃�
				
				thisRound/=2; //�떎�쓬 �씪�슫�뱶
				nextMatch=0;
			}
			System.out.println("controller �씪�슫�뱶: "+thisRound);
			System.out.println("controller 留ㅼ튂: "+nextMatch);
			
			if (thisRound == 1) { // �슦�듅�옄 �솗�젙
				System.out.println("�썡�뱶而� 醫낅즺");
				
				//梨뷀뵾�뼵 �뾽�뜲�씠�듃
				championUpdate(lastWinner);
				
				//珥덇린�솕 �꽭�똿
				resetWc();
				
				//梨뷀뵾�뼵 �솕硫�
				NomineeDto championDto=bringChampion(lastWinner);
				
				model.addAttribute("championDto", championDto);

				return "wcviews/wcchampionview"; //챔피언으로 이동
			}
			
		}
		
		//吏꾪뻾�궗�빆 異붽�
		WorldcupProgress wcprogress=new WorldcupProgress(thisRound, nextMatch);
		
		model.addAttribute("wcprogress", wcprogress);
		
		//���쟾 �긽�� 異붽�
		ArrayList<NomineeDto> nomlist=searchNominee(thisRound);
		ArrayList<NomineeDto> matchlist=new ArrayList<NomineeDto>();
		if (!nomlist.isEmpty()) {			
			matchlist.add(nomlist.get(0));
			matchlist.add(nomlist.get(1));
		} else {
			System.out.println("nomlist媛� 鍮꾩뿀�쓬");
		}
		
		model.addAttribute("matchlist", matchlist);
		
		System.out.println();//�썡�뱶而� 以꾨컮轅�
		
		return "wcviews/wcview";
	}

	@RequestMapping("/wcstatsview")
	public String statsview(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("statsview() passing");
		
		//방문 통계
		VisitorDto visdto=(VisitorDto)session.getAttribute("visdto");
		visdto.setVisitCount(visdto.getVisitCount()+1); //방문한 페이지 수
		vcon.visitUpdate(visdto); //첫 방문
		
		ArrayList<NomineeDto> statslist=statsView();
		
		model.addAttribute("statslist", statslist);
		
		return "wcviews/wcstatsview";
	}
	
	private ArrayList<NomineeDto> statsView() {
		
		IDao dao=sqlSession.getMapper(IDao.class);
		ArrayList<NomineeDto> statslist=dao.statsView();
		
		return statslist;
	}

	private NomineeDto bringChampion(int lastWinner) {
		
		IDao dao=sqlSession.getMapper(IDao.class);
		NomineeDto championDto=dao.bringChampion(lastWinner);
		
		return championDto;
	}
	
	private void resetWc() {
		
		IDao dao=sqlSession.getMapper(IDao.class);
		dao.resetWc();
		
	}
	
	private void championUpdate(int lastWinner) {
//		System.out.println("championUpdate: champion"+lastWinner);
		
		IDao dao=sqlSession.getMapper(IDao.class);
		dao.championUpdate(lastWinner);
		
	}

	private void winnerUpdate(int thisRound, int lastWinner) {
//		System.out.println("winnerUpdate() passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		dao.winnerUpdate(thisRound, lastWinner); //�듅�옄 �뾽�뜲�씠�듃
		
		
	}

	private void loserUpdate(int lastLoser) {
//		System.out.println("loserUpdate() passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		dao.loserUpdate(lastLoser);//�뙣�옄 �뾽�뜲�씠�듃
		
	}
	
	private ArrayList<NomineeDto> searchNominee(int thisRound) {
//		System.out.println("searchNominee() passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		ArrayList<NomineeDto> nomlist=dao.searchNominee(thisRound);
		
		return nomlist;
	}

}