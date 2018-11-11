package job.company.logo.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import job.resume.image.bean.RS_imageDTO;
import job.resume.image.controller.RS_imageController;

@Controller
public class companyLogoController {  
	@Autowired
	private companyLogoService logoService;
	
	//이미지 등록
	@RequestMapping(value="/job/company/logo/logoWrite.do", method=RequestMethod.POST)
	public ModelAndView logoInsert(HttpServletRequest request, 
					HttpSession session, MultipartFile img, Model model, companyLogoDTO logoDTO) {
		System.out.println("안타요?");
		String filePath =
				//학원 컴퓨터 경로
//				"C:/Users/user/git/jobplus33442/job/src/main/webapp/job/company/logo/img/storage";
				//집 컴퓨터 경로
		//		"C:/Users/jo2ri/git/jobplus/job/src/main/webapp/job/company/logo/img/storage";
				"C:/Users/samsung/git/jobplus336/job/src/main/webapp/job/company/logo/img/storage";
		String fileName = img.getOriginalFilename();
		File file = new File(filePath, fileName);
		System.out.println("file = " + file);
		
		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
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
			
		//화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);		
		modelAndView.setViewName("logoWrite.jsp");

		return modelAndView;
	}
	//글 개수 확인하기
	@RequestMapping(value="/job/company/logo/logoCount.do", method=RequestMethod.POST)
	public void getLogoOfId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("[logoCtr] :: 저장된 이미지 개수를 확인합니다");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String cpm_Id = "comId";
		int numberOfLogo = logoService.getLogoOfId(cpm_Id); 
		System.out.println("[logoCtr] numberOflogo : " + numberOfLogo);
		out.print(numberOfLogo);
	}
	
	//쓴 목록 보기
	@RequestMapping(value="/job/company/logo/logoList.do")
	public ModelAndView logoListOfId(HttpServletRequest request) {
		String path = companyLogoController.class.getResource("").getPath(); // 현재 클래스의 절대 경로를 가져온다.
	    System.out.println(path); //--> 절대 경로가 출력됨
		//데이터
		String cpm_Id = "comId";
		String m_Id = request.getParameter(cpm_Id);
		String str = request.getParameter("pg");
		int pg = 0;
		if(str != null && str != "") {
			pg = Integer.parseInt(str);
		}else {
			pg = 1;
		}

		//목록 수 : 3개씩
		int endNum = pg * 3;
		int startNum = endNum - 2;
//		int endNum = 10;
//		int startNum = 1;
		List<companyLogoDTO> list = logoService.logoListOfId(startNum, endNum, cpm_Id);
		System.out.println("list :: " + list);
		//페이징 처리
		int totalA = logoService.getLogoOfId(cpm_Id);
		int totalP = (totalA + 2) / 3;		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		if(endPage > totalP) endPage = totalP;
		//네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.setViewName("logoList.jsp");
		return modelAndView;		
	}
	
}
