package job.company.member.controller;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import job.company.member.bean.CompanyMemberDTO;


@Controller
public class CompanyMemberController {
	@Autowired
	private CompanyMemberService companyMemberService;

	@RequestMapping(value ="/job/company/member/companyJoinForm.do")
	public ModelAndView cJoinForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/job/company/member/companyJoinForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value ="/main/cLoginForm.do")
	public ModelAndView cLoginForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/main/cLoginForm.jsp");
		return modelAndView;
	}


	@RequestMapping(value = "/job/company/member/CompanyjoinResult.do")
	public ModelAndView join(HttpServletRequest request, CompanyMemberDTO companyMemberDTO) {
		ModelAndView modelAndView = new ModelAndView();
		String cpm_id = request.getParameter("cpm_id");
		String cpm_pw = request.getParameter("cpm_pw");
		String cpm_num = request.getParameter("cpm_num");
		String cpm_type = request.getParameter("cpm_type");
		String cpm_infotime = request.getParameter("cpm_infotime");
		
		companyMemberDTO.setCpm_id(cpm_id);
		companyMemberDTO.setCpm_pw(cpm_pw);
		companyMemberDTO.setCpm_num(cpm_num);
		companyMemberDTO.setCpm_type(cpm_type);
		companyMemberDTO.setCpm_infotime(cpm_infotime);
		
		
		int resultCount = companyMemberService.companyMemberInsert(companyMemberDTO);

		modelAndView.addObject("resultCount", resultCount);
		modelAndView.setViewName("companyJoinResult.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/cLogin.do")
	public void login(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		// 데이터 읽어오기
		String cpm_id = request.getParameter("cpm_id");
		String cpm_pw = request.getParameter("cpm_pw");
		// DB
		
		
		String result = companyMemberService.companyMemberLogin(cpm_id, cpm_pw);
		System.out.println(result);
		
		if(result != null) { 				
			HttpSession session = request.getSession();
			session.setAttribute("cpm_id", cpm_id);
		}
		out.print(result);
	}
	
	@RequestMapping(value="/job/company/member/checkId.do")
	public void checkId(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		String cpm_id = request.getParameter("checkId");
		
		boolean exist = companyMemberService.isExistId(cpm_id);
		
		out.print(exist);
		
	}
}
