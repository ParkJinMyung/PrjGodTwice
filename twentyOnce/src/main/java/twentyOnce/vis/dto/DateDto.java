package twentyOnce.vis.dto;

public class DateDto {
	
	//입력 날짜
	int year;
	int month;
	int day;
	
	//실제 날짜
	int currYear;
	int currMonth;
	int currDay;
	
	public DateDto() {
	}
	
	public DateDto(int year, int month, int day, int currYear, int currMonth, int currDay) {
		
		this.year=year;
		this.month=month;
		this.day=day;
		
		this.currYear=currYear;
		this.currMonth=currMonth;
		this.currDay=currDay;
		
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getCurrYear() {
		return currYear;
	}

	public void setCurrYear(int currYear) {
		this.currYear = currYear;
	}

	public int getCurrMonth() {
		return currMonth;
	}

	public void setCurrMonth(int currMonth) {
		this.currMonth = currMonth;
	}

	public int getCurrDay() {
		return currDay;
	}

	public void setCurrDay(int currDay) {
		this.currDay = currDay;
	}

}
