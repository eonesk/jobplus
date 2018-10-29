package job.resume.edu.controller;

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
import job.resume.pr.bean.RS_prDTO;

@Controller
public class RS_eduController {

	@Autowired
	RS_eduService eduService;
	
	@RequestMapping(value="/job/resume/edu/rseSave.do", method=RequestMethod.POST)
	public void rseSave(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("[RS_eduLVController] rseSave");
		
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";		
		
		String rse_Name = request.getParameter("rse_Name");
		String rse_Company = request.getParameter("rse_Company");
		String rse_Startdate_str = request.getParameter("rse_Startdate");
		String rse_Enddate_str = request.getParameter("rse_Enddate");
		String rse_Content = request.getParameter("rse_Content");
		String m_Id = memId;
		String rse_UserTitle = request.getParameter("rse_UserTitle");
		
		System.out.println("[RS_eduLVController] : " + rse_Name + " // " + rse_Company + " // " + rse_Startdate_str + " // " 
							+ rse_Enddate_str + " // " + rse_Content + " // " + m_Id + " // " + rse_UserTitle);
	
		Date rse_Startdate = null;
		Date rse_Enddate = null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");		
		
		try {
			rse_Startdate = dateFormat.parse(rse_Startdate_str);
			rse_Enddate = dateFormat.parse(rse_Enddate_str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("[RS_eduLVController] rss_Startdate : " + rse_Startdate);
		
		RS_eduDTO eduDTO = new RS_eduDTO();
		eduDTO.setRse_Name(rse_Name);
		eduDTO.setRse_Company(rse_Company);
		eduDTO.setRse_Startdate(rse_Startdate);
		eduDTO.setRse_Enddate(rse_Enddate);
		eduDTO.setRse_Content(rse_Content);
		eduDTO.setM_Id(m_Id);
		eduDTO.setRse_UserTitle(rse_UserTitle);

		// DB 저장
		int saveCount = eduService.rseSave(eduDTO);
		System.out.println("[RS_eduLVController] saveCount : " + saveCount);
		
		out.print(saveCount);
		
	}
	
	@RequestMapping(value="/job/resume/edu/eduLoadCount.do", method=RequestMethod.POST)
	public void eduLoadCount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("[RS_eduLVController] eduLoadCount");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";
		
		// DB작업 : memID가 가지고 있는 자소서의 개수를 구함
		int numberOfEdu = eduService.selectNumberOfEdu(memId);		
		System.out.println("[RS_eduLVController] numberOfEdu : " + numberOfEdu);
		
		out.print(numberOfEdu);		
	}
	
	@RequestMapping(value="/job/resume/edu/eduLoad.do", method=RequestMethod.POST)
	public void eduLoad(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("[RS_eduLVController] eduLoad");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";
		
		// memId가 가지고 있는 자소서의 rsprUserTitle을 select해서 list에 추가
		List<RS_eduDTO> eduUserTitleList = eduService.selectEduUserTitleList(memId);
		
		// rsprUserTitleList 리스트값 확인
		for(int i = 0; i < eduUserTitleList.size(); i++) {
			RS_eduDTO testDTO = eduUserTitleList.get(i);
			System.out.println("[RS_eduLVController] testDTO 출력 : " + testDTO.toString());
		}
		/*
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("eduUserTitleList", eduUserTitleList);
		System.out.println("[RS_eduLVController] map 출력 : " + map);
		JSONObject jsonObject = new JSONObject();
		jsonObject.putAll(map);
		System.out.println("[RS_eduLVController] jsonObject 출력 : " + jsonObject);
		
		String jsonObject_str = jsonObject.toString();
		System.out.println("[RS_eduLVController] jsonObject_str 출력 : " + jsonObject_str);
		*/
		//out.print(jsonObject_str);
	}
}
