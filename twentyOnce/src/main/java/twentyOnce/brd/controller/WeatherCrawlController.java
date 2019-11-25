//package twentyOnce.brd.controller;
//
//import java.io.BufferedReader;
//import java.io.InputStreamReader;
//import java.nio.charset.Charset;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//
//import javax.activation.CommandMap;
//import javax.servlet.http.HttpServletRequest;
//
//import org.apache.http.HttpEntity;
//import org.apache.http.HttpResponse;
//import org.apache.http.client.HttpClient;
//import org.apache.http.client.methods.HttpPost;
//import org.apache.http.entity.ContentType;
//import org.apache.http.impl.client.HttpClientBuilder;
//import org.apache.ibatis.session.SqlSession;
//import org.apache.log4j.Logger;
//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Document;
//import org.jsoup.nodes.Element;
//import org.jsoup.select.Elements;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;
//
//import twentyOnce.brd.dao.WeatherCrawl;
//
//@Controller
//
//public class WeatherCrawlController {
//
//	Logger log = Logger.getLogger(this.getClass());
//
//	@RequestMapping(value = "/brdviews/weather/mainweather", method = RequestMethod.GET)
//	public String openWeather(Model model) throws Exception {
//		System.out.println("weather passing");
//		// WeatherCrawl crawler = new WeatherCrawl();
//		//
//		// ModelAndView mav = new ModelAndView("/brdviews/weather/mainweather");
//		//
//		// mav.addObject("weather_info", crawler.getWeatherInfo());
//		//
//		// return mav;
//		//
//		// String url="https://weather.naver.com/rgn/cityWetrMain.nhn";
//		//
//		// System.out.println("============");
//		// System.out.println("url : "+url);
//		// Document doc=Jsoup.connect(url).get();
//		// System.out.println(doc.toString());
//		//
//		// ArrayList<String> listn=new ArrayList<String>();
//		//
//		// Elements element=doc.select("#content");
//
//		// System.out.println("lskfj:"+element);
//		//
//		// System.out.println("====================");
//		// for (Element el :element.select("span.title")) {
//		// System.out.println(el.text());
//		// listn.add(el.text());
//		//
//		// }
//		// �궇�뵪 �겕濡ㅻ쭅 泥섎━
//		// �떆�옉�쟾 �떆媛� 湲곕줉
//		log.debug("start Date :" + getCurrentData());
//		
//		// 媛믪쓣 媛��졇�삱 http二쇱냼
//		HttpPost http = new HttpPost("https://weather.naver.com/world/worldWetrCtnt.nhn?worldRgnCd=WD00000004");
//		
//		// 媛��졇�삤湲곕�� �떎�뻾�븷 �겢�씪�씠�뼵�듃 媛앹껜 �깮�꽦
//		HttpClient httpClient = HttpClientBuilder.create().build();
//		
//		// �떎�뻾 諛� �떎�뻾 �뜲�씠�꽣瑜� response 媛앹껜�뿉 �떞�쓬
//		HttpResponse response = httpClient.execute(http);
//		
//		// reponse 諛쏆� �뜲�씠�꽣以묒뿉 dom�뜲�씠�꽣瑜� 媛��졇�� entity�뿉 �떞�쓬
//		HttpEntity entity = response.getEntity();
//		
//        //dom�쓽 而⑦뀗�듃 ���엯�쓣 媛��졇���꽌 charset�쓣 媛��졇�삩�떎.
//		ContentType contentType = ContentType.getOrDefault(entity);
//		Charset charset = contentType.getCharset();
//		
//        //dom �뜲�씠�꽣瑜� �븳 以꾩뵫 �씫湲� �쐞�빐 bufferedreader�뿉 �떞�쓬
//		BufferedReader br = new BufferedReader(new InputStreamReader(entity.getContent(), charset));
//        
//		//媛��졇�삩 dom�뜲�씠�꽣瑜� �떞湲곗쐞�빐 stringbuffer �깮�꽦
//		StringBuffer sb = new StringBuffer();
//		
//        //dom �뜲�씠�꽣瑜� 媛��졇�삤湲�
//		String line = "";
//		while ((line = br.readLine()) != null) {
//
//			sb.append(line + "\n");
//		}
//		//媛��졇�삩 dom濡쒓렇濡� 異쒕젰
//		log.debug(sb.toString());
//		
//        //jsoup�쑝濡� �뙆�떛
//		Document doc = Jsoup.parse(sb.toString());
//		
//        //dom�쁺�뿭�뿉�꽌 ""�븞�뿉 �븘�씠�뵒瑜� �궗�슜�븯�뒗 �깭洹� �꽑�깮
//		Elements el = doc.select("#content");
//
//		//�뿕由щ㉫�듃�쓽 �궡�슜以묒뿉 ""�빐�떦 �쁺�뿭�쓣 �궗�슜 �궘�젣
//		el.select(".world_search").remove();
//		
//		//�옉�뾽 �걹 �떆媛� 湲곕줉
//		log.debug("End Date : " + getCurrentData());
//		model.addAttribute("weather_info", el);
//		//------------------------------------------------------
////		 ArrayList<String> listn=new ArrayList<String>();
////		
////		 for (Elements element :el.select("span.title")) {
////			 System.out.println(el.text());
////			 listn.add(el.text());
////			 
////		}
//
//		return "/brdviews/weather/mainweather";
//	}
//
//	// �봽濡쒖꽭�뒪 泥섎━ �떆媛� 泥댄겕
//	public static String getCurrentData() {
//		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
//		return sdf.format(new Date());
//	}
//}
