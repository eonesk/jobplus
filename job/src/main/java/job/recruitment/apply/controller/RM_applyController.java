package job.recruitment.apply.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import job.recruitment.apply.bean.RM_applyDTO;


@Controller
public class RM_applyController {
	@Autowired
	private RM_applyService applyService;
	
	@RequestMapping(value="/job/recruitment/apply/Write.do", method=RequestMethod.POST)
	public void Write(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 데이터
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();

		String rma_Studylv = request.getParameter("rma_Studylv");
		String rma_Isfinish = request.getParameter("rma_Isfinish");
		String rma_Major = request.getParameter("rma_Major");
		String rma_Vip = request.getParameter("rma_Vip");
		String rma_Foreign = request.getParameter("rma_Foreign");
		String rma_License = request.getParameter("rma_License");
		String rma_Gender = request.getParameter("rma_Gender");
		String rma_Age = request.getParameter("rma_Age");		
		String rma_Age2 = request.getParameter("rma_Age2");
				
		RM_applyDTO applyDTO = new RM_applyDTO();
		System.out.println(applyDTO.toString());
		applyDTO.setRma_Studylv(rma_Studylv);
		applyDTO.setRma_Isfinish(rma_Isfinish);
		applyDTO.setRma_Major(rma_Major);
		applyDTO.setRma_Vip(rma_Vip);
		applyDTO.setRma_Foreign(rma_Foreign);
		applyDTO.setRma_License(rma_License);
		applyDTO.setRma_Gender(rma_Gender);
		applyDTO.setRma_Age(rma_Age);
		applyDTO.setRma_Age2(rma_Age2);
		// (2) DB			
		int su = applyService.Write(applyDTO);
		// (3) 화면네비게이션	
		out.print(su);
	}
}
