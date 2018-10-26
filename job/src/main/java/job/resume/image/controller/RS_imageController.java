package job.resume.image.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import job.resume.image.bean.RS_imageDTO;
import job.resume.image.dao.RS_imageDAO;

@Controller
public class RS_imageController {
	@Autowired
	private RS_imageService imageService;
	
	@RequestMapping(value="/job/resume/image/imageWriteForm.do", method=RequestMethod.GET)
	public ModelAndView imageWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		//modelAndView.addObject("display", "../image/imageWriteForm.jsp");
		modelAndView.setViewName("imageWriteForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/job/resume/image/imageWrite.do", method=RequestMethod.POST)
	public ModelAndView imageWrite(HttpServletRequest request,
			HttpSession session, MultipartFile img, RS_imageDTO imageDTO) {		
		String filePath =
				"C:/Users/user/git/jobplus1/job/src/main/webapp/job/resume/image/img/storage";	//경로 다시 설정
		String fileName = img.getOriginalFilename();
		File file = new File(filePath, fileName);
		System.out.println("file=" + file);
		//파일복사
		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 임의로 아이디 지정 (session값)
		String memId = "num1";
		//데이터
		imageDTO.setM_Id(memId);
		imageDTO.setRsim_Name(fileName);
		imageDTO.setRsim_Usertitle(request.getParameter("rsim_Usertitle"));
		//DB
		int su = imageService.imageWrite(imageDTO);
		//화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		//modelAndView.addObject("display", "../image/imageWrite.jsp");
		modelAndView.setViewName("imageWrite.jsp");
		return modelAndView;
	}
}