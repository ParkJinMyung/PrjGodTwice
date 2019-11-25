package twentyOnce.mem.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import twentyOnce.mem.dao.MemDao;
import twentyOnce.mem.dto.MemberDto;
import twentyOnce.mem.dto.SaveIdDto;
import twentyOnce.mem.sha256.BCrypt;
import twentyOnce.mem.sha256.SHA256;
import twentyOnce.vis.controller.VController;
import twentyOnce.vis.dto.VisitorDto;

@Controller
@RequestMapping("/memviews")
public class LogController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	VController vcon;
	
	@RequestMapping("/loginform")
	public String loginform(HttpServletRequest request, Model model) {
		System.out.println("loginform() passing");
		
		SaveIdDto iddto=saveidSearch();
		
		model.addAttribute("iddto", iddto);
		
		return "memviews/loginform";
	}
	
	private SaveIdDto saveidSearch() {
		System.out.println("saveidSearch() passing");
		
		MemDao dao=sqlSession.getMapper(MemDao.class);
		SaveIdDto iddto=dao.saveidSearch();
		
		if (iddto==null) {
			iddto=new SaveIdDto();
			iddto.setCheck("");
		}
		
		return iddto;
	}

	@RequestMapping("/loginproc")
	public String loginproc(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("loginproc() passing");
		VisitorDto visdto=(VisitorDto)session.getAttribute("visdto");
		
		String reqid=request.getParameter("id");
		String reqpw=request.getParameter("pw");
		
		if (request.getParameter("saveId")!=null) {
			System.out.println("아디 저장");
			
			saveidDel();
			
			saveidAdd(reqid, reqpw);
			
		} else {
			System.out.println("아디 저장 안 함");
			
			saveidDel();
			
		}
		
		MemberDto memdto=memberCheck(reqid);
		
		if (memdto==null) { //같은 아이디가 없다면
			
		} else { //아이디가 맞다면
			
			String salt=memdto.getSalt();
			String pw=memdto.getPw();
			
			//비밀번호 확인(sha256)
			if (pwVerify(reqpw, salt, pw)) { //맞을때
				
				session.setAttribute("memdto", memdto);
				
				visdto.setMemberId(memdto.getId());
			}
			
		}
		
		model.addAttribute("memdto", memdto);
		
		//방문 통계
		visdto.setVisitCount(visdto.getVisitCount()+1); //방문한 페이지 수
		vcon.visitUpdate(visdto); //첫 방문
		
		return "memviews/loginproc";
	}

	private void saveidAdd(String reqid, String reqpw) {
		System.out.println("saveidAdd() passing");
		
		MemDao dao=sqlSession.getMapper(MemDao.class);
		dao.saveidAdd(reqid, reqpw);
	}

	private void saveidDel() {
		System.out.println("saveidDel() passing");
		
		MemDao dao=sqlSession.getMapper(MemDao.class);
		dao.saveidDel();
	}

	private boolean pwVerify(String reqpw, String salt, String pw) {
		System.out.println("pwVerify() passing");
		
		boolean flag=false;
		SHA256 sha=SHA256.getInsatnce();
		
		
		try {
			
			
			String shapw = sha.getSha256(reqpw.getBytes());
			System.out.println("shapw: "+shapw);
			System.out.println("salt: "+salt);
			String cryptpw=BCrypt.hashpw(shapw, salt);
			
			
			if (cryptpw.equals(pw)) {
				System.out.println("비번 일치");
				
				flag=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	private MemberDto memberCheck(String reqid) {
		System.out.println("memberGet() passing");
		
		MemDao dao=sqlSession.getMapper(MemDao.class);
		MemberDto memdto=dao.memberCheck(reqid);
		
		return memdto;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, Model model) {
		System.out.println("logout() passing");
		
		request.getSession().invalidate();
		
		return "redirect:/";
	}

	@RequestMapping("/store_logout")
	public String store_logout(HttpServletRequest request, Model model) {
		System.out.println("store_logout() passing");
		
		request.getSession().invalidate();
		
		return "redirect:/stoviews/list";
	}
	
}
