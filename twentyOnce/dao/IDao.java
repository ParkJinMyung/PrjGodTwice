package twentyOnce.att.dao;

import java.util.ArrayList;

public interface IDao {

	ArrayList<String> stampSearch(String id, String date);

	void todayStamp(String id);

}
