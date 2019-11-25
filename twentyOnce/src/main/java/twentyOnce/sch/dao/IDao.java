package twentyOnce.sch.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.MapKey;

import twentyOnce.sch.dto.ScheduleDto;

public interface IDao {

//	@MapKey("SDATE")
//	HashMap<String, String> searchSchedule(String date);

	ArrayList<String> searchDate(String date);

	ArrayList<String> searchTitle(String date);

	ArrayList<String> searchCode(String date);

	ScheduleDto getSchedule(int code);

//	void scheduleAdd1(String date, String title, String content, String location);
//
//	void scheduleAdd2(String date, String title, String content);

	void scheduleAdd(String date, String title, String content, String location);

}
