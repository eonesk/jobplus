package job.resume.foreign.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import job.resume.foreign.bean.RS_foreignDTO;
import job.resume.foreign.controller.RS_foreignController;
import job.resume.pr.bean.RS_prDTO;

@Controller
public class RS_foreignController {
	@Autowired
	private RS_foreignService foreignService;
	
//	@RequestMapping(value="/job/resume/foreign/foreignWriteForm.do")
//	public ModelAndView foreignWriteForm() {
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("foreignWriteForm.jsp");
//		return modelAndView;
//	}
	
	//등록
	@RequestMapping(value="/job/resume/foreign/foreignWrite.do", method=RequestMethod.POST)
	public void foreignWrite(HttpServletRequest request,
							HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";
		
		// 넘어오는 변수값 콘솔 확인
		String rsf_Name = request.getParameter("rsf_Name");
		String rsf_Startdate = request.getParameter("rsf_Startdate");
		String rsf_Enddate = request.getParameter("rsf_Enddate");
		String rsf_Content = request.getParameter("rsf_Content");
		String m_Id = memId;
		String rsf_Usertitle = request.getParameter("rsf_Usertitle");
	
		System.out.println("[RS_foreignCon] : " + rsf_Name + " // " + rsf_Startdate + " // " + rsf_Enddate + " // " 
				+ rsf_Content + " // " + m_Id + " // " + rsf_Usertitle);
		
		Date Startdate=null;
		Date Enddate=null;
		try {
			Startdate = new SimpleDateFormat("yyyyMMdd").parse(rsf_Startdate);
			Enddate = new SimpleDateFormat("yyyyMMdd").parse(rsf_Enddate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		RS_foreignDTO foreignDTO = new RS_foreignDTO();
		foreignDTO.setM_Id(memId);
		foreignDTO.setRsf_Name(rsf_Name);
		foreignDTO.setRsf_Startdate(Startdate);
		foreignDTO.setRsf_Enddate(Enddate);
		foreignDTO.setRsf_Content(rsf_Content);
		foreignDTO.setRsf_Usertitle(rsf_Usertitle);
	
		//DB
		int su = foreignService.foreignWrite(foreignDTO);
		out.print(su);
	}
	
	@RequestMapping(value="/job/resume/foreign/foreignLoadCount.do", method=RequestMethod.POST)
	public void getForeignOfId(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";
		
		//memId가 가진 글 개수
		int numberOfForeign = foreignService.getForeignOfId(memId);
		System.out.println("[RS_foreignCon] numberOfForeign : " + numberOfForeign);
		out.print(numberOfForeign);
	}
	
	//글 확인(이거를 다시 폼으로 불러옴)
	@RequestMapping(value="/job/resume/foreign/foreignLoadlist.do")
	public ModelAndView viewForeignOfId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("[RS_foreignController] viewForeignOfId");
		
		
		ModelAndView modelAndView = new ModelAndView();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";
		
		//memId가 가진 글 리스트
		List<RS_foreignDTO> viewForeignOfId = foreignService.viewForeignOfId(memId);
		System.out.println("??????"+viewForeignOfId);
		JSONObject jsonObject = new JSONObject();
		JSONArray items = new JSONArray();
		
		// rsprUserTitleList 리스트값 확인
		for(int i = 0; i < viewForeignOfId.size(); i++) {
			RS_foreignDTO foreignDTO = viewForeignOfId.get(i);
			System.out.println("[PF] foreignDTO 출력 : " + foreignDTO);
			
			JSONObject temp = new JSONObject();
			temp.put("rsf_Seq",			foreignDTO.getRsf_Seq());
			temp.put("rsf_Name",		foreignDTO.getRsf_Name());
			temp.put("rsf_Startdate",	foreignDTO.getRsf_Startdate());
			temp.put("rsf_Enddate",		foreignDTO.getRsf_Enddate());
			temp.put("rsf_Content",		foreignDTO.getRsf_Content());
			temp.put("m_Id", 			foreignDTO.getM_Id());
			temp.put("rsf_Usertitle",	foreignDTO.getRsf_Usertitle());
			items.put(i, temp);
		}		
		jsonObject.put("items", items);
		
		modelAndView.addObject("jsonObject", jsonObject);
		modelAndView.setViewName("/job/resume/foreign/foreignJson.jsp");
		
		System.out.println("[RS_foreignCon] jsonObject 출력 : " + jsonObject);
		return modelAndView;
	}
}
		
//		// 임의로 아이디 지정 (session값)
//		
//		int getforeignOfId = foreignService.getForeignOfId(memId);
//		//데이터
//		String m_Id = request.getParameter(memId);
//		int pg = Integer.parseInt(request.getParameter("pg"));
//		//DB
//		RS_foreignDTO foreignDTO = new RS_foreignDTO();
//		foreignDTO.setM_Id(memId);
//		foreignDTO = foreignService.viewForeignOfId(m_Id);
//		//네비게이션
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("foreignDTO", foreignDTO);
//		modelAndView.addObject("m_Id", m_Id);
//		modelAndView.addObject("pg", pg);
//		modelAndView.setViewName("");
//		return modelAndView;
//	}
//	
//	//쓴 목록 보기
//	@RequestMapping(value="/job/resume/foreign/foreignList.do")
//	public ModelAndView foreignListOfId(HttpServletRequest request) {
//	
//		//데이터
//		String memId = "num1";
//		String m_Id = request.getParameter(memId);
//		String str = request.getParameter("pg");
//		int pg = 0;
//		if(str != null && str != "") {
//			pg = Integer.parseInt(str);
//		}else {
//			pg = 1;
//		}
//		  // Value of counter to be checked
//
//		//목록 수 : 10개씩
//		int endNum = pg * 5;
//		int startNum = endNum - 4;
////		int endNum = 10;
////		int startNum = 1;
//		List<RS_foreignDTO> list = foreignService.foreignListOfId(startNum, endNum, memId);
//		System.out.println("list :: " + list);
//		//페이징 처리
//		int totalA = foreignService.getForeignOfId(memId);
//		int totalP = (totalA + 4) / 5;		// 총페이지수 = 9
//		int startPage = (pg-1)/3*3+1;
//		int endPage = startPage + 2;
//		if(endPage > totalP) endPage = totalP;
//		//네비게이션
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("pg", pg);
////		modelAndView.addObject("m_Id", m_Id);
//		modelAndView.addObject("list", list);
//		modelAndView.addObject("startPage", startPage);
//		modelAndView.addObject("endPage", endPage);
//		modelAndView.addObject("totalP", totalP);
//		modelAndView.setViewName("foreignList.jsp");
//		return modelAndView;		
//	}
//}
