package twentyOnce.wc.dao;

import java.util.ArrayList;

import twentyOnce.wc.dto.NomineeDto;

public interface IDao {
	
	//吏꾪뻾以�

	void winnerUpdate(int thisRound, int lastWinner);
	
	void loserUpdate(int lastLoser);

	ArrayList<NomineeDto> searchNominee(int thisRound);
	
	//留덈Т由�

	void championUpdate(int lastWinner);

	NomineeDto bringChampion(int lastWinner);

	void resetWc();

	ArrayList<NomineeDto> statsView();
	
}
