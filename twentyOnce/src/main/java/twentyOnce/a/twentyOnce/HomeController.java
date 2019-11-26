package twentyOnce.a.twentyOnce;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import twentyOnce.vis.controller.VController;
import twentyOnce.vis.dto.VisitorDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	VController vcon;
	
	/**  개새끼야
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		//방문 통계(첫 접속)
		if (session.getAttribute("visdto")==null) {
			VisitorDto visdto=new VisitorDto(session.getId()); //세션아이디로 생성
			
			session.setAttribute("visdto", visdto);//세션 올림
			
			vcon.firstVisit(visdto);//db insert
		}
		
		//방문 통계
		VisitorDto visdto=(VisitorDto)session.getAttribute("visdto");
		visdto.setVisitCount(visdto.getVisitCount()+1); //방문한 페이지 수
		vcon.visitUpdate(visdto); //첫 방문
		
		return "home";
	}
	
}
