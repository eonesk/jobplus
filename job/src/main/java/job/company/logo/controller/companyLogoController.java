package job.company.logo.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import job.company.logo.bean.companyLogoDTO;

@Controller
public class companyLogoController { 
	@Autowired
	private companyLogoService logoService;
		
	//이미지 등록
	@RequestMapping(value="/job/company/logo/logoWrite.do", method=RequestMethod.POST)
	public void logoInsert(HttpServletRequest request, 
					HttpSession session, MultipartFile logo, Model model, companyLogoDTO logoDTO) {
		String filePath =
				//학원 컴퓨터 경로
				"C:/Users/user/git/jobplus33442/job/src/main/webapp/job/company/logo/img/storage";
				//집 컴퓨터 경로
//				"C:/Users/jo2ri/git/jobplus555/job/src/main/webapp/job/resume/image/img/storage";
		
		String fileName = logo.getOriginalFilename();
		File file = new File(filePath, fileName);
		System.out.println("file = " + file);
		
		try {
			FileCopyUtils.copy(logo.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		//임의로 아이디 지정(session값)
		String cpm_Id = "comId";		
		//데이터
		logoDTO.setcpm_Id(cpm_Id);
		logoDTO.setCpl_Name(fileName);
		System.out.println("fileName :: " + fileName);
		//DB
		int su = logoService.logoInsert(logoDTO);
		model.addAttribute("cpl_Seq", request.getParameter(fileName));
		//화면 네비게이션
//		model.addAttribute("logoDTO", logoDTO);
//		if(request.getParameter("cpl_Seq") != null) {
//			System.out.println(request.getParameter("cpl_Seq"));
//			model.addAttribute("rsim__Seq", request.getParameter("cpl_Seq"));
//		}
		
	}	
}












