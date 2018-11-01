package job.resume.intern.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import job.resume.intern.bean.RS_internDTO;

@Controller
public class RS_internController {
	@Autowired
	private RS_internService internService;	
	
	@RequestMapping(value="/job/resume/intern/Write.do", method=RequestMethod.POST)
	public void Write(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 데이터
		// Session으로 넘어오는 ID값 
		String mId = "ID";		

		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		String rsitCompany = request.getParameter("rsitCompany");
		String rsitStartdate = request.getParameter("rsitStartdate");
		String rsitEnddate = request.getParameter("rsitEnddate");
		String rsitContent = request.getParameter("rsitContent");
		String rsitType = request.getParameter("rsitType");
		String rsitUserTitle = request.getParameter("rsitUserTitle");		
		// String m_Id = request.getParameter("m_Id");
		Date Startdate=null;
		try {
			Startdate = new SimpleDateFormat("yyyy-MM-dd").parse(rsitStartdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date Enddate=null;
		try {
			Enddate = new SimpleDateFormat("yyyy-MM-dd").parse(rsitEnddate);
		} catch (ParseException e) {
			e.printStackTrace();
		}				
		RS_internDTO internDTO = new RS_internDTO();
		internDTO.setRsit_Company(rsitCompany);
		internDTO.setRsit_Content(rsitContent);
		internDTO.setRsit_Type(rsitType);		
		internDTO.setRsit_Startdate(Startdate);
		internDTO.setRsit_Enddate(Enddate);	
		internDTO.setM_Id(mId);
		internDTO.setRsit_UserTitle(rsitUserTitle);		
		// (2) DB			
		int su = internService.Write(internDTO);
		// (3) 화면네비게이션	
		out.print(su);
	}
	
	@RequestMapping(value="/job/resume/intern/LoadCount.do", method=RequestMethod.POST)
	public void  LoadCount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		// Session으로 넘어오는 ID값 임시 지정 
		String memId = "ID";
		
		// DB작업 : memID가 가지고 있는 자소서의 개수를 구함
		int num = internService.selectNumintern(memId);			
		out.print(num);
	}
	@RequestMapping(value="/job/resume/intern/Load.do")
	public ModelAndView Load(HttpServletRequest request) throws IOException {
		ModelAndView modelAndView = new ModelAndView();		
		// Session으로 넘어오는 ID값 임시 지정
		String memId = "ID";		
		// memId가 가지고 있는 자소서의 rsprUserTitle을 select해서 list에 추가
		List<RS_internDTO> UserTitleList = internService.selectTitleList(memId);
		JSONObject jsonObject = new JSONObject();
		JSONArray items = new JSONArray();
		String rsit_Startdate = "";
		String rsit_Enddate = "";
		for(int i = 0; i < UserTitleList.size(); i++) {
			RS_internDTO internDTO = UserTitleList.get(i);
			System.out.println("internDTO 출력 : " + internDTO.toString());
			DateFormat Format = new SimpleDateFormat("yyyy-MM-dd");
			rsit_Startdate = Format.format(internDTO.getRsit_Startdate());
			rsit_Enddate = Format.format(internDTO.getRsit_Enddate());
			JSONObject temp = new JSONObject();
			temp.put("rsit_Seq", internDTO.getRsit_Seq());
			temp.put("rsit_Type", internDTO.getRsit_Type());
			temp.put("rsit_Company", internDTO.getRsit_Company());
			// date값 넘기는법 
			temp.put("rsit_Startdate", rsit_Startdate);			
			temp.put("rsit_Enddate", rsit_Enddate);
			temp.put("rsit_Content", internDTO.getRsit_Content());
			temp.put("m_Id", internDTO.getM_Id());
			temp.put("rsit_UserTitle", internDTO.getRsit_UserTitle());
			
			items.put(i, temp);
		}
		
		jsonObject.put("items", items);
		// date
		System.out.println(rsit_Startdate);
		System.out.println(rsit_Enddate);
		modelAndView.addObject("jsonObject", jsonObject);
		modelAndView.setViewName("/job/resume/intern/internJson.jsp");		

		return modelAndView;
	}
}
