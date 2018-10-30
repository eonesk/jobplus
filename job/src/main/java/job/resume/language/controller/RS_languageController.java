package job.resume.language.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		String rslgtest = request.getParameter("rslgtest");
		String rslgscore = request.getParameter("rslgscore");
		String rslgdate = request.getParameter("rslgdate");
		String rslgUserTitle = request.getParameter("rslgUserTitle");
		// String m_Id = request.getParameter("m_Id");
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyyMMdd").parse(rslgdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		RS_languageDTO languageDTO = new RS_languageDTO();
		languageDTO.setRslg_Category(rslgCategory);
		languageDTO.setRslg_Name(rslgName);
		languageDTO.setRslg_Lv(rslgLv);
		languageDTO.setRslg_test(rslgtest);
		languageDTO.setRslg_score(rslgscore);
		languageDTO.setRslg_date(date);
		languageDTO.setRSLG_UserTitle(rslgUserTitle);
		// (2) DB			
		int su = languageService.Write(languageDTO);
		// (3) 화면네비게이션	
		out.print(su);
	}	
}























