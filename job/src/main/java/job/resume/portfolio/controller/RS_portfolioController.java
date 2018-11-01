package job.resume.portfolio.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import job.resume.portfolio.bean.RS_portfolioDTO;
import job.resume.pr.bean.RS_prDTO;

@Controller
public class RS_portfolioController {
	@Autowired
	private RS_portfolioService portfolioService;
	
	@RequestMapping(value="/job/resume/portfolio/portfolioWriteForm.do", method=RequestMethod.GET)
	public ModelAndView portfolioWriteForm(HttpServletRequest request,Model model) {
		
//		String memId = request.getParameter(memId);
		String memId = "num1";
		
//		List <RS_portfolioDTO> list =portfolioService.selectPortfolioList(memId); 
//		System.out.println( "list" + list);
//		model.addAttribute("list", list);
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("portfolioList.jsp");
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
	            System.out.println("name"  + multipartFile.getName());
	            System.out.println("filename"  + multipartFile.getOriginalFilename());
	            System.out.println("size"  + multipartFile.getSize());
	            System.out.println("-------------- file end --------------");
	        }
	    }
		
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		String filePath = 
				// 학원 컴퓨터 경로
				"C:/Users/user/git/jobplus/job/src/main/webapp/job/resume/portfolio/img/storage";
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
	
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";
		
////////////////
	String rs_pfUsertitle = request.getParameter("rs_pfUsertitle");
	System.out.println("rs_pfUsertitle>>>" + rs_pfUsertitle);
	
	String rs_pfType = request.getParameter("rs_pfType");
	System.out.println("rs_pfType>>>" + rs_pfType);
	
	String rs_pfFileorurl = request.getParameter("rs_pfFileorurl");
	System.out.println("rs_pfFileorurl>>>>" + rs_pfFileorurl);
	System.out.println("rs_pfFileorurl[DTO] : " + portfolioDTO.getRs_pfFileorurl());
	
	String rs_pfUrl = request.getParameter("rs_pfUrl");
	System.out.println("rs_pfUrl>>>" + rs_pfUrl);

	String rs_pfFile = fileName;
	System.out.println("rs_pfFile>>>>" + rs_pfFile);
			
		// 데이터
		portfolioDTO.setM_Id(memId);
		portfolioDTO.setRs_pfType(rs_pfType);
		portfolioDTO.setRs_pfFileorurl(rs_pfFileorurl);
		portfolioDTO.setRs_pfUrl(rs_pfUrl);
		portfolioDTO.setRs_pfFile(fileName);
		portfolioDTO.setRs_pfUsertitle(rs_pfUsertitle);
		
		// DB
		int su = portfolioService.portfolioWrite(portfolioDTO);
		msg = "등록에 성공 했씁니다.";
		System.out.println(msg);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);		       
		modelAndView.setViewName("");
		return modelAndView;
	}
	
	@RequestMapping(value="/job/resume/portfolio/portfolioCount.do", method=RequestMethod.POST)
	public void getportfolioOfId(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		System.out.println("뿔래랠래래래래래래");
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
	public ModelAndView viewportfolioOfId(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("타주세요 제발");
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";
		
		List<RS_portfolioDTO> portfolioList = portfolioService.viewportfolioOfId(memId);
		System.out.println("떠라좀"+portfolioList);
		JSONObject jsonObject = new JSONObject();
		JSONArray items = new JSONArray();
		
		for(int i = 0; i < portfolioList.size(); i++) {
			RS_portfolioDTO portfolioDTO = portfolioList.get(i);
			
			System.out.println("rs_pfType::" +portfolioDTO.getRs_pfType());
			System.out.println("rs_pfFileorurl::" +portfolioDTO.getRs_pfFileorurl());
			
			JSONObject temp = new JSONObject();
			temp.put("rs_pfType", 		portfolioDTO.getRs_pfFile());
			temp.put("rs_pfFileorurl", 		portfolioDTO.getRs_pfFileorurl());
			temp.put("rs_pfUrl",	portfolioDTO.getRs_pfUrl());
			temp.put("rs_pfFile", 			portfolioDTO.getRs_pfFile());
			temp.put("m_Id",	portfolioDTO.getM_Id());
			temp.put("rs_pfUsertitle",	portfolioDTO.getRs_pfUsertitle());
			items.put(i, temp);
			
		}
		
		jsonObject.put("items", items);
		
		modelAndView.addObject("jsonObject", jsonObject);
		modelAndView.setViewName("/job/resume/portfolio/portfolioJson.jsp");
		
		System.out.println("[RS_portfolioController] jsonObject 출력 : " + jsonObject);
		
		return modelAndView;
		
	}
}
