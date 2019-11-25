package twentyOnce.vis.dao;

import java.util.ArrayList;

import twentyOnce.vis.dto.GraphDto;

public interface VDao {

	void visitUpdate(String memberId, int visitCount, String sessionId);

	void firstVisit(String sessionId);
	
	/////

	int monthlyviewsGet();

	int weeklyviewsGet();

	int dailyviewsGet();

	int totalviewsGet();
	
	/////

	ArrayList<GraphDto> graphviewsGet();
	
	/////

	String maxuseidGet(int sysminus);

	Integer avguseminsGet(int sysminus);

	Integer avgpageviewsGet(int sysminus);

	Integer twoweeksviewsGet(int sysminus);

}
