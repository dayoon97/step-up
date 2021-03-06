package com.stepup.agile.projectFeedback.newsurvey.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.projectFeedback.model.vo.SurveyChoiceList;
import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.projectFeedback.model.vo.SurveyQuesList;
import com.stepup.agile.projectFeedback.newsurvey.model.dao.NewSurveyDao;
import com.stepup.agile.userInfo.model.vo.Member;

@Service
public class NewSurveyServiceImpl implements NewSurveyService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NewSurveyDao nd;
	
	@Override
	public int insertNewSurvey(Map<String, Object> map) {
		return nd.insertNewSurvey(sqlSession, map);
	}

	@Override
	public List<Sprint> selectEndSprint(Map<String, Object> map2) {
		return nd.selectEndSprint(sqlSession, map2);
	}

	@Override
	public List<SprintHistory> selectSprintName(Map<String, Object> map2) {
		return nd.selectSprintName(sqlSession, map2);
	}

	@Override
	public int insertNewSurveyMatch(int insertSurveyList) {
		return nd.insertNewSurveyMatch(sqlSession, insertSurveyList);
	}

	@Override
	public int insertNewQues(SurveyQuesList str) {
		return nd.insertNewQues(sqlSession, str);
	}

	@Override
	public int selectSurvey(Member m) {
		return nd.selectSurvey(sqlSession, m);
	}

	@Override
	public int insertNewChoice(SurveyChoiceList str) {
		return nd.insertNewChoice(sqlSession, str);
	}

	@Override
	public int insertQuesMatch(Map<String, Object> map) {
		return nd.insertQuesMatch(sqlSession, map);
	}


}
