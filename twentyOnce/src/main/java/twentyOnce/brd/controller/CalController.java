package twentyOnce.brd.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import twentyOnce.brd.dao.FromDao;
import twentyOnce.brd.vopage.PageVO;
import twentyOnce.brd.vopage.ReplyVO;


@Controller
@RequestMapping// dispatcher 역할. 클라이언트의 요청을 처리한다.
public class CalController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/brdviews/not_Cal/calendar") // 요청하는 URL을 어떤 메소드가 처리할지 여부를 결정한다.
	public String calendar() {
		
		
		return "brdviews/not_Cal/calendar";
	}
}
