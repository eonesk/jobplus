package job.company.info.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import job.company.info.bean.CompanyInfoDTO;
import job.company.member.bean.companyMemberDTO;

@Controller
public class CompanyInfoController {
	
	@RequestMapping(value = "/job/company/info/companyInfoWrite.do")
	public ModelAndView insertCompanyInfo(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		session.setAttribute("comId", "test");
		
		String comId = (String) session.getAttribute("comId");
		
		return modelAndView;
	}
}
