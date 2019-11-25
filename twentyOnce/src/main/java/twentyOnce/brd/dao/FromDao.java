package twentyOnce.brd.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import twentyOnce.brd.dto.FromDto;

public interface FromDao {
	public ArrayList<FromDto> list(int rowStart, int rowEnd, String searchKeyword, String string);

	public void write(String bname, String btitle, String bcontent);

	public void modify(String num, String bname, String btitle, String bcontent);

	public void delete(String num);

	public void hitUp(String num);

	public FromDto contentView(String num);

	public int selectBoardCount(String searchKeyword, String string);

	// 댓글 조회
	public List<Map<String, Object>> readReply(String bno, int rowStart, int rowEnd);

	// 댓글 작성
	public void writeReply(String bno, String name, String content);

	// 댓글 수정
	public void updateReply(String content, String bno);

	// 댓글 삭제
	public void deleteReply(String rno);

	// 게시판 댓글 카운팅
	public int selectReplyCount(String bno);
}
