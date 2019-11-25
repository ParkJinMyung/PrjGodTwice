package twentyOnce.qz.dao;

import twentyOnce.qz.dto.QuizDto;

public interface IDao {

	QuizDto quizGet(int quizturn);

	void quizAdd(String quiz, String choicea, String choiceb, String choicec, String choiced, String choicee,
			int answer);

//	void mempointUpdate(String userid, int point);

}
