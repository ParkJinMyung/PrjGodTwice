package twentyOnce.wc.dto;

public class WorldcupProgress {
	
	int thisRound;
	int nextMatch;
	
	public WorldcupProgress(int thisRound, int nextMatch) {
		this.thisRound=thisRound;
		this.nextMatch=nextMatch;
	}
	
	public int getThisRound() {
		return thisRound;
	}
	public void setThisRound(int thisRound) {
		this.thisRound = thisRound;
	}
	public int getNextMatch() {
		return nextMatch;
	}
	public void setNextMatch(int nextMatch) {
		this.nextMatch = nextMatch;
	}

}
