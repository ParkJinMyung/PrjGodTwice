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
public class FromController2 {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/brdviews/not_From/list") // 요청하는 URL을 어떤 메소드가 처리할지 여부를 결정한다.
	public String list(HttpServletRequest request,  Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="not_title") String searchType,
			@RequestParam(value="searchkw", defaultValue="") String searchkw) {
		
		System.out.println("list passing");

		FromDao dao = sqlSession.getMapper(FromDao.class);// 디비를 가져오겠다.
		// 인터페이스 자체에 sqlsession을 넣었는데 이 값은 db 연결이다. 대응시켜줬다. 이거 쓸거야~
		// 마이바티스를 쓸수 있는 환경으로 만들어 줬다. 결론 .

		
		int total = 0;
		total =  dao.selectBoardCount(searchType, searchkw); /* 전체 게시물 레코드 수 */
	    System.out.println(curPage);
		PageVO paging = new PageVO(total, curPage);
		
		int rowStart =paging.getRowStart();// 세로 시작
		
		int rowEnd = paging.getRowEnd();// 세로 끝
	
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("list", dao.list(rowStart, rowEnd,searchType, searchkw));
		map.put("total", total); // 검색된 전체 레코드 수
		map.put("paging", paging); // page처리 계산
		map.put("searchType",searchType);
		map.put("searchkw",searchkw);
	
		
		// select check query
		model.addAttribute("paramMap", map); // 값을 다 넣은 searchVO를 view로 뿌림

		return "brdviews/not_From/list";
	}

	@RequestMapping("/brdviews/not_From/write_view")
	public String write_view() {
		System.out.println("write_view passing");
		return "brdviews/not_From/write_view";
	}

	@RequestMapping("/brdviews/not_From/write")
	public String write(HttpServletRequest request, Model model) {
		System.out.println("write passing");
		
		FromDao dao = sqlSession.getMapper(FromDao.class);
		String name = request.getParameter("not_name");
		String title = request.getParameter("not_title");
		String content = request.getParameter("not_content");
		System.out.println("name : " + name + "title : " + title + "content : " + content);
		dao.write(name, title, content);
		
		
		return "redirect:/brdviews/not_From/list";// view파일 리턴
	}
	
	
	@RequestMapping("/brdviews/not_From/content_modify")
	public String content_modify(HttpServletRequest request, Model model) {
		System.out.println("content_modify passing");
		String num = request.getParameter("not_num");
		String name = request.getParameter("not_name");
		String title = request.getParameter("not_title");
		String content = request.getParameter("not_content");
		String date = request.getParameter("not_date");
		String view = request.getParameter("not_view");
		
		Map<String, Object> key = new HashMap<String, Object>();
		
		key.put("num",num);
		key.put("name",name);
		key.put("title",title);
		key.put("content", content);
		key.put("date", date);
		key.put("view", view);
		
		model.addAttribute("content_modify",key);
		
		return "brdviews/not_From/content_modify";
	}

	
	@RequestMapping("/brdviews/not_From/modify")
	public String modify(HttpServletRequest request, Model model) {
		System.out.println("modify passing");

		FromDao dao = sqlSession.getMapper(FromDao.class);
		String num = request.getParameter("not_num");
		String name = request.getParameter("not_name");
		String title = request.getParameter("not_title");
		String content = request.getParameter("not_content");
		
		dao.modify(num, name, title, content);

		return "redirect:/brdviews/not_From/list";
	}

	@RequestMapping("/brdviews/not_From/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("delete passing");

		FromDao dao = sqlSession.getMapper(FromDao.class);
		String num = request.getParameter("num");
		dao.delete(num);

		return "redirect:/brdviews/not_From/list";
	}

	public void hitUp(String num) {
		FromDao dao = sqlSession.getMapper(FromDao.class);
		dao.hitUp(num);
	}

	@RequestMapping("/brdviews/not_From/content_view")
	public String content_view(HttpServletRequest request, Model model) {
		System.out.println("content_view passing");

		FromDao dao = sqlSession.getMapper(FromDao.class);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("curPage", request.getParameter("curPage"));
		map.put("searchType",request.getParameter("searchType"));
		map.put("searchkw",request.getParameter("searchkw"));
		model.addAttribute("map",map);
		
		String num = request.getParameter("not_num");
		System.out.println("content_view passing 으로 들어온 게시판번호=" + num);
		hitUp(num);
		model.addAttribute("content_view", dao.contentView(num));


		return "brdviews/not_From/content_view";
	}

	@RequestMapping(value = "/brdviews/not_From/replyView")
	@ResponseBody
	public Map<String, Object> replyview(HttpServletRequest request, Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage ) {
		System.out.println("replyView passing");

		FromDao dao = sqlSession.getMapper(FromDao.class);
		String bno = request.getParameter("not_bno");
		System.out.println("리플라이 뷰로도 게시판 번호가 넘어오나요?"+bno);
		

		int total = 0;
		total = dao.selectReplyCount(bno);
	    PageVO paging = new PageVO(total, curPage);
		
		int rowStart =paging.getRowStart();// 댓글 첫 시작 번호
		int rowEnd = paging.getRowEnd();// 댓글의 끝 번호
        
		
		List<Map<String, Object>> list = dao.readReply(bno,rowStart,rowEnd);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("total", total);
		map.put("paging", paging);
		
		return map;
			
	}

	@RequestMapping(value = "/brdviews/not_From/replyWrite")
	@ResponseBody
	public Map<String, Object> replyWrite(HttpServletRequest request, Model model ) {
		System.out.println("replyWrite passing");

		FromDao dao = sqlSession.getMapper(FromDao.class);

		String bno = request.getParameter("not_bno");
		String name = request.getParameter("not_rid");
		String content = request.getParameter("not_rcontent");

		System.out.println("replyWrite passing 으로 들어온 게시판 번호 =" + bno);
		System.out.println("replyWrite passing 으로 들어온 게시판 id =" + name);
		System.out.println("replyWrite passing 으로 들어온 게시판 content =" + content);

		dao.writeReply(bno, name, content);	

//		model.addAttribute("content_view", dao1.contentView(bno));
//		model.addAttribute("replyList", dao2.readReply(bno));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", 1);
	
		return map;

	}

	@RequestMapping("/brdviews/not_From/replyDelete")
	public String replyDelete(HttpServletRequest request, Model model) {
		System.out.println("replyDelete passing");

		FromDao dao = sqlSession.getMapper(FromDao.class);

		String rno = request.getParameter("not_rno");
		System.out.println("replyDelete passing으로 들어온 번호 =" + rno);
	
		dao.deleteReply(rno);
	
		return "brdviews/not_From/content_view";
	}

	 @RequestMapping("/brdviews/not_From/replyUpdate")
		public String replyUpdate(HttpServletRequest request, Model model) {
			System.out.println("replyUpdate passing");

			FromDao dao = sqlSession.getMapper(FromDao.class);

			String rno = request.getParameter("not_rno");
			String content = request.getParameter("not_rcontent");

			dao.updateReply(content, rno);
			
			return "/brdviews/not_From/content_view";
		}
