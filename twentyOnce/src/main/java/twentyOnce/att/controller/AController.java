package twentyOnce.att.controller;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import twentyOnce.att.dao.IDao;
import twentyOnce.mem.controller.MController;
import twentyOnce.mem.dto.MemberDto;
import twentyOnce.vis.controller.VController;
import twentyOnce.vis.dto.VisitorDto;
import twentyOnce.att.dto.CalendarResource;

@Controller
@RequestMapping("/attviews")
public class AController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	MController mcon;
	
	@Autowired
	VController vcon;
	
	@RequestMapping("/attendtable")
	public String attendtable(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("attendtable() passing");
		
		//방문 통계
		VisitorDto visdto=(VisitorDto)session.getAttribute("visdto");
		visdto.setVisitCount(visdto.getVisitCount()+1); //방문한 페이지 수
		vcon.visitUpdate(visdto); //첫 방문

		int currYear = 0;
		int currMonth = 0;

		Calendar c = Calendar.getInstance();
		Calendar cal = Calendar.getInstance();
		
		MemberDto memdto=(MemberDto)session.getAttribute("memdto");
		String id=memdto.getId();
		
		if(request.getParameter("action") == null) {

		    currMonth = c.get(Calendar.MONTH);
		    currYear = c.get(Calendar.YEAR);
		    cal.set(currYear,currMonth,1);
		    
		} else {

			currMonth = Integer.parseInt(request.getParameter("month"));
			currYear = Integer.parseInt(request.getParameter("year"));
	       
			if(Integer.parseInt(request.getParameter("action"))==1) {
	       	  
				cal.set(currYear, currMonth, 1);
				cal.add(Calendar.MONTH, 1);
				currMonth = cal.get(Calendar.MONTH);
				currYear = cal.get(Calendar.YEAR);
	             
	         } else {
	        	 cal.set(currYear, currMonth, 1);
	        	 cal.add(Calendar.MONTH, -1);
	        	 currMonth = cal.get(Calendar.MONTH);
	        	 currYear = cal.get(Calendar.YEAR);
	         }
	    
		}
		
		
		model.addAttribute("calsource", new CalendarResource(currYear, currMonth,  c, cal));
		
		//도장 찍었을 때(어차피 찍으면 오늘임, sysdate로 날짜 입력)
		//출석 상황 찾는거 앞에 있어야 바로 업뎃.
		if(request.getParameter("stamp")!=null) {
			System.out.println("stamp찍음");
			
			//도장
			todayStamp(id);
			
			//포인트
			int attpoint=10;
			//db
			mcon.mempointUpdate(memdto.getId(), memdto.getPoint()+attpoint);
			//세션
			memdto.setPoint(memdto.getPoint()+attpoint);
		}
		
		//날짜 sql 형식으로
		String date="";
		currMonth+=1;//1달 추가해야 맞음.
		
		if (currMonth<10) {
			date=currYear+"/0"+currMonth;
		} else {
			date=currYear+"/"+currMonth;
		}
		System.out.println(date);
		
		//출석 상황 찾기
		ArrayList<String> attDateList=stampSearch(id, date);
		
		model.addAttribute("attdatelist", attDateList);
		
		return "attviews/attendtable";
	}

	private void todayStamp(String id) {
		System.out.println("todayStamp() passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		dao.todayStamp(id);
	}

	private ArrayList<String> stampSearch(String id, String date) {
		System.out.println("stampSearch() passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		ArrayList<String> attDateList=dao.stampSearch(id, date);
		
		return attDateList;
	}

}
