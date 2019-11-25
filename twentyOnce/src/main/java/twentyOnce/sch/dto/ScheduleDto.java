package twentyOnce.sch.dto;

public class ScheduleDto {
	
//	CAL_CODE	NUMBER(3,0)
//	CAL_DATE	DATE
//	CAL_TITLE	VARCHAR2(20 BYTE)
//	CAL_CONTENT	VARCHAR2(60 BYTE)
//	CAL_LOCATION	VARCHAR2(30 BYTE)
	
	private int sch_code;
	private String sch_date;
	private String sch_title;
	private String sch_content;
	private String sch_location;
	
	public int getSch_code() {
		return sch_code;
	}
	public void setSch_code(int sch_code) {
		this.sch_code = sch_code;
	}
	public String getSch_date() {
		return sch_date;
	}
	public void setSch_date(String sch_date) {
		this.sch_date = sch_date;
	}
	public String getSch_title() {
		return sch_title;
	}
	public void setSch_title(String sch_title) {
		this.sch_title = sch_title;
	}
	public String getSch_content() {
		return sch_content;
	}
	public void setSch_content(String sch_content) {
		this.sch_content = sch_content;
	}
	public String getSch_location() {
		return sch_location;
	}
	public void setSch_location(String sch_location) {
		this.sch_location = sch_location;
	}
	
}