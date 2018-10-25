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

@Controller
public class RS_imageController {
	@Autowired
	private RS_imageService imageService;
	
	@RequestMapping(value="/rsimage/imageWriteForm.do", method=RequestMethod.GET)
	public ModelAndView imageWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "../rsimage/imageWriteForm.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	@RequestMapping(value="/rsimage/imageWrite.do", method=RequestMethod.POST)
	public ModelAndView imageWrite(HttpServletRequest request,
			HttpSession session, MultipartFile img, RS_imageDTO imageDTO) {		
		String filePath =
				"../main/webapp/imagestorage";
		String fileName = img.getOriginalFilename();
		File file = new File(filePath, fileName);
		//파일복사
		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//데이터
		imageDTO.setRsimName(fileName);
		imageDTO.setRsimUsertitle(request.getParameter("rsimUsertitle"));
		//DB
		int su = imageService.imageWrite(imageDTO);
		//화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.addObject("display", "../rsimage/imageWrite.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
}
