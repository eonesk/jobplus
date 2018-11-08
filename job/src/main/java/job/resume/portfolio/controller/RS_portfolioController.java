package job.resume.portfolio.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import job.resume.portfolio.bean.RS_portfolioDTO;

@Controller
public class RS_portfolioController {
	@Autowired
	private RS_portfolioService portfolioService;
	
	@RequestMapping(value="/job/resume/portfolio/portfolioWriteForm.do", method=RequestMethod.GET)
	public ModelAndView portfolioWriteForm(HttpServletRequest request,Model model) {
		
//		String memId = request.getParameter(memId);
//		String memId = "num1";
		
//		List <RS_portfolioDTO> list =portfolioService.selectPortfolioList(memId); 
//		System.out.println( "list" + list);
//		model.addAttribute("list", list);
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("portfolioWriteForm.jsp");
		return modelAndView;
	}
	
	//파일 등록
	@RequestMapping(value="/job/resume/portfolio/portfolioWrite.do", method=RequestMethod.POST)
	public ModelAndView portfolioWrite(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, MultipartFile pfFile, RS_portfolioDTO portfolioDTO) throws IOException {
		
		String msg = "";
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    MultipartFile multipartFile = null;
	    while(iterator.hasNext()){
	        multipartFile = multipartHttpServletRequest.getFile(iterator.next());
	        if(multipartFile.isEmpty() == false){
	            System.out.println("------------- file start -------------");
	            System.out.println("name :: "  + multipartFile.getName());
	            System.out.println("filename :: "  + multipartFile.getOriginalFilename());
	            System.out.println("size :: "  + multipartFile.getSize());
	            System.out.println("-------------- file end --------------");
	        }
	    }
		
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		String filePath = 
				// 학원 컴퓨터 경로
//				"C:/Users/user/git/jobplus655/job/src/main/webapp/job/resume/portfolio/img/storage";
				// 집 컴퓨터 경로
				"C:/Users/jo2ri/git/jobplus555/job/src/main/webapp/job/resume/portfolio/img/storage";
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
	
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";
		
		String rspf_Usertitle = request.getParameter("rspf_Usertitle");
		System.out.println("rspf_Usertitle>>>" + rspf_Usertitle);
		
		String rspf_Type = request.getParameter("rspf_Type");
		System.out.println("rspf_Type>>>" + rspf_Type);
		
		String rspf_Fileorurl = request.getParameter("rspf_Fileorurl");
		System.out.println("rspf_Fileorurl>>>>" + rspf_Fileorurl);
		System.out.println("rspf_Fileorurl[DTO] : " + portfolioDTO.getrspf_Fileorurl());
		
		String rspf_Url = request.getParameter("rspf_Url");
		System.out.println("rspf_Url>>>" + rspf_Url);

		String rspf_File = fileName;
		System.out.println("rspf_File>>>>" + rspf_File);
		
//		if(fileName == "") {
//			fileName="파일없음";
//		}
//		if(request.getParameter("rspf_Url")==null) {
//			rspf_Url="URL없음";
//		}
//		System.out.println("다시~~rspf_Url>>>" + rspf_Url);
			
		// 데이터
		portfolioDTO.setM_Id(memId);
		portfolioDTO.setrspf_Type(rspf_Type);
		portfolioDTO.setrspf_Fileorurl(rspf_Fileorurl);
		portfolioDTO.setrspf_Url(rspf_Url);
		portfolioDTO.setrspf_File(fileName);
		portfolioDTO.setrspf_Usertitle(rspf_Usertitle);
		
		// DB
		int su = portfolioService.portfolioWrite(portfolioDTO);
		msg = "등록에 성공 했씁니다.";
		System.out.println(msg);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);		       
		modelAndView.setViewName("portfolioWrite.jsp");
		return modelAndView;
	}
	
