package com.stepup.agile.userMyTasks.model.service;

import java.util.List;
import java.util.Map;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.vo.MyTask;
import com.stepup.agile.userMyTasks.model.vo.MyTaskShare;
import com.stepup.agile.userMyTasks.model.vo.UserProject;
 
public interface MyTasksService {

	List<MyTask> selectTaskList(Member m);

	int updateMyTaskYN(Member m, String myTasksTodoYN, int myTasksCode);

	int updateMyTask(MyTask mytask);

	int insertMyTask(MyTask mytask);

	int deleteMyTask(MyTask mytask);

	List<MyTask> selectShareMyTasks(Member m);

	int insertShareMyTask(MyTaskShare mytask);

	List<UserProject> selectUserProjectCode(Member m);

	int updateMyTaskShareNum(Member m, int myTasksCode, int userProjectCode);

	
}
