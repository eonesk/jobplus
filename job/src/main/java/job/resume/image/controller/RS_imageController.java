package job.resume.image.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public ModelAndView imageWriteForm(Model model) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "imageForm.jsp");
		String memId = "num1";
		RS_imageDTO imageDTO = new RS_imageDTO();
		imageDTO.setM_Id(memId);
		imageDTO = imageService.ImageTopList(memId);
		System.out.println("dataList :: " + imageDTO);
//		modelAndView.addObject("imageDTO", imageDTO);
		model.addAttribute("imageDTO", imageDTO);
		System.out.println("이ㅓ거");
		modelAndView.setViewName("imageForm.jsp");
		System.out.println("감???");
		return modelAndView;
	}
	
	//사진 등록
	@RequestMapping(value="/job/resume/image/imageWrite.do", method=RequestMethod.POST)
	public ModelAndView imageWrite(HttpServletRequest request,
			HttpSession session, MultipartFile img, RS_imageDTO imageDTO) {		
		String filePath =
				//학원 컴퓨터 경로
//				"c:/users/user/git/jobplus/job/src/main/webapp/job/resume/image/img/storage";
				//집 컴퓨터 경로
				"C:/Users/jo2ri/git/jobplus8866/job/src/main/webapp/job/resume/image/img/storage";
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
		

		System.out.println("파일을 봅니다1 ::" + imageDTO.getRsim_Name());
		System.out.println("파일을 봅니다2 ::" + imageDTO.getRsim_Usertitle());
		
		//DB
		int su = imageService.imageWrite(imageDTO);
		//화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("imageWrite.jsp");
		
		return modelAndView;
	}
	
	//글 개수 확인하기
	@RequestMapping(value="/job/resume/image/imageCount.do", method=RequestMethod.POST)
	public void getImageOfId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("[imageCtr] :: 저장된 이미지 개수를 확인합니다");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String memId = "num1";
		int numberOfImg = imageService.getImageOfId(memId); 
		System.out.println("[RS_imageCtr] numberOfImg : " + numberOfImg);
		out.print(numberOfImg);
	}

//	//쓴 글 확인하기
//	@RequestMapping(value="/job/resume/image/imageLoad.do", method=RequestMethod.POST)
//	public ModelAndView viewImageOfId(HttpServletRequest request) throws IOException {
//		
//		ModelAndView modelAndView = new ModelAndView();
//		
//		// 임의로 아이디 지정 (session값)
//		String memId = "num1";
//		
//		List<RS_imageDTO> viewImageOfId = imageService.viewImageOfId(memId);
//		
//		JSONObject jsonObject = new JSONObject();
//		JSONArray items = new JSONArray();
//		
//		//List값 확인
//		for (int i = 0; i < viewImageOfId.size(); i++) {
//			RS_imageDTO imageDTO = viewImageOfId.get(i);
//			System.out.println("[RS_imageCtr]DTO출력 :: " + imageDTO);
//			
//			JSONObject temp = new JSONObject();
//			temp.put("rsim_Seq", 		imageDTO.getRsim_Seq());
//			temp.put("rsim_Name", 		imageDTO.getRsim_Name());
//			temp.put("m_Id",			imageDTO.getM_Id());
//			temp.put("rsim_Usertitle", 	imageDTO.getRsim_Usertitle());
//			items.put(i, temp);
//		}
//		jsonObject.put("items", items);
//		
//		modelAndView.addObject("jsonObject", jsonObject);
//		modelAndView.setViewName("/job/resume/image/imageJson.jsp");
//		
//		System.out.println("[RS_imageCtr] jsonObject 출력 : " + jsonObject);		
//		return modelAndView;
//	}
//	
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











