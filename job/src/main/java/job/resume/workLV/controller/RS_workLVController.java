package job.resume.workLV.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import job.resume.workLV.bean.RS_workLVDTO;

@Controller
public class RS_workLVController {
	@Autowired
	RS_workLVService rs_workLVService;
	
	@RequestMapping(value="/job/resume/workLV/rswSave.do", method=RequestMethod.POST)
	public void rswSave(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";		
		
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
		out.print(saveCount);
	}
}
