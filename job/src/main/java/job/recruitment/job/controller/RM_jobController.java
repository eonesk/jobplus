package job.recruitment.job.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import job.recruitment.job.bean.RM_jobDTO;


@Controller
public class RM_jobController {
	@Autowired
	private RM_jobService rm_jobService;
	@RequestMapping(value="/job/recruitment/job/save.do", method=RequestMethod.POST)
	public void save(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 데이터
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		String rmj_job = request.getParameter("rmj_job");
		String rmj_career = request.getParameter("rmj_career");
		String rmj_careerStart = request.getParameter("rmj_careerStart");
		String rmj_careerEnd = request.getParameter("rmj_careerEnd");
		String rmj_type = request.getParameter("rmj_type");		
		
					
		RM_jobDTO rm_jobDTO = new RM_jobDTO();
		rm_jobDTO.setRmj_job(rmj_job);
		rm_jobDTO.setRmj_career(rmj_career);
		rm_jobDTO.setRmj_careerStart(rmj_careerStart);
		rm_jobDTO.setRmj_careerEnd(rmj_careerEnd);
		rm_jobDTO.setRmj_type(rmj_type);
		// (2) DB			
		int insertCount = rm_jobService.save(rm_jobDTO);
		// (3) 화면네비게이션	
		out.print(insertCount);
	}
}
