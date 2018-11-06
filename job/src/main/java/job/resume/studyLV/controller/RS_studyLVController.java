package job.resume.studyLV.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
		
		double rss_Score;
		double rss_Totscore;
		
		if(rss_Score_str == ""||rss_Score_str == null) {
			rss_Score = 0;
		} else {
			rss_Score = Double.parseDouble(rss_Score_str);
		}
		
		if(rss_Totscore_str == ""||rss_Score_str == null) {
			rss_Totscore = 0;
		} else {
			rss_Totscore = Double.parseDouble(rss_Totscore_str);
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
		String memId = "num1";
		
		// DB작업 : memID가 가지고 있는 자소서의 개수를 구함
		int numberOfStudyLV = studyLVService.selectNumberOfStudyLV(memId);		
		System.out.println("[RS_studyLVController] numberOfStudyLV : " + numberOfStudyLV);
		
		out.print(numberOfStudyLV);		
	}
	
	@RequestMapping(value="/job/resume/studyLV/studyLVLoad.do", method=RequestMethod.POST)
	public ModelAndView studyLVLoad(HttpServletRequest request) throws IOException {
		System.out.println("[RS_studyLVController] studyLVLoad");
		
		ModelAndView modelAndView = new ModelAndView();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";
		
		// memId가 가지고 있는 자소서의 rsprUserTitle을 select해서 list에 추가
		List<RS_studyLVDTO> studyLVUserTitleList = studyLVService.selectStudyLVUserTitleList(memId);
		
		JSONObject jsonObject = new JSONObject();
		JSONArray items = new JSONArray();
		String rss_Startdate = "";
		String rss_Enddate = "";
		
		// rsprUserTitleList 리스트값 확인
		for(int i = 0; i < studyLVUserTitleList.size(); i++) {
			RS_studyLVDTO studyLVDTO = studyLVUserTitleList.get(i);
			System.out.println("[RS_studyLVController] studyLVDTO 출력 : " + studyLVDTO.toString());

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
			rss_Startdate = dateFormat.format(studyLVDTO.getRss_Startdate());
			rss_Enddate = dateFormat.format(studyLVDTO.getRss_Enddate());
			
			JSONObject temp = new JSONObject();
			temp.put("rss_Seq", studyLVDTO.getRss_Seq());
			temp.put("rss_Type", studyLVDTO.getRss_Type());
			temp.put("rss_Name", studyLVDTO.getRss_Name());
			temp.put("rss_Startdate", rss_Startdate);
			temp.put("rss_Enddate", rss_Enddate);
			temp.put("rss_Ishighschool", studyLVDTO.getRss_Ishighschool());
			temp.put("rss_Major", studyLVDTO.getRss_Major());
			temp.put("rss_Score", studyLVDTO.getRss_Score());
			temp.put("rss_Totscore", studyLVDTO.getRss_Totscore());
			temp.put("m_Id", studyLVDTO.getM_Id());
			temp.put("rss_UserTitle", studyLVDTO.getRss_UserTitle());
			items.put(i, temp);			
		}
		
		jsonObject.put("items", items);
		
		modelAndView.addObject("jsonObject", jsonObject);
		modelAndView.setViewName("/job/resume/studyLV/stydyLVLoadJson.jsp");
		
		System.out.println("[RS_prController] jsonObject 출력 : " + jsonObject);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/job/resume/studyLV/rssLoadView.do", method=RequestMethod.POST)
	public ModelAndView rssLoadView(HttpServletRequest request) {
		System.out.println("[RS_studyLVController] rssLoadView");		
		
		ModelAndView modelAndView = new ModelAndView();
		JSONObject jsonObject = new JSONObject();
		JSONArray items = new JSONArray();
		
		String accumSeq = request.getParameter("accumSeq");
		System.out.println("[RS_studyLVController] accumSeq : " + accumSeq);
		
		int accumSeqLastIndexOf = accumSeq.lastIndexOf("/");
		System.out.println("[RS_studyLVController] accumSeqLastIndexOf : " + accumSeqLastIndexOf);
		
		String accumSeqSubstring = accumSeq.substring(0, accumSeqLastIndexOf);
		System.out.println("[RS_studyLVController] accumSeqSubstring : " + accumSeqSubstring);
		
		String[] accumSeqSplit = accumSeq.split("/"); 
		String rss_Startdate = "";
		String rss_Enddate = "";
		
		for(int i = 0; i < accumSeqSplit.length; i++) {
			System.out.println("[RS_studyLVController] accumSeqSplit[" + i + "] : " + accumSeqSplit[i]);
			int rss_Seq = Integer.parseInt(accumSeqSplit[i]);
			RS_studyLVDTO studyLVDTO = studyLVService.selectStudyLVDTO(rss_Seq);
			System.out.println("[RS_studyLVController] eduDTO : " + studyLVDTO.toString());
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
			rss_Startdate = dateFormat.format(studyLVDTO.getRss_Startdate());
			rss_Enddate = dateFormat.format(studyLVDTO.getRss_Enddate());
			
			JSONObject temp = new JSONObject();
			temp.put("rss_Seq", studyLVDTO.getRss_Seq());
			temp.put("rss_Type", studyLVDTO.getRss_Type());
			temp.put("rss_Name", studyLVDTO.getRss_Name());
			temp.put("rss_Startdate", rss_Startdate);
			temp.put("rss_Enddate", rss_Enddate);
			temp.put("rss_Ishighschool", studyLVDTO.getRss_Ishighschool());
			temp.put("rss_Major", studyLVDTO.getRss_Major());
			temp.put("rss_Score", studyLVDTO.getRss_Score());
			temp.put("rss_Totscore", studyLVDTO.getRss_Totscore());
			temp.put("m_Id", studyLVDTO.getM_Id());
			temp.put("rss_UserTitle", studyLVDTO.getRss_UserTitle());
			items.put(i, temp);
		}
		
		jsonObject.put("items", items);
		
		modelAndView.addObject("jsonObject", jsonObject);
		modelAndView.setViewName("/job/resume/studyLV/selectedDTOJson.jsp");
		
		System.out.println("[RS_studyLVController] jsonObject 출력 : " + jsonObject);
		
		return modelAndView;
	}
}
