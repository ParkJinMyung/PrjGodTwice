package twentyOnce.mem.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import twentyOnce.mem.dao.MemDao;
import twentyOnce.mem.sha256.BCrypt;
import twentyOnce.mem.sha256.SHA256;

@Controller
@RequestMapping("/memviews")
public class JoinController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/joinform")
	public String joinform(HttpServletRequest request, Model model) {
		System.out.println("joinform() passing");
		
		return "memviews/joinform";
	}
	
	@RequestMapping("/joinproc")
	public String joinproc(HttpServletRequest request, Model model) {
		System.out.println("joinproc() passing");
		
		//request.getparameter濡� 媛��졇�샂
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String addr=request.getParameter("addr");
		
		//list�뿉 if臾몄쑝濡� �뿉�윭�뱾 異붽��븯怨� �뿉�윭 �엳�쑝硫� �떎�떆 join�쑝濡�
		//洹쇰뜲 js濡� �씪�떒 泥섎━以�
		
		//�븘�씠�뵒 以묐났�솗�씤
		String dupId=dupidCheck(id);
		
		if (dupId!=null) { //�븘�씠�뵒 以묐났 
			
			return "memviews/joinform";
			
		} else {  //以묐났 �뾾�쓬
			
			//sha256
			ArrayList<String> cryptlist=pwEncrypt(pw);
			String salt=cryptlist.get(0);
			String cryptPw=cryptlist.get(1);
			System.out.println("salt: "+salt);
			System.out.println("cryptPw: "+cryptPw);
			
			//�쉶�썝媛��엯
			memberJoin(id, cryptPw, name, phone, email, addr, salt);
			
			return "redirect:../";
		}
		
	}

	public ArrayList<String> pwEncrypt(String pw) { //鍮꾨�踰덊샇 �빐�떆�솕
		System.out.println("pwEncrypt passing()");
		
		SHA256 sha=SHA256.getInsatnce();
		
		ArrayList<String> cryptlist=new ArrayList<String>();
		
		try {
			String shaPw=sha.getSha256(pw.getBytes());
			
			String salt=BCrypt.gensalt();
			cryptlist.add(salt);
			
			String cryptPw=BCrypt.hashpw(shaPw, salt);
			cryptlist.add(cryptPw);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cryptlist;
		
	}

	private void memberJoin(String id, String pw, String name, String phone, String email, String addr, String salt) {
		
		MemDao dao=sqlSession.getMapper(MemDao.class);
		dao.memberJoin(id, pw, name, phone, email, addr, salt);
		
	}

	private String dupidCheck(String id) {
		
		MemDao dao=sqlSession.getMapper(MemDao.class);
		String dupId=dao.dupidCheck(id);
		
		return dupId;
	}

}
