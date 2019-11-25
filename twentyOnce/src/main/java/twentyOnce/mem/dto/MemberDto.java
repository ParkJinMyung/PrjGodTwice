package twentyOnce.mem.dto;

public class MemberDto {

	String id;
	String pw;
	String name;

	String phone;
	String email;
	String addr;

	int tier;
	int point;
	boolean admin;
	String salt;
	
	//로그인 승인값
	boolean flag;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public int getTier() {
		return tier;
	}
	public void setTier(int point) {
		MemberTier memtier=new MemberTier();
		
		tier=memtier.tierbypoint(point);
//		this.tier = tier;
	}
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	public boolean isAdmin() {
		return admin;
	}
	public void setAdmin(int type) { //관리자 여부
		
		if (type==1) { //관리자임
			admin=true;
			
		} else { //유저임
			admin=false;
		}
	}
	
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	
	
}
