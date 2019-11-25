package twentyOnce.mem.dto;

public class SaveIdDto {
	
//	IDS_ID VARCHAR2(20),
//	IDS_PW VARCHAR2(20)
	
	String ids_id;
	String ids_pw;
	String check="checked='checked'";
	
	public String getIds_id() {
		return ids_id;
	}
	public void setIds_id(String ids_id) {
		this.ids_id = ids_id;
	}
	public String getIds_pw() {
		return ids_pw;
	}
	public void setIds_pw(String ids_pw) {
		this.ids_pw = ids_pw;
	}
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}

}
