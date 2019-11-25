package twentyOnce.vis.dto;

public class StatsDto {
	
	int totalviews;
	int dailyviews;
	int weeklyviews;
	int monthlyviews;
	
	String standardTime;
	int avgviews;
	
	int twoweeksviews;
	int avgpageviews;
	int avgusemins;
	String maxuseid;
	
	public StatsDto() {
		// TODO Auto-generated constructor stub
	}
	
	public StatsDto(int totalviews,int dailyviews,int weeklyviews,int monthlyviews,
			String standardTime, int avgviews,
			int twoweeksviews, int avgpageviews, int avgusemins, String maxuseid) {
		this.totalviews=totalviews;
		this.dailyviews=dailyviews;
		this.weeklyviews=weeklyviews;
		this.monthlyviews=monthlyviews;
		
		this.standardTime=standardTime;
		this.avgviews=avgviews;
		
		this.twoweeksviews=twoweeksviews;
		this.avgpageviews=avgpageviews;
		this.avgusemins=avgusemins;
		this.maxuseid=maxuseid;
	}

	public int getTotalviews() {
		return totalviews;
	}

	public void setTotalviews(int totalviews) {
		this.totalviews = totalviews;
	}

	public int getDailyviews() {
		return dailyviews;
	}

	public void setDailyviews(int dailyviews) {
		this.dailyviews = dailyviews;
	}

	public int getWeeklyviews() {
		return weeklyviews;
	}

	public void setWeeklyviews(int weeklyviews) {
		this.weeklyviews = weeklyviews;
	}

	public int getMonthlyviews() {
		return monthlyviews;
	}

	public void setMonthlyviews(int monthlyviews) {
		this.monthlyviews = monthlyviews;
	}

	public String getStandardTime() {
		return standardTime;
	}

	public void setStandardTime(String standardTime) {
		this.standardTime = standardTime;
	}

	public int getAvgviews() {
		return avgviews;
	}

	public void setAvgviews(int avgviews) {
		this.avgviews = avgviews;
	}

	public int getTwoweeksviews() {
		return twoweeksviews;
	}

	public void setTwoweeksviews(int twoweeksviews) {
		this.twoweeksviews = twoweeksviews;
	}

	public int getAvgpageviews() {
		return avgpageviews;
	}

	public void setAvgpageviews(int avgpageviews) {
		this.avgpageviews = avgpageviews;
	}

	public int getAvgusemins() {
		return avgusemins;
	}

	public void setAvgusemins(int avgusemins) {
		this.avgusemins = avgusemins;
	}

	public String getMaxuseid() {
		return maxuseid;
	}

	public void setMaxuseid(String maxuseid) {
		this.maxuseid = maxuseid;
	}

}
