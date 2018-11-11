package job.company.info.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
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
		
		String comId = (String) session.getAttribute("comId");
		
		int modify_su = companyInfoService.selectCount(comId);
		boolean modify = false;
		
		CompanyMemberDTO companyMemberDTO = companyInfoService.selectCompanyMember(comId);
		if(modify_su > 0) {
			CompanyInfoDTO companyInfoDTO = companyInfoService.selectCompanyInfo(comId);
			
			String cpi_Birth_string = null;
			if(companyInfoDTO.getCpi_Birth() != null) {
				DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
				cpi_Birth_string = sdFormat.format(companyInfoDTO.getCpi_Birth());	
			}
			
			String tmp = companyInfoDTO.getCpi_Type();
			tmp = tmp.replace(",", "<br>");
			companyInfoDTO.setCpi_Type(tmp);
			
			modelAndView.addObject("cpi_Birth", cpi_Birth_string);
			modelAndView.addObject("companyInfoDTO", companyInfoDTO);
			modify = true;
		}
		
		modelAndView.addObject("modify", modify);
		modelAndView.addObject("companyMemberDTO", companyMemberDTO);
		modelAndView.setViewName("companyInfoWriteForm.jsp");
		
		return modelAndView;
	}
	
	public CompanyInfoDTO companyInfoSetting(HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String data[] = {"cpi_Content", "cpi_Brand", "cpi_Type", "cpi_Birth", "cpi_Blog", "cpi_Homepage",
				"cpi_Sns1", "cpi_Sns2", "cpi_Sns3", "cpi_Vision", "cpi_History",
				"cpi_Welfare", "cpi_Cafe", "cpi_Etc"};
		String dataNum_string[] = {
				"cpi_Moneyyear", "cpi_Moneybase", "cpi_Moneysell", "cpi_Moneygain", "cpl_Seq"};
		Integer[] dataNum = new Integer[dataNum_string.length];
		for(int i=0; i<data.length; i++) {
			if(request.getParameter(data[i]) == "") {
				data[i] = null;
			}else {
				data[i] = request.getParameter(data[i]);
			}
		}
		for(int i=0; i<dataNum.length; i++) {
			if(request.getParameter(dataNum_string[i]) == "") {
				dataNum[i] = null;
			}else {
				dataNum[i] = Integer.parseInt(request.getParameter(dataNum_string[i]));
			}
		}
		
		Date date = null;
		if(data[3] != null) {
			try {
				date = new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("cpi_Birth"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		if(data[2] != null) {
			String tmp = data[2];
			tmp = tmp.replace("<br>", ",");
			data[2] = tmp;
		}
		
		CompanyInfoDTO companyInfoDTO = new CompanyInfoDTO();
		
		companyInfoDTO.setCpm_Id((String)session.getAttribute("comId"));
		companyInfoDTO.setCpi_Pname(request.getParameter("cpi_Pname"));
		companyInfoDTO.setCpi_Pphone(request.getParameter("cpi_Pphone"));
		companyInfoDTO.setCpi_Pemail(request.getParameter("cpi_Pemail"));
		companyInfoDTO.setCpi_Companyname(request.getParameter("cpi_Companyname"));
		companyInfoDTO.setCpi_Firstname(request.getParameter("cpi_Firstname"));
		companyInfoDTO.setCpi_Industry(request.getParameter("cpi_Industry"));
		companyInfoDTO.setCpi_Content(data[0]);
		companyInfoDTO.setCpi_Brand(data[1]);
		companyInfoDTO.setCpi_Address(request.getParameter("cpi_Address"));
		companyInfoDTO.setCpi_Type(data[2]);
		companyInfoDTO.setCpi_Birth(date);
		companyInfoDTO.setCpi_Homepage(data[4]);
		companyInfoDTO.setCpi_Blog(data[5]);
		companyInfoDTO.setCpi_Sns1(data[6]);
		companyInfoDTO.setCpi_Sns2(data[7]);
		companyInfoDTO.setCpi_Sns3(data[8]);
		companyInfoDTO.setCpi_Tel(request.getParameter("cpi_Tel"));
		companyInfoDTO.setCpi_Moneyyear(dataNum[0]);
		companyInfoDTO.setCpi_Moneybase(dataNum[1]);
		companyInfoDTO.setCpi_Moneysell(dataNum[2]);
		companyInfoDTO.setCpi_Moneygain(dataNum[3]);
		companyInfoDTO.setCpl_Seq(dataNum[4]);
		companyInfoDTO.setCpi_Vision(data[9]);
		companyInfoDTO.setCpi_History(data[10]);
		companyInfoDTO.setCpi_Welfare(data[11]);
		companyInfoDTO.setCpi_Cafe(data[12]);
		companyInfoDTO.setCpi_Etc(data[13]);
		
		return companyInfoDTO;
	}
	
	@RequestMapping(value = "/job/company/info/companyInfoModify.do")
	public void companyInfoModify (HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		
		int su = companyInfoService.updateCompanyInfo(companyInfoSetting(request));
		
		out.print(su);
	}
	
	@RequestMapping(value = "/job/company/info/companyInfoWrite.do")
	public void companyInfoWrite(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		
		int su = companyInfoService.insertCompanyInfo(companyInfoSetting(request));
		
		out.print(su);
	}
}




































