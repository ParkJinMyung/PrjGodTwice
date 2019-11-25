package twentyOnce.brd.dto;

import java.sql.Timestamp;

public class TODto {
	private int not_num;
	private String not_title;
	private String not_content;
	private String not_name;
	private Timestamp not_date;
	private int not_view;

	public int getNot_num() {
		return not_num;
	}

	public void setNot_num(int not_num) {
		this.not_num = not_num;
	}

	public String getNot_title() {
		return not_title;
	}

	public void setNot_title(String not_title) {
		this.not_title = not_title;
	}

	public String getNot_content() {
		return not_content;
	}

	public void setNot_content(String not_content) {
		this.not_content = not_content;
	}

	public String getNot_name() {
		return not_name;
	}

	public void setNot_name(String not_name) {
		this.not_name = not_name;
	}

	public Timestamp getNot_date() {
		return not_date;
	}

	public void setNot_date(Timestamp not_date) {
		this.not_date = not_date;
	}

	public int getNot_view() {
		return not_view;
	}

	public void setNot_view(int not_view) {
		this.not_view = not_view;
	}

}
