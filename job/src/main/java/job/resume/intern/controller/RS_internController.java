package job.resume.intern.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import job.resume.intern.bean.RS_internDTO;

@Controller
public class RS_internController {
	@Autowired
	private RS_internService internService;
	
	@RequestMapping(value="/job/resume/intern/internWriteForm.do")
	public ModelAndView internWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		//modelAndView.addObject("display", "../job/job/resume/intern/internWriteForm.jsp");
		modelAndView.setViewName("internWriteForm.jsp");
		return modelAndView;
		//return "boardWriteForm";
	}	
	@RequestMapping(value="/job/resume/intern/Write.do")
	public ModelAndView internWrite(HttpServletRequest request, HttpSession session) {
		// (1) 데이터
		System.out.println("write.do접근완료");
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}			
		System.out.println("write.do접근완료1");
		String rsit_Company = request.getParameter("rsit_Company");
		String rsit_Startdate = request.getParameter("rsit_Startdate");
		String rsit_Enddate = request.getParameter("rsit_Enddate");
		String rsit_Content = request.getParameter("rsit_Content");
		String rsit_Type = request.getParameter("rsit_Type");
		String rsit_UserTitle = request.getParameter("rsit_UserTitle");		
		// String m_Id = request.getParameter("m_Id");
		System.out.println("write.do접근완료2");
		Date Startdate=null;
		try {
			Startdate = new SimpleDateFormat("yyyyMMdd").parse(rsit_Startdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date Enddate=null;
		try {
			Enddate = new SimpleDateFormat("yyyyMMdd").parse(rsit_Enddate);
		} catch (ParseException e) {
			e.printStackTrace();
		}				
		System.out.println("write.do접근완료3");
		RS_internDTO internDTO = new RS_internDTO();
		internDTO.setRsit_Company(rsit_Company);
		internDTO.setRsit_Content(rsit_Content);
		internDTO.setRsit_Type(rsit_Type);		
		internDTO.setRsit_Startdate(Startdate);
		internDTO.setRsit_Enddate(Enddate);	
		internDTO.setRsit_UserTitle(rsit_UserTitle);
		// (2) DB		
		System.out.println("write.do접근완료4");
		int su = internService.Write(internDTO);
		// (3) 화면네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		//modelAndView.addObject("display", "../job/job/resume/intern/internWrite.jsp");
		System.out.println("write.do접근완료5");
		modelAndView.setViewName("ok.jsp");
		return modelAndView;
	}
	
}
