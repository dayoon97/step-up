package com.stepup.agile.projectTask.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface TaskService {
	
	int createTask(Member m, TaskList t);

	int updateTitle(Member m, TaskHistory th);

	String selectTitle(int taskHistCode, TaskHistory th);

	List<TaskHistory> selectUserTask(Member m);

	String selectPjNonTask(Map<String, Object> map);

	List<TaskHistory> selectBugTask(Member m);

	List<TaskList> selectBugCont(HashMap<String, Object> map);

	int insertCloneBug(HashMap<String, Object> map);

	int insertCloneBug2(HashMap<String, Object> map2);

	int deleteCloneBug(HashMap<String, Object> map);

	List<TaskHistory> searchBug(HashMap<String, Object> map);
}
