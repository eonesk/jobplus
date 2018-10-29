package job.resume.image.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
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
	
	@RequestMapping(value="/job/resume/image/imageWriteForm.do", method=RequestMethod.GET)
	public ModelAndView imageWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		//modelAndView.addObject("display", "../image/imageWriteForm.jsp");
		modelAndView.setViewName("imageWriteForm.jsp");
		return modelAndView;
	}
	
	//사진 등록
	@RequestMapping(value="/job/resume/image/imageWrite.do", method=RequestMethod.POST)
	public ModelAndView imageWrite(HttpServletRequest request,
			HttpSession session, MultipartFile img, RS_imageDTO imageDTO) {		
		String filePath =
				//학원 컴퓨터 경로
				"c:/users/user/git/jobplus666/job/src/main/webapp/job/resume/image/img/storage";
				//집 컴퓨터 경로
//				"c:/Java/spring/workspace/job/src/main/webapp/job/resume/image/img/storage";
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
		imageDTO.setRsim_Usertitle(request.getParameter("Rsim_Usertitle"));
	
		//DB
		int su = imageService.imageWrite(imageDTO);
		//화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("imageWrite.jsp");
		return modelAndView;
	}
	
//	//글 개수 확인하기
//	@RequestMapping(value="/job/resume/image/imageForm.do")
//	public void getImageOfId(HttpServletRequest request) {
//		String memId = "num1";
//		int getImageOfId = imageService.getImageOfId(memId); 	
//	}
//	
	
	//쓴 글 확인하기
	@RequestMapping(value="")
	public ModelAndView viewImageOfId(HttpServletRequest request) {
		
		// 임의로 아이디 지정 (session값)
		String memId = "num1";
		int getImageOfId = imageService.getImageOfId(memId);
		//데이터
		String m_Id = request.getParameter(memId);
		int pg = Integer.parseInt(request.getParameter("pg"));
		//DB
		RS_imageDTO imageDTO = new RS_imageDTO();
		imageDTO.setM_Id(memId);
		imageDTO = imageService.viewImageOfId(m_Id);
		//네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("imageDTO", imageDTO);
		modelAndView.addObject("m_Id", m_Id);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("");
		return modelAndView;
		
		
	}
	
	//쓴 목록 보기
	@RequestMapping(value="/job/resume/image/imageList.do")
	public ModelAndView ImageListOfId(HttpServletRequest request) {
		String path = RS_imageController.class.getResource("").getPath(); // 현재 클래스의 절대 경로를 가져온다.
	    System.out.println(path); //--> 절대 경로가 출력됨
		//데이터
		String memId = "num1";
		String m_Id = request.getParameter(memId);
		String str = request.getParameter("pg");
		int pg = 0;
		if(str != null && str != "") {
			pg = Integer.parseInt(str);
		}else {
			pg = 1;
		}
		  // Value of counter to be checked

		//목록 수 : 3개씩
		int endNum = pg * 3;
		int startNum = endNum - 2;
//		int endNum = 10;
//		int startNum = 1;
		List<RS_imageDTO> list = imageService.ImageListOfId(startNum, endNum, memId);
		System.out.println("list :: " + list);
		//페이징 처리
		int totalA = imageService.getImageOfId(memId);
		int totalP = (totalA + 2) / 3;		// 총페이지수 = 9
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		if(endPage > totalP) endPage = totalP;
		//네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
//		modelAndView.addObject("m_Id", m_Id);
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.setViewName("imageList.jsp");
		return modelAndView;		
	}
}