//	@RequestMapping(value = "/job/resume/portfolio/portfolioDown.do", method = RequestMethod.GET)
//	public void fileDownload( HttpServletResponse response, HttpServletRequest request) throws IOException{
//		HttpServletResponse response) throws IOException {
//			System.out.println("bbbbbbb");
//		String fileName = request.getParameter("rspf_File");
//		 byte[] fileByte = FileUtils.readFileToByteArray(new File("C:/Users/jo2ri/git/jobplus555/job/src/main/webapp/job/resume/portfolio/img/storage/"+fileName));
//		 
//		 response.setContentType("application/octet-stream");
//		 response.setContentLength(fileByte.length);
//		 response.setHeader("Content-Disposition", "attachment; FileName=\"" + URLEncoder.encode(fileName, "UTF-8")+"\";");
//		 response.setHeader("Content-Transfer-Encoding",  "binary");
//		 response.getOutputStream().write(fileByte);
//		 
//		 response.getOutputStream().flush();
//		 response.getOutputStream().close();
//	}
	
	@RequestMapping(value="/job/resume/portfolio/portfolioCount.do", method=RequestMethod.POST)
	public void getportfolioOfId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";
		
		//memId가 가진 글 개수
		int numberOfportfolio = portfolioService.getportfolioOfId(memId);
		System.out.println("[RS_portfolioCon] numberOfportfolio : " + numberOfportfolio);
		out.print(numberOfportfolio);
	}

	@RequestMapping(value="/job/resume/portfolio/portfolioLoad.do")
	public ModelAndView portfolioListOfId(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String path = RS_portfolioController.class.getResource("").getPath(); // 현재 클래스의 절대 경로를 가져온다.
	    System.out.println(path); //--> 절대 경로가 출력됨
	    
		String memId = "num1";
		String m_Id = request.getParameter(memId);
		String str = request.getParameter("pg");
		int pg = 0;
		if(str != null && str != "") {
			pg = Integer.parseInt(str);
		}else {
			pg = 1;
		}

		//목록 수 : 10개씩
		int endNum = pg * 10;
		int startNum = endNum - 9;
		
		List<RS_portfolioDTO> list = portfolioService.portfolioListOfId(startNum, endNum, memId);
		System.out.println("list :: " + list.toString());
		//페이징 처리
		int totalA = portfolioService.getportfolioOfId(memId);
		int totalP = (totalA + 9) / 10;		// 총페이지수 = 9
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
		modelAndView.setViewName("portfolioLoad.jsp");

		return modelAndView;		
	}
	
//	@RequestMapping(value="/job/resume/portfolio/portfolioLoad.do")
//	public ModelAndView viewportfolioOfId(HttpServletRequest request,HttpServletResponse response) throws IOException {
//		
//		ModelAndView modelAndView = new ModelAndView();
//		System.out.println("타주세요 제발");
//		/** Session으로 넘어오는 memID값 임시 지정 */
//		String memId = "num1";
//		
//		List<RS_portfolioDTO> portfolioList = portfolioService.viewportfolioOfId(memId);
//		System.out.println("떠라좀"+portfolioList);
//		JSONObject jsonObject = new JSONObject();
//		JSONArray items = new JSONArray();
//		
//		for(int i = 0; i < portfolioList.size(); i++) {
//			RS_portfolioDTO portfolioDTO = portfolioList.get(i);
//			
//			System.out.println("rspf_Type::" +portfolioDTO.getrspf_Type());
//			System.out.println("rspf_Fileorurl::" +portfolioDTO.getrspf_Fileorurl());
//			
//			JSONObject temp = new JSONObject();
//			temp.put("rspf_Type", 		portfolioDTO.getrspf_File());
//			temp.put("rspf_Fileorurl", 		portfolioDTO.getrspf_Fileorurl());
//			temp.put("rspf_Url",	portfolioDTO.getrspf_Url());
//			temp.put("rspf_File", 			portfolioDTO.getrspf_File());
//			temp.put("m_Id",	portfolioDTO.getM_Id());
//			temp.put("rspf_Usertitle",	portfolioDTO.getrspf_Usertitle());
//			items.put(i, temp);
//			
//		}
//		
//		jsonObject.put("items", items);
//		
//		modelAndView.addObject("jsonObject", jsonObject);
//		modelAndView.setViewName("/job/resume/portfolio/portfolioJson.jsp");
//		
//		System.out.println("[RS_portfolioController] jsonObject 출력 : " + jsonObject);
//		
//		return modelAndView;
//		
//	}
}
