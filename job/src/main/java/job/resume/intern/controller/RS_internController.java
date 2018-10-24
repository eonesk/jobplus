package job.resume.intern.controller;

import java.io.UnsupportedEncodingException;

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
	
	@RequestMapping(value="/intern/internWriteForm.do")
	public ModelAndView boardWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "../intern/internWriteForm.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
		//return "boardWriteForm";
	}	
	@RequestMapping(value="/intern/Write.do")
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
		//String id = (String) session.getAttribute("memId");
		//String name = (String) session.getAttribute("memName");
		
		RS_internDTO internDTO = new RS_internDTO();
		internDTO.setRsitCompany(rsitCompany);
		internDTO.setRsitContent(rsitContent);
		internDTO.setRsitType(rsitType);
		// (2) DB
		//BoardDAO boardDAO = new BoardDAO();
		int su = internService.Write(internDTO);
		// (3) 화면네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.addObject("display", "../intern/internWrite.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
}