//	 @RequestMapping("/brdviews/not_From/calendar")
//		public String calendar() {
//			
//			
//			return "/brdviews/not_From/calendar";
//		}
//		
//		@RequestMapping("/brdviews/not_From/calendar2")
//		public String calendar2() {
//			
//			
//			return "/brdviews/not_From/calendar2";
//		}
//	@RequestMapping(value = "/brdviews/not_From/community/imageUpload", method = RequestMethod.POST)
//    public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
//		System.out.println("이미지 업로드 구현 컨트롤러 (접속완료)~!");
// 
//        OutputStream out = null;
//        PrintWriter printWriter = null;
//        response.setCharacterEncoding("utf-8");
//        response.setContentType("text/html;charset=utf-8");
// 
//        try{
// 
//            String fileName = upload.getOriginalFilename();
//            byte[] bytes = upload.getBytes();
//            //uploadPath : 저장될 절대 경로
//            String uploadPath = "D:\\spring-set\\spring_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Twice_Notice1110\\resources\\ckstorage/" + fileName;//저장경로
// 
//            out = new FileOutputStream(new File(uploadPath));
//            out.write(bytes);
//            String callback = request.getParameter("CKEditorFuncNum");
// 
//            printWriter = response.getWriter();
//          //fileUrl : 경로,상대경로
//            String fileUrl = "resources/ckstorage/" + fileName;
// 
//            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
//                    + callback
//                    + ",'"
//                    + fileUrl
//                    + "','이미지를 업로드 하였습니다.'"
//                    + ")</script>");
//            printWriter.flush();
// 
//        }catch(IOException e){
//            e.printStackTrace();
//        } finally {
//            try {
//                if (out != null) {
//                    out.close();
//                }
//                if (printWriter != null) {
//                    printWriter.close();
//                }
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
// 
//        return;
//    }
}
