package job.resume.portfolio.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import job.resume.portfolio.bean.RS_portfolioDTO;

@Controller
public class RS_portfolioController {
	@Autowired
	private RS_portfolioService portfolioService;
	
	@RequestMapping(value="/job/resume/portfolio/portfolioWriteForm.do", method=RequestMethod.GET)
	public ModelAndView portfolioWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("portfolioWriteForm.jsp");
		return modelAndView;
	}
	
	//파일 등록
	@RequestMapping(value="/job/resume/portfolio/portfolioWrite.do", method=RequestMethod.POST)
	public ModelAndView portfolioWrite(HttpServletRequest request,
			HttpSession session, MultipartFile pfFile, RS_portfolioDTO portfolioDTO) {
		
		String filePath = 
				// 학원 컴퓨터 경로
				"c:/users/user/git/jobplus666/job/src/main/webapp/job/resume/portfolio/img/storage";
				// 집 컴퓨터 경로
//				"c:/Java/spring/workspace/job/src/main/webapp/job/resume/portfolio/img/storage";
		String fileName = pfFile.getOriginalFilename();
		File file = new File(filePath, fileName);

		// 파일 복사
		try {
			FileCopyUtils.copy(pfFile.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 임의로 아이디 지정 (session값)
		String memId = "num1";
		// 데이터
		portfolioDTO.setM_Id(memId);
		portfolioDTO.setRs_pfType(request.getParameter("rs_pfType"));
		portfolioDTO.setRs_pfFileorurl(request.getParameter("rs_pfFileorurl"));
		portfolioDTO.setRs_pfUrl(request.getParameter("rs_pfUrl"));
		portfolioDTO.setRs_pfFile(fileName);
		portfolioDTO.setRs_pfUsertitle(request.getParameter("rs_pfUsertitle"));

		// DB
		int su = portfolioService.portfolioWrite(portfolioDTO);
		System.out.println("gggg=" + portfolioDTO);
		// 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);		
		modelAndView.setViewName("portfolioWrite.jsp");
		return modelAndView;
//		
//		ModelAndView modelAndView = new ModelAndView();
//		String rs_pfUsertitle = request.getParameter("rs_pfUsertitle");
//		System.out.println("rs_pfUsertitle" + rs_pfUsertitle);
//		
//		String rs_pfType = request.getParameter("rs_pfType");
//		System.out.println("rs_pfType" + rs_pfType);
//		
//		String rs_pfFileorurl = request.getParameter("rs_pfFileorurl");
//		System.out.println("rs_pfFileorurl" + rs_pfFileorurl);
//		
//		String rs_pfUrl = request.getParameter("rs_pfUrl");
//		System.out.println("rs_pfUrl" + rs_pfUrl);
//	
//		String rs_pfFile = fileName;
//		System.out.println("rs_pfFile" + rs_pfFile);
//		
//		
//		return modelAndView;
	}
}
