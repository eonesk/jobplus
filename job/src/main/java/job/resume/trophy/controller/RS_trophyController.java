package job.resume.trophy.controller;

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
import job.resume.trophy.bean.RS_trophyDTO;
@Controller
public class RS_trophyController {
	@Autowired
	private RS_trophyService trophyService;	

	@RequestMapping(value="/job/resume/trophy/Write.do", method=RequestMethod.POST)
	public void Write(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// Session으로 넘어오는 memID값 임시 지정
		String mId = "ID";
		
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		// 넘어오는 변수값 콘솔 확인
		String rst_Name = request.getParameter("rst_Name");
		String rst_Company = request.getParameter("rst_Company");
		String rst_Date = request.getParameter("rst_Date");
		String rst_Content = request.getParameter("rst_Content");
		String RST_UserTitle = request.getParameter("rst_UserTitle");
		Date date=null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(rst_Date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// DTO에 변수 저장
		RS_trophyDTO trophyDTO = new RS_trophyDTO();		
		trophyDTO.setRst_Name(rst_Name);
		trophyDTO.setRst_Company(rst_Company);
		trophyDTO.setRst_Date(date);
		trophyDTO.setRst_Content(rst_Content);
		trophyDTO.setRST_UserTitle(RST_UserTitle);
		trophyDTO.setM_Id(mId);
		// DB작업
		int su = trophyService.Write(trophyDTO);	
		int rst_Seq = 0;
		if(su>0) {
			rst_Seq = trophyService.selectLastSeq();
		}
		// (3) 화면네비게이션		
		out.print(rst_Seq);
	}
	@RequestMapping(value="/job/resume/trophy/LoadCount.do", method=RequestMethod.POST)
	public void LoadCount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		// Session으로 넘어오는 ID값 임시 지정 
		String memId = "ID";

		// DB작업 : memID가 가지고 있는 자소서의 개수를 구함
		int num = trophyService.selectNumtrophy(memId);
		out.print(num);
	}
	@RequestMapping(value="/job/resume/trophy/Load.do", method=RequestMethod.POST)
	public ModelAndView Load(HttpServletRequest request) throws IOException {
		ModelAndView modelAndView = new ModelAndView();		
		// Session으로 넘어오는 ID값 임시 지정
		String memId = "ID";		
		// memId가 가지고 있는 자소서의 UserTitleList을 select해서 list에 추가
		List<RS_trophyDTO> UserTitleList = trophyService.selectTitleList(memId);	
		JSONObject jsonObject = new JSONObject();
		JSONArray items = new JSONArray();
		String rst_Date = "";
		for(int i=0; i < UserTitleList.size(); i++) {
			RS_trophyDTO trophyDTO = UserTitleList.get(i);
			System.out.println("trophyDTO 출력 : " + trophyDTO.toString());
			DateFormat Format = new SimpleDateFormat("yyyy-MM-dd");
			rst_Date = Format.format(trophyDTO.getRst_Date());
			JSONObject temp = new JSONObject();
			temp.put("rst_Seq", trophyDTO.getRst_Seq());
			temp.put("rst_Name", trophyDTO.getRst_Name());
			temp.put("rst_Company", trophyDTO.getRst_Company());
			temp.put("rst_Date", rst_Date);
			temp.put("rst_Content", trophyDTO.getRst_Content());
			temp.put("m_Id", trophyDTO.getM_Id());
			temp.put("RST_UserTitle", trophyDTO.getRST_UserTitle());
			
			items.put(i, temp);
		}

		jsonObject.put("items", items);
		// date		
		modelAndView.addObject("jsonObject", jsonObject);
		modelAndView.setViewName("/job/resume/trophy/trophyJson.jsp");		

		return modelAndView;
	}	
	@RequestMapping(value="/job/resume/trophy/LoadView.do", method=RequestMethod.POST)
	public ModelAndView LoadView(HttpServletRequest request) {		
		ModelAndView modelAndView = new ModelAndView();
		JSONObject jsonObject = new JSONObject();
		JSONArray items = new JSONArray();
		
		String accumSeq = request.getParameter("accumSeq");		
		int accumSeqLastIndexOf = accumSeq.lastIndexOf("/");		
		String accumSeqSubstring = accumSeq.substring(0, accumSeqLastIndexOf);	
		System.out.println("accumSeqSubstring = " + accumSeqSubstring);
		String[] accumSeqSplit = accumSeq.split("/"); 
		String rst_Date = "";
		
		for(int i = 0; i < accumSeqSplit.length; i++) {
			int rst_Seq = Integer.parseInt(accumSeqSplit[i]);
			RS_trophyDTO trophyDTO = trophyService.selectTrophyDTO(rst_Seq);
			DateFormat Format = new SimpleDateFormat("yyyy-MM-dd");
			rst_Date = Format.format(trophyDTO.getRst_Date());
			JSONObject temp = new JSONObject();
			temp.put("rst_Seq", trophyDTO.getRst_Seq());
			temp.put("rst_Name", trophyDTO.getRst_Name());
			temp.put("rst_Company", trophyDTO.getRst_Company());
			temp.put("rst_Date", rst_Date);
			temp.put("rst_Content", trophyDTO.getRst_Content());
			temp.put("m_Id", trophyDTO.getM_Id());
			temp.put("rst_UserTitle", trophyDTO.getRST_UserTitle());
			items.put(i, temp);
		}
		
		jsonObject.put("items", items);
		
		modelAndView.addObject("jsonObject", jsonObject);
		modelAndView.setViewName("/job/resume/trophy/selectedDTOJson.jsp");
				
		return modelAndView;
	}
}










