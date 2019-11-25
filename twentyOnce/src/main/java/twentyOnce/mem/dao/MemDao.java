package twentyOnce.mem.dao;

import twentyOnce.mem.dto.MemberDto;
import twentyOnce.mem.dto.SaveIdDto;

public interface MemDao {
	
	//JoinController 사용
	String dupidCheck(String id);
	
	//JoinController 사용
	void memberJoin(String id, String pw, String name, String phone, String email, String addr, String salt);
	
	//LogController 사용
	MemberDto memberCheck(String reqid);

	//point 업데이트(다른 기능도 사용)
	void mempointUpdate(String userid, int point);

	void pwChange(String id, String cryptPw, String salt);

	void saveidDel();

	void saveidAdd(String reqid, String reqpw);

	SaveIdDto saveidSearch();

}
