package twentyOnce.vis.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import twentyOnce.vis.dao.VDao;
import twentyOnce.vis.dto.DateDto;
import twentyOnce.vis.dto.GraphDto;
import twentyOnce.vis.dto.StatsDto;
import twentyOnce.vis.dto.VisitorDto;

@Controller
@RequestMapping("/visviews")
public class VController {
	
	@Autowired
	private SqlSession sqlSession;

	public void firstVisit(VisitorDto visdto) {
		System.out.println("firstVisit() passing");
		
		VDao dao=sqlSession.getMapper(VDao.class);
		dao.firstVisit(visdto.getSessionId());
		
	}
	
	public void visitUpdate(VisitorDto visdto) {
		System.out.println("visitUpdate() passing");
		
		VDao dao=sqlSession.getMapper(VDao.class);
		dao.visitUpdate(visdto.getMemberId(), visdto.getVisitCount(), visdto.getSessionId());
		
	}
	
	@RequestMapping("/visstatsview")
	public String visstatsview(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("visstatsview() passing");
		
		Calendar cal=Calendar.getInstance();
		
		//실제 날짜
		int currYear;
		int currMonth;
		int currDay;
		
		currYear=cal.get(Calendar.YEAR);
		currMonth=cal.get(Calendar.MONTH);
		currDay=cal.get(Calendar.DATE);
		
		//입력 날짜
		int year=currYear;
		int month=currMonth;
		int day=currDay;
		
		//2주치 통계를 위해
		int sysminus=0;
		
		if (request.getParameter("year")!=null) { //1일전/1일후로 들어옴
			
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));
			day = Integer.parseInt(request.getParameter("day"));
				
			String strStartDate=""+year+(month+1)+day;
			String strEndDate=""+currYear+(currMonth+1)+currDay;
			String strFormat="yyyyMMdd";
			
			System.out.println("strStartDate: "+strStartDate);
			System.out.println("strEndDate: "+strEndDate);
				
			SimpleDateFormat sdf=new SimpleDateFormat(strFormat);
			
			try {
				Date startDate=sdf.parse(strStartDate);
				System.out.println("startDate: "+startDate);
				Date endDate=sdf.parse(strEndDate);
				System.out.println("endDate: "+endDate);
				
				long diffDay=(startDate.getTime()-endDate.getTime()) / (24*60*60*1000);
				System.out.println(diffDay+"일~~");
				sysminus=(int)diffDay;
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			//그래프를 위해
			
			cal.set(year, month, day);
			
			year=cal.get(Calendar.YEAR);
			month=cal.get(Calendar.MONTH);
			day=cal.get(Calendar.DATE);
			
		}
		
		DateDto datedto=new DateDto(year, month, day, currYear, currMonth, currDay);
		model.addAttribute("datedto", datedto);
		
//		날짜 배열
		
		ArrayList<Integer> datelist=new ArrayList<Integer>();
		
		for (int i = 14; i >= 0; i--) {
			cal.set(day, month, day-i);
			datelist.add(cal.get(Calendar.DATE));
		}
		
//		통계 그래프(2주)
		
		//db
		ArrayList<GraphDto> grphdtolist=graphviewsGet();
		
		//보낼거
		ArrayList<GraphDto> grphlist=new ArrayList<GraphDto>();
		
		for (int i = 0; i < datelist.size(); i++) {
			int date=datelist.get(i);
			boolean flag=true;
			
			for (int j = 0; j < grphdtolist.size(); j++) {
				GraphDto dto=grphdtolist.get(j);
				
				if (date==dto.getGrphdate()) {
					grphlist.add(dto);
					flag=false;
					break;
				}
			}
			
			if (flag) {
				grphlist.add(new GraphDto(date, 0));
			}
			
		}
		
		for (int i = 0; i < grphlist.size(); i++) {
			GraphDto dto=grphlist.get(i);
			System.out.println(i+"번");
			System.out.println("date: "+dto.getGrphdate());
			System.out.println("count: "+dto.getGrphcount());
		}
		
		model.addAttribute("grphlist", grphlist);
		
//		통계 요약
		
		int totalviews=totalviewsGet();
		int dailyviews=dailyviewsGet();
		int weeklyviews=weeklyviewsGet();
		int monthlyviews=monthlyviewsGet();
		
