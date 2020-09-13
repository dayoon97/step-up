package com.stepup.agile.projectFeedback.newsurvey.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectFeedback.model.vo.SurveyQuesList;
import com.stepup.agile.projectFeedback.newsurvey.model.service.NewSurveyService;
import com.stepup.agile.userInfo.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class NewSurveyController {

	@Autowired
	private NewSurveyService ns;
	
	@RequestMapping("selectEndSprint.sv")
	public String selectEndSprint(Model model, @ModelAttribute("loginUser") Member m) {
		List<Sprint> endSprintList = new ArrayList<Sprint>();
		endSprintList = ns.selectEndSprint(m);
		
		
		model.addAttribute("endSprintList", endSprintList);
		
		return "projectFeedback/survey";
	}
	
	
	@RequestMapping("newSurvey.sv")
	public ModelAndView newSurvey(Model model, @ModelAttribute("loginUser") Member m, ModelAndView mv, String surveyName, String surveyIntro, String surveyStartDate, String surveyEndDate, String sprintName) {
		
//		List<SprintHistory> selectSprintName = new ArrayList<SprintHistory>();
//		Map<String, Object> map2= new HashMap<String, Object>();
//		String sName = sprintName.trim();
//		
//		map2.put("userEmail", m.getUserEmail());
//		map2.put("sprintName", sName);
//		
//		selectSprintName = ns.selectSprintName(map2);
//		System.out.println("스프린트 코드 : " + selectSprintName.get(0).getSprint().getSprintCode());
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		System.out.println("userCode :" + m.getUserCode());
//		map.put("userCode", m.getUserCode());
//		map.put("surveyName", surveyName);
//		map.put("surveyIntro", surveyIntro);
//		map.put("surveyStartDate", surveyStartDate);
//		map.put("surveyEndDate", surveyEndDate);
//		map.put("sprintCode", selectSprintName.get(0).getSprint().getSprintCode());
//		
//		int insertSurveyList = ns.insertNewSurvey(map);

		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("selectSurvey.sv")
	public String selectSurvey(Model model, @ModelAttribute("loginUser") Member m) {
		//최신 설문지 코드 조회
		
		
		return "projectFeedback/newsurvey";
	}
	
	@RequestMapping(value="/insertNewSurvey.sv", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView insertNewSurvey(Model model, @ModelAttribute("loginUser") Member m, ModelAndView mv, 
			 @RequestBody SurveyQuesList QuesList) {
		
		int temp = 0;
		//int count = Integer.parseInt(cnt);
		int[] result = new int[10];
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(SurveyQuesList str : QuesList.getSurveyNewVOLists()) {
			result[temp] = ns.insertNewQues(str);
			if(str.getSurveyQuesType().equals("01")) {
	         map.put(Integer.toString(temp+3), str.getSurveyQuesCode());
			}
	         temp++;
	         System.out.println(str);
	    }
		
		
		System.out.println(result.toString());
		System.out.println(result[0]);
		
	      mv.addObject("result", map);
	      mv.setViewName("jsonView");
	      
	      return mv;
		
		
	}
	
	@RequestMapping(value="/insertNewChoice.sv", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView insertNewChoice(Model model, @ModelAttribute("loginUser") Member m, ModelAndView mv) {
		
		return mv;
	}
	
}
