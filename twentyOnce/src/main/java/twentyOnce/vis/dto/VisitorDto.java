package twentyOnce.vis.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class VisitorDto {
	
//	방문자 클래스(VisitorDto)
//	세션 아이디: String
//	회원 아이디: String
//	최초 접속시간(세션 생성 시간): int
//	마지막 접속시간(마지막 세션 접근 시간): int
//	방문한 페이지 수(컨트롤러): int​
	
	String sessionId;
	String memberId;
	String firstVisit; //SYSDATE
	String lastVisit; //SYSDATE
	int visitCount;
	
	public VisitorDto(String sessionId) {
		this.sessionId=sessionId; //세션 아이디
	}
	
//	public VisitorDto(String sessionId, long firstVisit) { //첫 방문
//		
//		
//		Date time=new Date();
//		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		
//		time.setTime(firstVisit);
//		
//		this.firstVisit=formatter.format(time); //최초 접속 시간
//	}
	
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getFirstVisit() {
		return firstVisit;
	}
	public void setFirstVisit(String firstVisit) {
		this.firstVisit = firstVisit;
	}
	public String getLastVisit() {
		return lastVisit;
	}
	public void setLastVisit(String lastVisit) {
		this.lastVisit = lastVisit;
	}
//	public void setLastVisit(long lastVisit) {
//		
//		Date time=new Date();
//		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		
//		time.setTime(lastVisit);
//		
//		this.lastVisit = formatter.format(time);
//	}
	public int getVisitCount() {
		return visitCount;
	}
	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}

}
