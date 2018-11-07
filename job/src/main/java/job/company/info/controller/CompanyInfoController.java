package job.company.info.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
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

import job.company.info.bean.CompanyInfoDTO;
import job.company.member.bean.CompanyMemberDTO;

@Controller
public class CompanyInfoController {
	
	@Autowired
	private CompanyInfoService companyInfoService;
	
	@RequestMapping(value = "/job/company/info/companyInfoWriteForm.do")
	public ModelAndView insertCompanyInfo(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		session.setAttribute("comId", "test");
		
		String comId = (String) session.getAttribute("comId");
		CompanyMemberDTO companyMemberDTO = companyInfoService.selectCompanyMember(comId);
		
		modelAndView.addObject("companyMemberDTO", companyMemberDTO);
		modelAndView.setViewName("companyInfoWriteForm.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/job/company/info/companyInfoWrite.do")
	public void companyInfoWrite(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("cpi_Birth"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		CompanyInfoDTO companyInfoDTO = new CompanyInfoDTO();
		
		companyInfoDTO.setCpm_Id(request.getParameter("cpm_Id"));
		companyInfoDTO.setCpi_Pname(request.getParameter("cpi_Pname"));
		companyInfoDTO.setCpi_Pphone(request.getParameter("cpi_Pphone"));
		companyInfoDTO.setCpi_Pemail(request.getParameter("cpi_Pemail"));
		companyInfoDTO.setCpi_Companyname(request.getParameter("cpi_Companyname"));
		companyInfoDTO.setCpi_Firstname(request.getParameter("cpi_Firstname"));
		companyInfoDTO.setCpi_Industry(request.getParameter("cpi_Industry"));
		companyInfoDTO.setCpi_Content(request.getParameter("cpi_Content"));
		companyInfoDTO.setCpi_Brand(request.getParameter("cpi_Brand"));
		companyInfoDTO.setCpi_Address(request.getParameter("cpi_Address"));
		companyInfoDTO.setCpi_Type(request.getParameter("cpi_Type"));
		companyInfoDTO.setCpi_Birth(date);
		companyInfoDTO.setCpi_Homepage(request.getParameter("cpi_Homepage"));
		companyInfoDTO.setCpi_Blog(request.getParameter("cpi_Blog"));
		companyInfoDTO.setCpi_Sns1(request.getParameter("cpi_Sns1"));
		companyInfoDTO.setCpi_Sns2(request.getParameter("cpi_Sns2"));
		companyInfoDTO.setCpi_Sns3(request.getParameter("cpi_Sns3"));
		companyInfoDTO.setCpi_Tel(request.getParameter("cpi_Tel"));
		companyInfoDTO.setCpi_Moneyyear(Integer.parseInt(request.getParameter("cpi_Moneyyear")));
		companyInfoDTO.setCpi_Moneybase(Integer.parseInt(request.getParameter("cpi_Moneybase")));
		companyInfoDTO.setCpi_Moneysell(Integer.parseInt(request.getParameter("cpi_Moneysell")));
		companyInfoDTO.setCpi_Moneygain(Integer.parseInt(request.getParameter("cpi_Moneygain")));
		companyInfoDTO.setCpl_Seq(null);
		companyInfoDTO.setCpi_Vision(request.getParameter("cpi_Vision"));
		companyInfoDTO.setCpi_History(request.getParameter("cpi_History"));
		companyInfoDTO.setCpi_Welfare(request.getParameter("cpi_Welfare"));
		companyInfoDTO.setCpi_Cafe(request.getParameter("cpi_Cafe"));
		companyInfoDTO.setCpi_Etc(request.getParameter("cpi_Etc"));
		
		int su = companyInfoService.insertCompanyInfo(companyInfoDTO);
		
		out.print(su);
	}
}




































