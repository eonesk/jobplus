package job.resume.studyLV.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import job.resume.edu.bean.RS_eduDTO;
import job.resume.studyLV.bean.RS_studyLVDTO;

@Controller
public class RS_studyLVController {

	@Autowired
	RS_studyLVService studyLVService;
	
	@RequestMapping(value="/job/resume/studyLV/rssSave.do", method=RequestMethod.POST)
	public void rssSave(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("[RS_studyLVController] rssSave");
		
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";		
		
		String rss_Type = request.getParameter("rss_Type");
		String rss_Name = request.getParameter("rss_Name");
		String rss_Startdate_str = request.getParameter("rss_Startdate");
		String rss_Enddate_str = request.getParameter("rss_Enddate");
		String rss_Ishighschool = request.getParameter("rss_Ishighschool");
		
		String rss_Major = request.getParameter("rss_Major");
		String rss_Score_str = request.getParameter("rss_Score");
		String rss_Totscore_str = request.getParameter("rss_Totscore");
		String m_Id = memId;
		String rss_UserTitle = request.getParameter("rss_UserTitle");
		
		int rss_Score;
		int rss_Totscore;
		
		if(rss_Score_str == ""||rss_Score_str == null) {
			rss_Score = 0;
		} else {
			rss_Score = (int)Double.parseDouble(rss_Score_str);
		}
		
		if(rss_Totscore_str == ""||rss_Score_str == null) {
			rss_Totscore = 0;
		} else {
			rss_Totscore = (int)Double.parseDouble(rss_Totscore_str);
		}
		
		if(rss_Ishighschool.equals("Y")) {
			rss_Type = "고등미만졸업";
			rss_Name = "데이터 없음";
			rss_Startdate_str = "2018-01";
			rss_Enddate_str = "2018-01";
			
			rss_Major = "데이터 없음";
		}
		
		System.out.println("[RS_studyLVController] : " + rss_Type + " // " + rss_Name + " // " + rss_Startdate_str + " // " + rss_Enddate_str
					 + " // " + rss_Ishighschool + " // " + rss_Major + " // " + rss_Score + " // " + rss_Totscore
					 + " // " + m_Id + " // " + rss_UserTitle);
		
		Date rss_Startdate = null;
		Date rss_Enddate = null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		// 입력받은 날짜값이 YYYYMM값인데 DD가 없으면 안들어감 ㅜ 임시로 DD 붙여줌
		rss_Startdate_str = rss_Startdate_str + "-01";
		rss_Enddate_str = rss_Enddate_str + "-01";
		
		
		
		try {
			rss_Startdate = dateFormat.parse(rss_Startdate_str);
			rss_Enddate = dateFormat.parse(rss_Enddate_str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("[RS_studyLVController] rss_Startdate : " + rss_Startdate);
		/////////////////////////////////////////////////////////////////
		
		RS_studyLVDTO studyLVDTO = new RS_studyLVDTO();
		
		studyLVDTO.setRss_Type(rss_Type);
		studyLVDTO.setRss_Name(rss_Name);
		studyLVDTO.setRss_Startdate(rss_Startdate);
		studyLVDTO.setRss_Enddate(rss_Enddate);
		studyLVDTO.setRss_Ishighschool(rss_Ishighschool);
		studyLVDTO.setRss_Major(rss_Major);
		studyLVDTO.setRss_Score(rss_Score);
		studyLVDTO.setRss_Totscore(rss_Totscore);
		studyLVDTO.setM_Id(m_Id);
		studyLVDTO.setRss_UserTitle(rss_UserTitle);
		
		// DB저장
		int saveCount = studyLVService.rssSave(studyLVDTO);		
		System.out.println("[RS_studyLVController] saveCount : " + saveCount);
		
		out.print(saveCount);
	}
	
	@RequestMapping(value="/job/resume/studyLV/studyLVLoadCount.do", method=RequestMethod.POST)
	public void studyLVLoadCount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("[RS_studyLVController] studyLVLoadCount");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num5";
		
		// DB작업 : memID가 가지고 있는 자소서의 개수를 구함
		int numberOfStudyLV = studyLVService.selectNumberOfStudyLV(memId);		
		System.out.println("[RS_studyLVController] numberOfStudyLV : " + numberOfStudyLV);
		
		out.print(numberOfStudyLV);		
	}
	
	@RequestMapping(value="/job/resume/studyLV/studyLVLoad.do", method=RequestMethod.POST)
	public void studyLVLoad(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("[RS_studyLVController] studyLVLoad");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num5";
		
		// memId가 가지고 있는 자소서의 rsprUserTitle을 select해서 list에 추가
		List<RS_studyLVDTO> studyLVUserTitleList = studyLVService.selectStudyLVUserTitleList(memId);
		
		// rsprUserTitleList 리스트값 확인
		for(int i = 0; i < studyLVUserTitleList.size(); i++) {
			RS_studyLVDTO testDTO = studyLVUserTitleList.get(i);
			System.out.println("[RS_studyLVController] testDTO 출력 : " + testDTO.toString());
		}
/*
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("studyLVUserTitleList", studyLVUserTitleList);
		System.out.println("[RS_studyLVController] map 출력 : " + map);
		JSONObject jsonObject = new JSONObject();
		jsonObject.putAll(map);
		System.out.println("[RS_studyLVController] jsonObject 출력 : " + jsonObject);
		
		String jsonObject_str = jsonObject.toString();
		System.out.println("[RS_studyLVController] jsonObject_str 출력 : " + jsonObject_str);
		
		out.print(jsonObject_str);*/
	}
}
