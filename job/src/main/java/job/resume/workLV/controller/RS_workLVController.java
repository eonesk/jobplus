package job.resume.workLV.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
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

import job.resume.workLV.bean.RS_workLVDTO;

@Controller
public class RS_workLVController {
	@Autowired
	RS_workLVService rs_workLVService;
	
	@RequestMapping(value="/job/resume/workLV/rswSave.do", method=RequestMethod.POST)
	public void rswSave(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = (String) session.getAttribute("memId");	
		
		String rsw_company   = request.getParameter("rsw_company");
		String rsw_dept      = request.getParameter("rsw_dept");
	    String rsw_startDate_str = request.getParameter("rsw_startDate");
	    String rsw_endDate_str   = request.getParameter("rsw_endDate");
		String rsw_job       = request.getParameter("rsw_job");
	    String rsw_position  = request.getParameter("rsw_position");
	    String rsw_pay       = request.getParameter("rsw_pay");
		String rsw_part      = request.getParameter("rsw_part");
	    String rsw_isNow     = request.getParameter("rsw_isNow");
	    String rsw_career    = request.getParameter("rsw_career");
	    String rsw_userTitle = request.getParameter("rsw_userTitle");
	    String m_id          = memId; 
	    
	  
		Date rsw_startDate = null;
		Date rsw_endDate = null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");		
		
		try {
			rsw_startDate = dateFormat.parse(rsw_startDate_str);
			rsw_endDate = dateFormat.parse(rsw_endDate_str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		RS_workLVDTO rs_workLVDTO = new RS_workLVDTO();
		
		rs_workLVDTO.setRsw_company(rsw_company);
		rs_workLVDTO.setRsw_dept(rsw_dept);
		rs_workLVDTO.setRsw_startDate(rsw_startDate);
		rs_workLVDTO.setRsw_endDate(rsw_endDate);
		rs_workLVDTO.setRsw_job(rsw_job);
		rs_workLVDTO.setRsw_position(rsw_position);
		rs_workLVDTO.setRsw_pay(rsw_pay);
		rs_workLVDTO.setRsw_part(rsw_part);
		rs_workLVDTO.setRsw_isNow(rsw_isNow);
		rs_workLVDTO.setRsw_career(rsw_career);
		rs_workLVDTO.setRsw_userTitle(rsw_userTitle);
		rs_workLVDTO.setM_id(m_id);
		
		//DB 저장
		int saveCount = rs_workLVService.rswSave(rs_workLVDTO);
		int rsw_Seq = 0;
		if(saveCount>0) {
			rsw_Seq = rs_workLVService.selectLastSeq();
		}
		
		out.print(rsw_Seq);
	}
	
	@RequestMapping(value="/job/resume/workLV/rswLoadCount.do", method=RequestMethod.POST)
	public void eduLoadCount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = (String) session.getAttribute("memId");	
		
		//DB작업 : memID가 가지고 있는 자소서의 개수를 구함
		int countingValue = rs_workLVService.rswCounting(memId);		
		
		
		out.print(countingValue);	
	}
	
	@RequestMapping(value="/job/resume/workLV/rswLoad.do", method=RequestMethod.POST)
	public ModelAndView eduLoad(HttpServletRequest request) throws IOException {
		ModelAndView modelAndView = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = (String) session.getAttribute("memId");	
		
		// memId의 갯수구하기
		List<RS_workLVDTO> rsw_list = rs_workLVService.rswGetList(memId);
		
		JSONObject jsonObject = new JSONObject();
		JSONArray items = new JSONArray();
		String rsw_startDate = "";
		String rsw_endDate = "";
		// rsw_list 리스트값 확인
		for(int i = 0; i < rsw_list.size(); i++) {
			RS_workLVDTO rsw_dto = rsw_list.get(i);
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			rsw_startDate = dateFormat.format(rsw_dto.getRsw_startDate());
			rsw_endDate = dateFormat.format(rsw_dto.getRsw_endDate());
			
			JSONObject temp = new JSONObject();
			temp.put("rsw_seq", rsw_dto.getRsw_seq());
			temp.put("rsw_company", rsw_dto.getRsw_company());
			temp.put("rsw_dept", rsw_dto.getRsw_dept());
			temp.put("rsw_startDate",rsw_startDate);
			temp.put("rsw_endDate", rsw_endDate);
			temp.put("rsw_isNow", rsw_dto.getRsw_isNow());
			temp.put("rsw_position", rsw_dto.getRsw_position());
			temp.put("rsw_job", rsw_dto.getRsw_job());
			temp.put("rsw_pay", rsw_dto.getRsw_pay());
			temp.put("rsw_part", rsw_dto.getRsw_part());
			temp.put("rsw_career", rsw_dto.getRsw_career());
			temp.put("rsw_userTitle", rsw_dto.getRsw_userTitle());
			temp.put("m_Id", rsw_dto.getM_id());
			
			items.put(i, temp);
		}
		
		jsonObject.put("items", items);
		
		modelAndView.addObject("json", jsonObject);
		modelAndView.setViewName("/job/resume/workLV/workLvLoadJson.jsp");
		
		
		
		return modelAndView;
		
	}
	
	@RequestMapping(value="/job/resume/workLV/rswLoadView.do", method=RequestMethod.POST)
	public ModelAndView rswLoadView(HttpServletRequest request) {
			
		
		ModelAndView modelAndView = new ModelAndView();
		JSONObject jsonObject = new JSONObject();
		JSONArray items = new JSONArray();
		
		String accumSeq = request.getParameter("accumSeq");
		
		
		int accumSeqLastIndexOf = accumSeq.lastIndexOf("/");
		String accumSeqSubstring = accumSeq.substring(0, accumSeqLastIndexOf);
		System.out.println("[RS_eduLVController] accumSeqSubstring : " + accumSeqSubstring);
		String rsw_startDate = "";
		String rsw_endDate = "";
		String[] accumSeqSplit = accumSeq.split("/"); 
		
		for(int i = 0; i < accumSeqSplit.length; i++) {
			int rsw_seq = Integer.parseInt(accumSeqSplit[i]);
			RS_workLVDTO rsw_dto = rs_workLVService.rswGetDTO(rsw_seq);
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			rsw_startDate = dateFormat.format(rsw_dto.getRsw_startDate());
			rsw_endDate = dateFormat.format(rsw_dto.getRsw_endDate());
			
			
			JSONObject temp = new JSONObject();
			temp.put("rsw_seq", rsw_dto.getRsw_seq());
			temp.put("rsw_company", rsw_dto.getRsw_company());
			temp.put("rsw_dept", rsw_dto.getRsw_dept());
			temp.put("rsw_startDate", rsw_startDate);
			temp.put("rsw_endDate", rsw_endDate);
			temp.put("rsw_isNow", rsw_dto.getRsw_isNow());
			temp.put("rsw_position", rsw_dto.getRsw_position());
			temp.put("rsw_job", rsw_dto.getRsw_job());
			temp.put("rsw_pay", rsw_dto.getRsw_pay());
			temp.put("rsw_part", rsw_dto.getRsw_part());
			temp.put("rsw_career", rsw_dto.getRsw_career());
			temp.put("rsw_userTitle", rsw_dto.getRsw_userTitle());
			temp.put("m_Id", rsw_dto.getM_id());
			items.put(i, temp);
		}
		
		jsonObject.put("items", items);
		
		modelAndView.addObject("json", jsonObject);
		modelAndView.setViewName("/job/resume/workLV/workLvDTOJson.jsp");

		return modelAndView;
	}
}
