package twentyOnce.brd.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import twentyOnce.brd.dao.WeatherCrawl;

@Controller

public class WeatherCrawlController {

	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/brdviews/weather/mainweather", method = RequestMethod.GET)
	public String openWeather(Model model) throws Exception {
		System.out.println("weather passing");
		// WeatherCrawl crawler = new WeatherCrawl();
		//
		// ModelAndView mav = new ModelAndView("/brdviews/weather/mainweather");
		//
		// mav.addObject("weather_info", crawler.getWeatherInfo());
		//
		// return mav;
		//
		// String url="https://weather.naver.com/rgn/cityWetrMain.nhn";
		//
		// System.out.println("============");
		// System.out.println("url : "+url);
		// Document doc=Jsoup.connect(url).get();
		// System.out.println(doc.toString());
		//
		// ArrayList<String> listn=new ArrayList<String>();
		//
		// Elements element=doc.select("#content");

		// System.out.println("lskfj:"+element);
		//
		// System.out.println("====================");
		// for (Element el :element.select("span.title")) {
		// System.out.println(el.text());
		// listn.add(el.text());
		//
		// }
		// 날씨 크롤링 처리
		// 시작전 시간 기록
		log.debug("start Date :" + getCurrentData());
		
		// 값을 가져올 http주소
		HttpPost http = new HttpPost("https://weather.naver.com/world/worldWetrCtnt.nhn?worldRgnCd=WD00000004");
		
		// 가져오기를 실행할 클라이언트 객체 생성
		HttpClient httpClient = HttpClientBuilder.create().build();
		
		// 실행 및 실행 데이터를 response 객체에 담음
		HttpResponse response = httpClient.execute(http);
		
		// reponse 받은 데이터중에 dom데이터를 가져와 entity에 담음
		HttpEntity entity = response.getEntity();
		
        //dom의 컨텐트 타입을 가져와서 charset을 가져온다.
		ContentType contentType = ContentType.getOrDefault(entity);
		Charset charset = contentType.getCharset();
		
        //dom 데이터를 한 줄씩 읽기 위해 bufferedreader에 담음
		BufferedReader br = new BufferedReader(new InputStreamReader(entity.getContent(), charset));
        
		//가져온 dom데이터를 담기위해 stringbuffer 생성
		StringBuffer sb = new StringBuffer();
		
        //dom 데이터를 가져오기
		String line = "";
		while ((line = br.readLine()) != null) {

			sb.append(line + "\n");
		}
		//가져온 dom로그로 출력
		log.debug(sb.toString());
		
        //jsoup으로 파싱
		Document doc = Jsoup.parse(sb.toString());
		
        //dom영역에서 ""안에 아이디를 사용하는 태그 선택
		Elements el = doc.select("#content");

		//엘리먼트의 내용중에 ""해당 영역을 사용 삭제
		el.select(".world_search").remove();
		
		//작업 끝 시간 기록
		log.debug("End Date : " + getCurrentData());
		model.addAttribute("weather_info", el);
		//------------------------------------------------------
//		 ArrayList<String> listn=new ArrayList<String>();
//		
//		 for (Elements element :el.select("span.title")) {
//			 System.out.println(el.text());
//			 listn.add(el.text());
//			 
//		}

		return "/brdviews/weather/mainweather";
	}

	// 프로세스 처리 시간 체크
	public static String getCurrentData() {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
		return sdf.format(new Date());
	}
}
