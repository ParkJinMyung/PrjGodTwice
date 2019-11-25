package twentyOnce.sto.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.security.Provider.Service;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.parsing.GenericTokenParser;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartFilter;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import twentyOnce.mem.dto.MemberDto;
import twentyOnce.sto.dao.IDao;
import twentyOnce.sto.dto.CartVo;
import twentyOnce.sto.dto.OrderDetailVO;
import twentyOnce.sto.dto.OrderListVO;
import twentyOnce.sto.dto.ProductDto;
import twentyOnce.sto.utils.UploadFileUtils;

/*@RequestMapping("/stoviews")*/
@Controller
public class StoController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping("/stoviews/list")
	public String list(HttpServletRequest request, Model model) {
		System.out.println("list passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		String sto_name=request.getParameter("sto_name");
		String sto_price=request.getParameter("sto_price");
		String sto_date=request.getParameter("sto_date");
		String sto_code=request.getParameter("sto_code");
		String sto_country=request.getParameter("sto_country");
		String sto_quantity=request.getParameter("sto_quantity");
		String sto_imageurl=request.getParameter("sto_imageurl");
		
		model.addAttribute("list",dao.list(sto_name, sto_price, sto_date, sto_code,
				sto_country, sto_quantity, sto_imageurl));
		
		//list濡� 蹂대궡湲�
		return "stoviews/list";
	}
	
	@RequestMapping("/stoviews/openWin")
	public void openWin() {
		System.out.println("openWin passing");
	}
	
	@RequestMapping("/mainviews/profile")
	public void profile() {
		System.out.println("profile passing");
	}
	
	@RequestMapping("/mainviews/gallery")
	public void gallery() {
		System.out.println("gallery passing");
	}
	
	@RequestMapping("/mainviews/video")
	public void video() {
		System.out.println("video passing");
	}
	
	@RequestMapping("/stoviews/write_view")
	public String write_view() {
		System.out.println("write_view passing");
		return "stoviews/write_view";
	}
	
	@RequestMapping("/stoviews/write")
	public String write(ProductDto dto, HttpServletRequest request,Model model, MultipartFile file) throws Exception {
		System.out.println("write passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName=null;
		
		System.out.println("File: "+file);
		
		if (file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		}else {	
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		String sto_name=request.getParameter("sto_name");
		String sto_price=request.getParameter("sto_price");
		String sto_date=request.getParameter("sto_date");
		String sto_code=request.getParameter("sto_code");
		String sto_country=request.getParameter("sto_country");
		String sto_quantity=request.getParameter("sto_quantity");
		String sto_imageurll=File.separator + "imgUpload" + ymdPath + File.separator + fileName;
		String sto_contant=request.getParameter("sto_contant");
		String sto_detailimageurll1=File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName; 
		String sto_detailimageurll2=File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName; 
		String sto_detailimageurll3=File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName; 
		
		String sto_imageurl=request.getParameter(sto_imageurll);
		String sto_detailimageurl1=request.getParameter(sto_detailimageurll1);
		String sto_detailimageurl2=request.getParameter(sto_detailimageurll2);
		String sto_detailimageurl3=request.getParameter(sto_detailimageurll3);
				
		/*dto.setSto_imageurl(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setSto_detailimageurl1(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		dto.setSto_detailimageurl2(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		dto.setSto_detailimageurl3(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);*/
		
		System.out.println("sto name"+sto_name);
		System.out.println("sto_price"+sto_price);
		System.out.println("sto_quantity"+sto_quantity);
		System.out.println("sto_imageurl: "+sto_imageurl);
		System.out.println("sto_detailimageurl1: "+sto_detailimageurl1);
		System.out.println("sto_detailimageurl2: "+sto_detailimageurl2);
		System.out.println("sto_detailimageurl2: "+sto_detailimageurl3);
		
		dao.write(sto_name, sto_code, sto_date, sto_price, sto_country, sto_quantity, sto_imageurl, sto_contant, sto_detailimageurl1, sto_detailimageurl2, sto_detailimageurl3);
		
		/*return "redirect:stoviews/list";*/
		return "redirect:/stoviews/list";
	}
	
	@RequestMapping("/stoviews/download")
	public String download(HttpServletRequest request,
			HttpServletResponse response,Model model) throws Exception {
		System.out.println("download passing");
		
		String path=request.getParameter("p");
		String fname=request.getParameter("f");	
		String bid=request.getParameter("bid");
		
//		response.setHeader("Content-Disposition", "attatchment;filename="+fname);
		response.setHeader("Content-Disposition",
				"attatchment;filename="+URLEncoder.encode(fname,"UTF-8"));
		
		String attachPath="resources\\upload\\";	
		String realPath=request.getSession().
				getServletContext().getRealPath(attachPath)+"\\"+fname;
		
		FileInputStream fin=new FileInputStream(realPath);
		ServletOutputStream sout=response.getOutputStream();
		
		byte[] buf=new byte[1024];
		int size=0;
		while ((size=fin.read(buf,0,1024))!=-1) {
			sout.write(buf,0,size);
		}
		fin.close();
		sout.close();
		
		return "stoviews/content_view?bid="+bid;
	}
	
	@RequestMapping("/stoviews/content_view")
	public String content_view(HttpServletRequest request,Model model) {
		System.out.println("content_view passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		String sto_code=request.getParameter("sto_code");
		System.out.println("sto_code: "+sto_code);
		//�긽�뭹�젙蹂� 媛��졇�샂`
		ProductDto productdto=dao.contentView(sto_code);
		int stoPrice=productdto.getSto_price();
		System.out.println("stoPrice: "+stoPrice);
		//硫ㅻ쾭�젙蹂� 媛��졇�샂
		MemberDto memdto=(MemberDto)request.getSession().getAttribute("memdto");
		//�쉶�썝�븷�씤媛� �젙�븿
		productdto.setMem_price(memBenefit(stoPrice, memdto.getTier()));
		//
		
		model.addAttribute("content_view", productdto);
		
		return "stoviews/content_view";
	}
	
	/*
	 * �긽�뭹�쓣 寃��깋�빐�꽌
	 * �뜲�씠�꽣瑜� 諛붾줈 蹂대궡�뒗�뜲,
	 * �뜲�씠�꽣瑜� 諛붾줈 蹂대궡吏� �븡怨�,
	 * �슦由ш� 蹂� �닔 �엳�뼱�빞�릺.
	 */
	
	
	private int memBenefit(int stoPrice, int tier) {
		System.out.println("memBenefit() passing");
		
		int memPrice=stoPrice;
		
		if (tier==0) {
			memPrice=stoPrice;
		} else if (tier==1) {
			memPrice=(int)(stoPrice*0.99);
			System.out.println("memPrice: "+memPrice);
		} else if (tier==2) {
			memPrice=(int)(stoPrice*0.98);
		} else if (tier==3) {
			memPrice=(int)(stoPrice*0.97);
		} else if (tier==4) {
			memPrice=(int)(stoPrice*0.96);
		}
		
		return memPrice;
	}

	@RequestMapping("/stoviews/modify_view")
	public String modify_view(HttpServletRequest request,Model model) {
		System.out.println("modify_view passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		String sto_code=request.getParameter("sto_code");
		model.addAttribute("modify_view",dao.contentView(sto_code));
		return "stoviews/modify_view";
	}
	
	@RequestMapping("/stoviews/modify")
	public String modify(HttpServletRequest request,Model model) {
		System.out.println("modify passing");

		IDao dao=sqlSession.getMapper(IDao.class);
		String sto_name=request.getParameter("sto_name");
		String sto_code=request.getParameter("sto_code");
		System.out.println("sto code: "+sto_code);
		String sto_price=request.getParameter("sto_price");
		String sto_country=request.getParameter("sto_country");
		String sto_quantity=request.getParameter("sto_quantity");
		String sto_contant=request.getParameter("sto_contant");
		
		dao.modify(sto_name, sto_code, sto_price, sto_country, sto_quantity, sto_contant);
		return "redirect:/stoviews/list";
	}
	
	@RequestMapping("/stoviews/deleteCart")
	public String deleteCart(@RequestParam(value = "chbox[]") List<String> chArr, CartVo cart, HttpSession session, HttpServletRequest request,Model model) {
		System.out.println("deleteCart passing");

		MemberDto member=(MemberDto) session.getAttribute("id");
		int result=0;
				
		IDao dao=sqlSession.getMapper(IDao.class);
		String userId=request.getParameter("userId");
		int cartNum=Integer.parseInt(request.getParameter("cartNum"));
		
		if (member != null) {
			cart.setUserId(userId);
			
			for (String i : chArr) {
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);	
				dao.deleteCart(cartNum, userId);
			}
			result=1;
		}
		
		return "redirect:/stoviews/list";
	}
	
	@RequestMapping("/stoviews/delete")
	public String delete(HttpServletRequest request,Model model) {
		System.out.println("delete passing");
			
		IDao dao=sqlSession.getMapper(IDao.class);
		String sto_code=request.getParameter("sto_code");
		
		System.out.println("sto_code : "+sto_code);
		
		dao.delete(sto_code);
		return "redirect:/stoviews/list";
	}
	
	@RequestMapping("/stoviews/orderList")
	public String orderList(HttpServletRequest request,Model model) {
		System.out.println("orderList passing");
			
		IDao dao=sqlSession.getMapper(IDao.class);
		
		String userId = request.getParameter("userId");
		model.addAttribute("orderList", dao.orderList(userId));
		
		return "stoviews/orderList";
	}
	
	@RequestMapping("/stoviews/orderView")
	public String orderView(HttpServletRequest request,Model model) {
		System.out.println("orderView passing");
		IDao dao=sqlSession.getMapper(IDao.class);
		String userId=request.getParameter("userId");
		String orderId=request.getParameter("orderId");
		
		System.out.println("userid: "+userId);
		System.out.println("orderId: "+orderId);
		
		model.addAttribute("orderView", dao.orderView(userId, orderId));
		return "stoviews/orderView";
	}
	
	
	@RequestMapping("/stoviews/addcart")
	public String addcart(HttpServletRequest request,
			HttpServletResponse response,Model model) throws Exception {
		System.out.println("addcart passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		
		String userId=request.getParameter("userId");
		String gdsNum=request.getParameter("gdsNum");
		String cartStock=request.getParameter("cartStock");
		
		System.out.println("userId: "+userId);
		System.out.println("gdsNum: "+gdsNum);
		System.out.println("cartStock: "+cartStock);
		
		dao.addcart(userId, gdsNum, cartStock);
		
		return "redirect:/stoviews/list";
	}
	
	@RequestMapping("/stoviews/orderInfo")
	public String orderInfo(HttpSession session, HttpServletRequest request, Model model) {
		System.out.println("orderInfo passing");

		IDao dao=sqlSession.getMapper(IDao.class);
		
		// 二쇰Ц 踰덊샇 �옖�뜡 媛믪쓣 戮묒븘 �깮�꽦�븯湲�		
		String orderId=request.getParameter("orderId"); 
		String userId=request.getParameter("userId");
		String orderRec=request.getParameter("orderRec");
		String userAddr1=request.getParameter("userAddr1");
		String userAddr2=request.getParameter("userAddr2");	
		String userAddr3=request.getParameter("userAddr3");
		String orderPhone=request.getParameter("orderPhone");
		String amount=request.getParameter("amount");
		String orderDate=request.getParameter("orderDate");
		
		dao.orderInfo(orderId, userId, orderRec, userAddr1, userAddr2, userAddr3, orderPhone, amount, orderDate);
		dao.orderInfo_Details(orderId);
		dao.cartAllDelete(userId);
		
		return "redirect:/stoviews/orderList?userId="+userId;
	}
	
	@RequestMapping("/stoviews/order_view")
	public String order_view(HttpServletRequest request,Model model) {
		System.out.println("order_view passing");
		IDao dao=sqlSession.getMapper(IDao.class);
		String sto_code=request.getParameter("sto_code");
		
		model.addAttribute("order_view", dao.order_view(sto_code));
		return "stoviews/order_view";
	}
	
	
	@RequestMapping("/stoviews/cartAllDelete")
	public String cartAllDelete(HttpSession session, HttpServletRequest request, Model model) {
		System.out.println("cartAllDelete passing");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		
		String userId=request.getParameter("userId");
		System.out.println("userId �궘�젣: "+userId);
		
		dao.cartAllDelete(userId);
		
		return "redirect:/stoviews/orderList";
	}
	
	@RequestMapping("/stoviews/cartList")
	public String cartList(HttpServletRequest request,Model model) {
		System.out.println("cartList passing");
		
		IDao dao = sqlSession.getMapper(IDao.class);		
		
		Calendar cal = Calendar.getInstance(); // �떖�젰 
		int year = cal.get(Calendar.YEAR); // �뀈�룄 
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1); // �썡
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE)); // �씪
		String subNum="";
		
		for (int i = 0; i <= 6; i++) {
			subNum += (Math.random() * 10);
		}
		
		String orderId = ymd + "_" + subNum;
		String userId = request.getParameter("userId");
		
		model.addAttribute("cartList", dao.cartList(userId));
		
		//list濡� 蹂대궡湲�
		return "stoviews/cartList";
	}
	
	@RequestMapping("/stoviews/delivery")
	public String delivery(HttpServletRequest request, Model model) {
		System.out.println("delivery passing");
		
		IDao dao = sqlSession.getMapper(IDao.class);		
		
		String delivery=request.getParameter("delivery");
		String orderId=request.getParameter("orderId");
		
		System.out.println("delivery 媛�: "+delivery);
		
		dao.delivery(delivery, orderId);
		
		return "redirect:/stoviews/list";
	}
}