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
	public ModelAndView boardWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		//modelAndView.addObject("display", "../job/job/resume/intern/internWriteForm.jsp");
		modelAndView.setViewName("internWriteForm.jsp");
		return modelAndView;
		//return "boardWriteForm";
	}	
	@RequestMapping(value="/job/resume/intern/Write.do")
	public ModelAndView boardWrite(HttpServletRequest request, HttpSession session) {
		// (1) 데이터
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}		
		String rsitCompany = request.getParameter("rsitCompany");
		String rsitStartdate = request.getParameter("rsitStartdate");
		String rsitEnddate = request.getParameter("rsitEnddate");
		String rsitContent = request.getParameter("rsitContent");
		String rsitType = request.getParameter("rsitType");
		// String mId = request.getParameter("mId");
		// String mId = (String) session.getAttribute("mId");
		Date Startdate=null;
		try {
			Startdate = new SimpleDateFormat("yyyyMMdd").parse(rsitStartdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date Enddate=null;
		try {
			Enddate = new SimpleDateFormat("yyyyMMdd").parse(rsitEnddate);
		} catch (ParseException e) {
			e.printStackTrace();
		}				
		RS_internDTO internDTO = new RS_internDTO();
		internDTO.setRsitCompany(rsitCompany);
		internDTO.setRsitContent(rsitContent);
		internDTO.setRsitType(rsitType);		
		internDTO.setRsitStartdate(Startdate);
		internDTO.setRsitEnddate(Enddate);		
		// (2) DB		
		int su = internService.Write(internDTO);
		// (3) 화면네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		//modelAndView.addObject("display", "../job/job/resume/intern/internWrite.jsp");
		modelAndView.setViewName("internWrite.jsp");
		return modelAndView;
	}
	
}
