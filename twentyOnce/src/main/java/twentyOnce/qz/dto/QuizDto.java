package twentyOnce.qz.dto;

public class QuizDto {
	
//	QCODE			NUMBER(3,0)
//	QQUIZ			VARCHAR2(50 BYTE)
//	QCHOICEA	VARCHAR2(20 BYTE)
//	QCHOICEB	VARCHAR2(20 BYTE)
//	QCHOICEC	VARCHAR2(20 BYTE)
//	QCHOICED	VARCHAR2(20 BYTE)
//	QCHOICEE	VARCHAR2(20 BYTE)
//	QANSWER		NUMBER(1,0)
	
	int qz_code;
	String qz_quiz;
	String qz_choicea;
	String qz_choiceb;
	String qz_choicec;
	String qz_choiced;
	String qz_choicee;
	int qz_answer;
	
	public int getQz_code() {
		return qz_code;
	}
	public void setQz_code(int qz_code) {
		this.qz_code = qz_code;
	}
	public String getQz_quiz() {
		return qz_quiz;
	}
	public void setQz_quiz(String qz_quiz) {
		this.qz_quiz = qz_quiz;
	}
	public String getQz_choicea() {
		return qz_choicea;
	}
	public void setQz_choicea(String qz_choicea) {
		this.qz_choicea = qz_choicea;
	}
	public String getQz_choiceb() {
		return qz_choiceb;
	}
	public void setQz_choiceb(String qz_choiceb) {
		this.qz_choiceb = qz_choiceb;
	}
	public String getQz_choicec() {
		return qz_choicec;
	}
	public void setQz_choicec(String qz_choicec) {
		this.qz_choicec = qz_choicec;
	}
	public String getQz_choiced() {
		return qz_choiced;
	}
	public void setQz_choiced(String qz_choiced) {
		this.qz_choiced = qz_choiced;
	}
	public String getQz_choicee() {
		return qz_choicee;
	}
	public void setQz_choicee(String qz_choicee) {
		this.qz_choicee = qz_choicee;
	}
	public int getQz_answer() {
		return qz_answer;
	}
	public void setQz_answer(int qz_answer) {
		this.qz_answer = qz_answer;
	}

}
