package job.resume.pr.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import job.resume.pr.bean.RS_prDTO;

@Controller
public class RS_prController {

	@Autowired
	private RS_prService rsprService;
	
	@RequestMapping(value="/job/resume/pr/rsprSave.do", method=RequestMethod.POST)
	public void rsprSave(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";
		
		// 넘어오는 변수값 콘솔 확인
		String rsprTitle = request.getParameter("rsprTitle");
		System.out.println("[RS_prController] rsprTitle : " + rsprTitle);
		
		String rsprContent = request.getParameter("rsprContent");
		System.out.println("[RS_prController] rsprContent : " + rsprContent);
		
		String rsprUserTitle = request.getParameter("rsprUserTitle");
		System.out.println("[RS_prController] rsprUserTitle : " + rsprUserTitle);
		// DTO에 변수 저장
		RS_prDTO rsprDTO = new RS_prDTO();
		
		rsprDTO.setRspr_Title(rsprTitle);
		rsprDTO.setRspr_Content(rsprContent);
		rsprDTO.setM_Id(memId);
		rsprDTO.setRspr_UserTitle(rsprUserTitle);
		
		// DB작업
		int saveCount = rsprService.rsprSave(rsprDTO);		
		System.out.println("[RS_prController] saveCount : " + saveCount);
				
		out.print(saveCount);
	}
	
	@RequestMapping(value="/job/resume/pr/rsprLoadCount.do", method=RequestMethod.POST)
	public void rsprLoadCount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num5";
		
		// DB작업 : memID가 가지고 있는 자소서의 개수를 구함
		int numberOfPr = rsprService.selectNumberOfPr(memId);		
		System.out.println("[RS_prController] numberOfPr : " + numberOfPr);
		
		out.print(numberOfPr);
	}
	
	@RequestMapping(value="/job/resume/pr/rsprLoad.do", method=RequestMethod.POST)
	public void rsprLoad(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";
		
		// memId가 가지고 있는 자소서의 rsprUserTitle을 select해서 list에 추가
		List<RS_prDTO> rsprUserTitleList = rsprService.selectRsprUserTitleList(memId);
		
		// rsprUserTitleList 리스트값 확인
		for(int i = 0; i < rsprUserTitleList.size(); i++) {
			RS_prDTO testDTO = rsprUserTitleList.get(i);
			System.out.println("[RS_prController] testDTO 출력 : " + testDTO.toString());
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rsprUserTitleList", rsprUserTitleList);
		System.out.println("[RS_prController] map 출력 : " + map);
		JSONObject jsonObject = new JSONObject();
		jsonObject.putAll(map);
		System.out.println("[RS_prController] jsonObject 출력 : " + jsonObject);
		
		
		out.println(jsonObject);
	}
}



