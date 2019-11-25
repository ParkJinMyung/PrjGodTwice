package twentyOnce.sch.controller;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import twentyOnce.sch.dao.IDao;
import twentyOnce.sch.dto.CalendarResource;
import twentyOnce.sch.dto.ScheduleDto;
import twentyOnce.vis.controller.VController;
import twentyOnce.vis.dto.VisitorDto;

@Controller
@RequestMapping("/schviews")
public class SchController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	VController vcon;
	
	@RequestMapping("/schedule")
	public String schedule(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("schedule() passing");
		
		//방문 통계
		VisitorDto visdto=(VisitorDto)session.getAttribute("visdto");
		visdto.setVisitCount(visdto.getVisitCount()+1); //방문한 페이지 수
		vcon.visitUpdate(visdto); //첫 방문
		
		//蹂��닔
		
		int code=0; //�뒪?��以� ?��붾뱶

		int currYear = 0;
		int currMonth = 0;

		Calendar c = Calendar.getInstance();
		Calendar cal = Calendar.getInstance();
		
		//�떖�젰 �깮�꽦
		
		
		
		if(request.getParameter("schCode")!=null) { //�뒪?��以� �젣紐⑹?�� �닃���쓣 �븣

			code=Integer.parseInt(request.getParameter("schCode"));
			ScheduleDto scheduler=getSchedule(code);
			model.addAttribute("scheduler", scheduler);
			
			 currMonth = Integer.parseInt(request.getParameter("month"));
	         currYear = Integer.parseInt(request.getParameter("year"));
	         
	         cal.set(currYear, currMonth, 1);
			
		} else {
			
			if(request.getParameter("action") == null) {

			    currMonth = c.get(Calendar.MONTH);
			    currYear = c.get(Calendar.YEAR);
			    cal.set(currYear,currMonth,1);
			   
			} else {
			   
			    if(request.getParameter("action") != null){ //?��?��뵠占?��?��?��?���?, ?��?��뼄占?��벉占?���? ?��?��?��?��?��?��?��?���? ?��?���?

			         currMonth = Integer.parseInt(request.getParameter("month"));
			         currYear = Integer.parseInt(request.getParameter("year"));
			       
			         if(Integer.parseInt(request.getParameter("action"))==1) {
			       	  
			              cal.set(currYear, currMonth, 1);
			              cal.add(Calendar.MONTH, 1); //?��?��뼄占?��벉占?���?
			              currMonth = cal.get(Calendar.MONTH);
			              currYear = cal.get(Calendar.YEAR);
			             
			         } else {
			              cal.set(currYear, currMonth, 1);
			              cal.add(Calendar.MONTH, -1); //?��?��뵠占?��?��?��?���?
			              currMonth = cal.get(Calendar.MONTH);
			              currYear = cal.get(Calendar.YEAR);
			         }
			       
			    }
			}
			
		}
		
		
		//紐⑤?��: �떖�젰 �냼�뒪
		model.addAttribute("calsource", new CalendarResource(currYear, currMonth,  c, cal));
		
		//�궇吏�
		String date="";
		currMonth+=1;//1�떖 �뜑�빐�빞 留욎?��.
		
		if (currMonth<10) {
			date=currYear+"/0"+currMonth;
		} else {
			date=currYear+"/"+currMonth;
		}
		System.out.println(date);
		
		ArrayList<String> schDateList=searchDate(date);
		ArrayList<String> schTitleList=searchTitle(date);
		ArrayList<String> schCodeList=searchCode(date);
		
		//紐⑤?��: �뒪?��以�
		model.addAttribute("schdatelist", schDateList);
		model.addAttribute("schtitlelist", schTitleList);
		model.addAttribute("schcodelist", schCodeList);
		
//		ScheduleDto scheduleList=new ArrayList<String>();
		
		return "schviews/schedule";
		
	}

	//�뒪?��以� 媛��졇�삤湲�
	private ScheduleDto getSchedule(int code) {
		System.out.println("getSchedule() passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		ScheduleDto scheduler=dao.getSchedule(code);
		
		System.out.println(scheduler.getSch_code());
		System.out.println(scheduler.getSch_title());
		System.out.println(scheduler.getSch_date());
		System.out.println(scheduler.getSch_content());
		System.out.println(scheduler.getSch_location());
		
		return scheduler;
	}
	
	@RequestMapping("/schadminview")
	public String qzadminview(HttpServletRequest request, Model model) {
		System.out.println("schadminview() passing");
		
		return "schviews/schadminview";
	}
	
	@RequestMapping("/schadddone")
	public String qzaddproc(HttpServletRequest request, Model model) {
		System.out.println("schadddone() passing");
		
		String date=request.getParameter("date");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
//		if (request.getParameter("location")!=null) { //위치값 있을 때
//			String location=request.getParameter("location");
//			scheduleAdd1(date, title, content, location);
//		} else {
//			scheduleAdd2(date, title, content);
//		}
		
		String location;
		if (request.getParameter("location")!=null) { //위치값 있을 때
			location=request.getParameter("location");
		} else {
			location="null";
		}
		
		scheduleAdd(date, title, content, location);
		
		return "schviews/schadddone";
	}
	
	private void scheduleAdd(String date, String title, String content, String location) {
		System.out.println("scheduleAdd() passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		dao.scheduleAdd(date, title, content, location);
	}

	//�뒪?��以� 李얘�?
	private ArrayList<String> searchDate(String date) {
		System.out.println("searchDate() passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		ArrayList<String> schDateList=dao.searchDate(date);
		
		return schDateList;
	}
	private ArrayList<String> searchTitle(String date) {
		System.out.println("searchTitle() passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		ArrayList<String> schTitleList=dao.searchTitle(date);
		
		return schTitleList;
	}
	private ArrayList<String> searchCode(String date) {
		System.out.println("searchCode() passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		ArrayList<String> schCodeList=dao.searchCode(date);
		
		return schCodeList;
	}

}
