package twentyOnce.sch.dto;

import java.util.Calendar;

public class CalendarResource {
	
	int currYear;
	int currMonth;
	
	Calendar c;
	Calendar cal;
	
	public CalendarResource(int currYear, int currMonth, Calendar c, Calendar cal) {
		this.currYear=currYear;
		this.currMonth=currMonth;
		this.c=c;
		this.cal=cal;
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
	
	public Calendar getC() {
		return c;
	}
	public void setC(Calendar c) {
		this.c = c;
	}
	public Calendar getCal() {
		return cal;
	}
	public void setCal(Calendar cal) {
		this.cal = cal;
	}

}