		//2019.11.17. 19:51 기준
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy.MM.dd HH:mm 기준");
		String standardTime = format1.format(cal.getTime());
		
		//평균
		int avgviews=0;
		
		for (int i = 0; i < grphlist.size(); i++) {
			avgviews+=grphlist.get(i).getGrphcount();
		}
		
		avgviews/=grphlist.size()+1;
		
		//2주 버젼
		
		//방문 합계
		int twoweeksviews=twoweeksviewsGet(sysminus);
		//평균 페이지뷰
		int avgpageviews=avgpageviewsGet(sysminus);
		//평균 사용 시간(반올림.분)
		int avgusemins=avguseminsGet(sysminus);
		//가장 많이 접속한 아이디
		String maxuseid=maxuseidGet(sysminus);
		
		System.out.println("twoweeksviews: "+twoweeksviews);
		System.out.println("avgpageviews: "+avgpageviews);
		System.out.println("avgusemins: "+avgusemins);
		System.out.println("maxuseid: "+maxuseid);
		
		StatsDto statdto=new StatsDto(totalviews, dailyviews, weeklyviews, monthlyviews,
				standardTime, avgviews,
				twoweeksviews, avgpageviews, avgusemins, maxuseid);
		
		model.addAttribute("statdto", statdto);
		
		
		return "visviews/visstatsview";
	}
	
	//////////////////

	private int twoweeksviewsGet(int sysminus) {
		System.out.println("twoweeksviewsGet() passing");
		
		VDao vdao=sqlSession.getMapper(VDao.class);
		int twoweeksviews=vdao.twoweeksviewsGet(sysminus);
		
		return twoweeksviews;
	}

	private String maxuseidGet(int sysminus) {
		System.out.println("maxuseidGet() passing");
		
		VDao vdao=sqlSession.getMapper(VDao.class);
		String maxuseid;
		
		try {
			maxuseid=vdao.maxuseidGet(sysminus);
		} catch (NullPointerException e) {
			maxuseid="none";
		}
		
		return maxuseid;
	}

	private int avguseminsGet(int sysminus) {
		System.out.println("avguseminsGet() passing");
		
		VDao vdao=sqlSession.getMapper(VDao.class);
		int avgusemins;
		
		try {
			avgusemins=vdao.avguseminsGet(sysminus);
		} catch (NullPointerException e) {
			avgusemins=0;
		}		
		return avgusemins;
	}

	private int avgpageviewsGet(int sysminus) {
		System.out.println("avgpageviewsGet() passing");
		
		VDao vdao=sqlSession.getMapper(VDao.class);
		int avgpageviews;
		
		try {
			avgpageviews=vdao.avgpageviewsGet(sysminus);
		} catch (NullPointerException e) {
			avgpageviews=0;
		}
		
		return avgpageviews;
	}
	
	//////////////////

	private ArrayList<GraphDto> graphviewsGet() {
		System.out.println("graphviewsGet() passing");
		
		VDao vdao=sqlSession.getMapper(VDao.class);
		ArrayList<GraphDto> grphdtolist=vdao.graphviewsGet();
		
		return grphdtolist;
	}
	
///////////////////////////////////////

	private int monthlyviewsGet() {
		System.out.println("monthlyviewsGet() passing");
		
		VDao vdao=sqlSession.getMapper(VDao.class);
		int monthlyviews=vdao.monthlyviewsGet();
		
		return monthlyviews;
	}

	private int weeklyviewsGet() {
		System.out.println("weeklyviewsGet() passing");
		
		VDao vdao=sqlSession.getMapper(VDao.class);
		int weeklyviews=vdao.weeklyviewsGet();
		
		return weeklyviews;
	}

	private int dailyviewsGet() {
		System.out.println("dailyviewsGet() passing");
		
		VDao vdao=sqlSession.getMapper(VDao.class);
		int dailyviews=vdao.dailyviewsGet();
		
		return dailyviews;
	}

	private int totalviewsGet() {
		System.out.println("totalviewsGet() passing");
		
		VDao vdao=sqlSession.getMapper(VDao.class);
		int totalviews=vdao.totalviewsGet();
		
		return totalviews;
	}
	
}
