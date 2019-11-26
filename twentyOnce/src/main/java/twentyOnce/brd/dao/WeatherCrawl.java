//package twentyOnce.brd.dao;
//
//import java.io.BufferedReader;
//import java.io.InputStreamReader;
//import java.nio.charset.Charset;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//
//import org.apache.http.HttpEntity;
//import org.apache.http.HttpResponse;
//import org.apache.http.client.HttpClient;
//import org.apache.http.client.methods.HttpPost;
//import org.apache.http.entity.ContentType;
//import org.apache.http.impl.client.HttpClientBuilder;
//import org.apache.log4j.Logger;
//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Document;
//import org.jsoup.select.Elements;
//
//public class WeatherCrawl {
//	Logger log  = Logger.getLogger(this.getClass());
//	
//	//�봽濡쒖꽭�뒪 泥섎━ �떆媛� 泥댄겕
//	public static String getCurrentData() {
//		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
//		return sdf.format(new Date());
//	}
//	//�꽕�씠踰� �궇�뵪 �겕濡ㅻ쭅 硫붿냼�뱶
//	
//	public Object getWeatherInfo() throws Exception {
//		log.debug("start Date :"+ getCurrentData());
//		
//		HttpPost http = new HttpPost("https://weather.naver.com/rgn/cityWetrMain.nhn");
//		
//		HttpClient httpClient = HttpClientBuilder.create().build();
//		
//		HttpResponse response = httpClient.execute(http);
//		
//		HttpEntity entity = response.getEntity();
//		
//		ContentType contentType = ContentType.getOrDefault(entity);
//		Charset charset = contentType.getCharset();
//		
//		
//		BufferedReader br = new BufferedReader(new InputStreamReader(entity.getContent(),charset));
//		
//		StringBuffer sb = new StringBuffer();
//		
//		String line = "";
//		while ((line=br.readLine())!=null) {
//			
//			sb.append(line+"\n");
//		}
//			log.debug(sb.toString());
//			
//			Document doc = Jsoup.parse(sb.toString());
//			
//			Elements  el = 	doc.select("#content");
//			
//			el.select(".today_map").remove();
//			
//			log.debug("End Date : "+getCurrentData());
//			
//			return el;
//		}
//	}
//	
