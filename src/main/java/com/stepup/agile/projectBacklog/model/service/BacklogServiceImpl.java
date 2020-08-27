package com.stepup.agile.projectBacklog.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectBacklog.model.dao.BacklogDao;
import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.userInfo.model.vo.Member;

@Service
public class BacklogServiceImpl implements BacklogService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BacklogDao bd;
	
	@Override
	public List<Sprint> selectSprint(Member m) {
		
		return bd.selectSprint(sqlSession, m);
	}

	@Override
	public int insertSprint(int userProjectCode) {
		return bd.insertSprint(sqlSession, userProjectCode);
	}

	@Override
	public SprintHistory selectSprintOne(Member m, int sprintCode) {
		// TODO Auto-generated method stub
		return bd.selectSprintOne(sqlSession, m, sprintCode);
	}

}
