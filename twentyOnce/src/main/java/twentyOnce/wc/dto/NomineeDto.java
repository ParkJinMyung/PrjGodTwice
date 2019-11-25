package twentyOnce.wc.dto;

public class NomineeDto {
	
//	WCODE	NUMBER(3,0)
//	WTITLE	VARCHAR2(30 BYTE)
//	WMEMORY	VARCHAR2(50 BYTE)
//	WROUND	NUMBER(2,0)
//	WCHANCE	NUMBER(1,0)
//	WWIN	NUMBER(3,0)
//	WMATCH	NUMBER(3,0)
//	WCHAMPION	NUMBER(3,0)
//	WGAME NUMBER(3,0)
	
	int wc_code;
	String wc_title;
	String wc_memory;
	int wc_round;
	int wc_chance;
	int wc_win;
	int wc_match;
	int wc_champion;
	int wc_game;
	
	public int getWc_code() {
		return wc_code;
	}
	public void setWc_code(int wc_code) {
		this.wc_code = wc_code;
	}
	public String getWc_title() {
		return wc_title;
	}
	public void setWc_title(String wc_title) {
		this.wc_title = wc_title;
	}
	public String getWc_memory() {
		return wc_memory;
	}
	public void setWc_memory(String wc_memory) {
		this.wc_memory = wc_memory;
	}
	public int getWc_round() {
		return wc_round;
	}
	public void setWc_round(int wc_round) {
		this.wc_round = wc_round;
	}
	public int getWc_chance() {
		return wc_chance;
	}
	public void setWc_chance(int wc_chance) {
		this.wc_chance = wc_chance;
	}
	public int getWc_win() {
		return wc_win;
	}
	public void setWc_win(int wc_win) {
		this.wc_win = wc_win;
	}
	public int getWc_match() {
		return wc_match;
	}
	public void setWc_match(int wc_match) {
		this.wc_match = wc_match;
	}
	public int getWc_champion() {
		return wc_champion;
	}
	public void setWc_champion(int wc_champion) {
		this.wc_champion = wc_champion;
	}
	public int getWc_game() {
		return wc_game;
	}
	public void setWc_game(int wc_game) {
		this.wc_game = wc_game;
	}

}
