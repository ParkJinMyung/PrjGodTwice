package twentyOnce.qz.dto;

public class QuizProgress {
	
	int quizturn;
	int correctnum;
	
	public QuizProgress(int quizturn, int correctnum) {
		this.quizturn=quizturn;
		this.correctnum=correctnum;
	}
	
	public int getQuizturn() {
		return quizturn;
	}
	public void setQuizturn(int quizturn) {
		this.quizturn = quizturn;
	}
	public int getCorrectnum() {
		return correctnum;
	}
	public void setCorrectnum(int correctnum) {
		this.correctnum = correctnum;
	}

}
