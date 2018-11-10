package job.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import job.member.bean.MemberDTO;
import job.member.controller.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/job/member/joinForm.do")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/job/member/joinForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value ="/main/mLoginForm.do")
	public ModelAndView mLoginForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/main/mLoginForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/mLogin.do")
	public void login(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		// 데이터 읽어오기
		String id = request.getParameter("m_id");
		String pwd = request.getParameter("m_pw");
		// DB
		
		
		String result = memberService.login(id, pwd);
		System.out.println(result);
		
		if(result != null) { 				
			HttpSession session = request.getSession();
			session.setAttribute("m_id", id);
		}
		out.print(result);
	}
	
	@RequestMapping(value="/job/member/joinResult.do")
	public ModelAndView join(HttpServletRequest request,MemberDTO memberDTO) {
		ModelAndView modelAndView = new ModelAndView();
		String m_Id = request.getParameter("m_Id");
		String m_Pw = request.getParameter("m_Pw");
		String m_Name = request.getParameter("m_Name");
		String m_Gender = request.getParameter("m_Gender");
		String m_Homenum = request.getParameter("m_Homenum");
		String m_Birth = request.getParameter("m_Birth");
		String m_Phone = request.getParameter("m_Phone");
		String m_Email = request.getParameter("m_Email");
		String m_Address = request.getParameter("m_Address1") + " " 
				+ request.getParameter("m_Address2");
		String m_Isemail = request.getParameter("m_Isemail");
		String m_Isphone = request.getParameter("m_Isphone");
		String m_Isforeign = request.getParameter("m_Isforeign");
		
		
		Date birthDate=null;
		try {
			birthDate = new SimpleDateFormat("yyyy-MM-dd").parse(m_Birth);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		
		memberDTO.setM_id(m_Id);
		memberDTO.setM_pw(m_Pw);
		memberDTO.setM_name(m_Name);
		memberDTO.setM_gender(m_Gender);
		memberDTO.setM_homenum(m_Homenum);
		memberDTO.setM_birth(birthDate);
		memberDTO.setM_phone(m_Phone);
		memberDTO.setM_email(m_Email);
		memberDTO.setM_address(m_Address);
		memberDTO.setM_isemail(m_Isemail);
		memberDTO.setM_isphone(m_Isphone);
		memberDTO.setM_isForeign(m_Isforeign);
		System.out.println(m_Isemail);
		System.out.println(m_Isphone);
		System.out.println(m_Isforeign);
		int resultCount = memberService.memberInsert(memberDTO);
		
		modelAndView.addObject("resultCount", resultCount);
		modelAndView.setViewName("joinResult.jsp");
		return modelAndView;
	}
}
