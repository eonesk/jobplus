package job.resume.vip.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import job.resume.vip.bean.RS_vipDTO;


@Controller
public class RS_vipController {
	@Autowired
	RS_vipService rs_vipService;
	
	@RequestMapping(value="/job/resume/vip/rsvSave.do", method=RequestMethod.POST)
	public void rswSave(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";		
		
		String rsv_isMedal   = request.getParameter("rsv_isMedal");
		String rsv_isProtect    = request.getParameter("rsv_isProtect");
	    String rsv_isMoney = request.getParameter("rsv_isMoney");
	    String rsv_isDisable   = request.getParameter("rsv_isDisable");
		String rsv_military       = request.getParameter("rsv_military");
	    String rsv_startDate_str  = request.getParameter("rsv_startDate");
	    String rsv_endDate_str       = request.getParameter("rsv_endDate");
		String rsv_position      = request.getParameter("rsv_position");
	    String rsv_userTitle = request.getParameter("rsv_userTitle");
	    String m_id          = memId; 
	    
	  
		Date rsv_startDate = null;
		Date rsv_endDate = null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");		
		
		try {
			rsv_startDate = dateFormat.parse(rsv_startDate_str);
			rsv_endDate = dateFormat.parse(rsv_endDate_str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		RS_vipDTO rs_vipDTO = new RS_vipDTO();
		
		rs_vipDTO.setRsv_isMedal(rsv_isMedal);
		rs_vipDTO.setRsv_isProtect(rsv_isProtect);
		rs_vipDTO.setRsv_isMoney(rsv_isMoney);
		rs_vipDTO.setRsv_isDisable(rsv_isDisable);
		rs_vipDTO.setRsv_military(rsv_military);
		rs_vipDTO.setRsv_startDate(rsv_startDate);
		rs_vipDTO.setRsv_endDate(rsv_endDate);
		rs_vipDTO.setRsv_position(rsv_position);
		rs_vipDTO.setRsv_userTitle(rsv_userTitle);
		rs_vipDTO.setM_id(m_id);
		
		//DB 저장
		int saveCount = rs_vipService.rsvSave(rs_vipDTO);
		out.print(saveCount);
	}
	
	@RequestMapping(value="/job/resume/vip/rsvLoadCount.do", method=RequestMethod.POST)
	public void eduLoadCount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";
		
		//DB작업 : memID가 가지고 있는 자소서의 개수를 구함
		int countingValue = rs_vipService.rsvCounting(memId);		
		
		
		out.print(countingValue);	
	}
	
	@RequestMapping(value="/job/resume/vip/rsvLoad.do", method=RequestMethod.POST)
	public ModelAndView eduLoad(HttpServletRequest request) throws IOException {
		ModelAndView modelAndView = new ModelAndView();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";
		
		// memId의 갯수구하기
		List<RS_vipDTO> rsv_list = rs_vipService.rsvGetList(memId);
		
		JSONObject jsonObject = new JSONObject();
		JSONArray items = new JSONArray();
		
		// rsw_list 리스트값 확인
		for(int i = 0; i < rsv_list.size(); i++) {
			RS_vipDTO rsv_dto = rsv_list.get(i);
			
			DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
			String rsv_startDate_str = sdFormat.format(rsv_dto.getRsv_startDate());
			String rsv_endDate_str = sdFormat.format(rsv_dto.getRsv_startDate());
			
			JSONObject temp = new JSONObject();
			temp.put("rsv_seq", rsv_dto.getRsv_seq());
			temp.put("rsv_isMedal", rsv_dto.getRsv_isMedal());
			temp.put("rsv_isProtect", rsv_dto.getRsv_isProtect());
			temp.put("rsv_isMoney", rsv_dto.getRsv_isMoney());
			temp.put("rsv_isDisable", rsv_dto.getRsv_isDisable());
			temp.put("rsv_military", rsv_dto.getRsv_military());
			temp.put("rsv_startDate", rsv_startDate_str);
			temp.put("rsv_endDate", rsv_endDate_str);
			temp.put("rsv_position", rsv_dto.getRsv_position());
			temp.put("rsv_userTitle", rsv_dto.getRsv_userTitle());
			temp.put("m_Id", rsv_dto.getM_id());
			
			items.put(i, temp);
		}
		
		jsonObject.put("items", items);
		
		modelAndView.addObject("json", jsonObject);
		modelAndView.setViewName("/job/resume/workLV/workLvLoadJson.jsp");
		
		
		
		return modelAndView;
		
	}
	
	@RequestMapping(value="/job/resume/vip/rsvLoadView.do", method=RequestMethod.POST)
	public ModelAndView rswLoadView(HttpServletRequest request) {
			
		
		ModelAndView modelAndView = new ModelAndView();
		JSONObject jsonObject = new JSONObject();
		JSONArray items = new JSONArray();
		
		String accumSeq = request.getParameter("accumSeq");
		
		
		int accumSeqLastIndexOf = accumSeq.lastIndexOf("/");
		String accumSeqSubstring = accumSeq.substring(0, accumSeqLastIndexOf);
		System.out.println("[RS_eduLVController] accumSeqSubstring : " + accumSeqSubstring);
		
		String[] accumSeqSplit = accumSeq.split("/"); 
		for(int i = 0; i < accumSeqSplit.length; i++) {
			int rsv_seq = Integer.parseInt(accumSeqSplit[i]);
			RS_vipDTO rsv_dto = rs_vipService.rsvGetDTO(rsv_seq);
			DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
			String rsv_startDate_str = sdFormat.format(rsv_dto.getRsv_startDate());
			String rsv_endDate_str = sdFormat.format(rsv_dto.getRsv_startDate());
			JSONObject temp = new JSONObject();
			temp.put("rsv_seq", rsv_dto.getRsv_seq());
			temp.put("rsv_isMedal", rsv_dto.getRsv_isMedal());
			temp.put("rsv_isProtect", rsv_dto.getRsv_isProtect());
			temp.put("rsv_isMoney", rsv_dto.getRsv_isMoney());
			temp.put("rsv_isDisable", rsv_dto.getRsv_isDisable());
			temp.put("rsv_military", rsv_dto.getRsv_military());
			temp.put("rsv_startDate", rsv_startDate_str);
			temp.put("rsv_endDate", rsv_endDate_str);
			temp.put("rsv_position", rsv_dto.getRsv_position());
			temp.put("rsv_userTitle", rsv_dto.getRsv_userTitle());
			temp.put("m_Id", rsv_dto.getM_id());
			items.put(i, temp);
		}
		
		jsonObject.put("items", items);
		
		modelAndView.addObject("json", jsonObject);
		modelAndView.setViewName("/job/resume/vip/vipDTOJson.jsp");

		return modelAndView;
	}
}
