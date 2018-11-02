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
		String rstName = request.getParameter("rstName");
		String rstCompany = request.getParameter("rstCompany");
		String rstDate = request.getParameter("rstDate");
		String rstContent = request.getParameter("rstContent");
		String RSTUserTitle = request.getParameter("rstuserTitle");
		Date date=null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(rstDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// DTO에 변수 저장
		RS_trophyDTO trophyDTO = new RS_trophyDTO();		
		trophyDTO.setRst_Name(rstName);
		trophyDTO.setRst_Company(rstCompany);
		trophyDTO.setRst_Date(date);
		trophyDTO.setRst_Content(rstContent);
		trophyDTO.setRST_UserTitle(RSTUserTitle);
		trophyDTO.setM_Id(mId);
		// DB작업
		int su = trophyService.Write(trophyDTO);		
		// (3) 화면네비게이션		
		out.print(su);
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
}










