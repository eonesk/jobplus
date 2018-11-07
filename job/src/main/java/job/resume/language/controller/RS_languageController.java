package job.resume.language.controller;

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

import job.resume.language.bean.RS_languageDTO;

@Controller
public class RS_languageController {
	@Autowired
	private RS_languageService languageService;
	
	@RequestMapping(value="/job/resume/language/Write.do", method=RequestMethod.POST)
	public void Write(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 데이터
		// Session으로 넘어오는 ID값 
		String mId = "ID";	
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		String rslgCategory = request.getParameter("rslgCategory");
		String rslgName = request.getParameter("rslgName");
		String rslgLv = request.getParameter("rslgLv");
		String rslgTest = request.getParameter("rslgTest");
		String rslgScore = request.getParameter("rslgScore");
		String rslgDate = request.getParameter("rslgDate");
		String rslgUserTitle = request.getParameter("rslgUserTitle");
		// String m_Id = request.getParameter("m_Id");
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(rslgDate);
		} catch (ParseException e) {
			
		}
		RS_languageDTO languageDTO = new RS_languageDTO();
		languageDTO.setRslg_Category(rslgCategory);
		languageDTO.setRslg_Name(rslgName);
		languageDTO.setRslg_Lv(rslgLv);
		languageDTO.setRslg_Test(rslgTest);
		languageDTO.setRslg_Score(rslgScore);
		languageDTO.setRslg_Date(date);
		languageDTO.setRSLG_UserTitle(rslgUserTitle);
		languageDTO.setM_Id(mId);
		// (2) DB			
		int su = languageService.Write(languageDTO);
		int rslg_Seq = 0;
		if(su>0) {
			rslg_Seq = languageService.selectLastSeq();
		}
		// (3) 화면네비게이션	
		out.print(rslg_Seq);
	}	
	@RequestMapping(value="/job/resume/language/LoadCount.do", method=RequestMethod.POST)
	public void  LoadCount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		// Session으로 넘어오는 ID값 임시 지정 
		
		String memId = "ID";
		
		// DB작업 : memID가 가지고 있는 자소서의 개수를 구함
		int num = languageService.selectNumlang(memId);			
		out.print(num);
	}
	@RequestMapping(value="/job/resume/language/Load.do")
	public ModelAndView Load(HttpServletRequest request) throws IOException {
		ModelAndView modelAndView = new ModelAndView();		
		// Session으로 넘어오는 ID값 임시 지정
		String memId = "ID";		
		// memId가 가지고 있는 자소서의 UserTitleList을 select해서 list에 추가
		List<RS_languageDTO> UserTitleList = languageService.selectTitleList(memId);
		JSONObject jsonObject = new JSONObject();
		JSONArray items = new JSONArray();
		String rslg_Date = "";
		for(int i = 0; i < UserTitleList.size(); i++) {
			RS_languageDTO languageDTO = UserTitleList.get(i);
			System.out.println("languageDTO 출력 : " + languageDTO.toString());
			DateFormat Format = new SimpleDateFormat("yyyy-MM-dd");
			rslg_Date = Format.format(languageDTO.getRslg_Date());
			JSONObject temp = new JSONObject();
			temp.put("rslg_Seq", languageDTO.getRslg_Seq());
			temp.put("rslg_Category", languageDTO.getRslg_Category());
			temp.put("rslg_Name", languageDTO.getRslg_Name());
			temp.put("rslg_Lv", languageDTO.getRslg_Lv());
			// date값 넘기는법 
			temp.put("rslg_Date", rslg_Date);	
			temp.put("rslg_Score", languageDTO.getRslg_Score());
			temp.put("rslg_Test", languageDTO.getRslg_Test());
			temp.put("m_Id", languageDTO.getM_Id());
			temp.put("RSLG_UserTitle", languageDTO.getRSLG_UserTitle());
			items.put(i, temp);
		}
		
		jsonObject.put("items", items);
		// date
		modelAndView.addObject("jsonObject", jsonObject);
		modelAndView.setViewName("/job/resume/language/languageJson.jsp");		

		return modelAndView;
	}
	@RequestMapping(value="/job/resume/language/LoadView.do", method=RequestMethod.POST)
	public ModelAndView LoadView(HttpServletRequest request) {		
		ModelAndView modelAndView = new ModelAndView();
		JSONObject jsonObject = new JSONObject();
		JSONArray items = new JSONArray();
		
		String accumSeq = request.getParameter("accumSeq");		
		int accumSeqLastIndexOf = accumSeq.lastIndexOf("/");		
		String accumSeqSubstring = accumSeq.substring(0, accumSeqLastIndexOf);	
		System.out.println("accumSeqSubstring = " + accumSeqSubstring);
		String[] accumSeqSplit = accumSeq.split("/"); 
		String rslg_Date = "";
		
		for(int i = 0; i < accumSeqSplit.length; i++) {
			int rslg_Seq = Integer.parseInt(accumSeqSplit[i]);
			RS_languageDTO languageDTO = languageService.selectLangDTO(rslg_Seq);
			DateFormat Format = new SimpleDateFormat("yyyy-MM-dd");
			rslg_Date = Format.format(languageDTO.getRslg_Date());
			JSONObject temp = new JSONObject();
			temp.put("rslg_Seq", languageDTO.getRslg_Seq());
			temp.put("rslg_Category", languageDTO.getRslg_Category());
			temp.put("rslg_Name", languageDTO.getRslg_Name());
			temp.put("rslg_Lv", languageDTO.getRslg_Lv());
			temp.put("rslg_Score", languageDTO.getRslg_Score());
			temp.put("rslg_Date", rslg_Date);
			temp.put("rslg_Test", languageDTO.getRslg_Test());
			temp.put("m_Id", languageDTO.getM_Id());
			temp.put("RSLG_UserTitle", languageDTO.getRSLG_UserTitle());
			items.put(i, temp);
		}
		
		jsonObject.put("items", items);
		
		modelAndView.addObject("jsonObject", jsonObject);
		modelAndView.setViewName("/job/resume/language/selectedDTOJson.jsp");
				
		return modelAndView;
	}
}























