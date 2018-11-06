package job.recruitment.introduction.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import job.recruitment.introduction.bean.RM_introductionDTO;

@Controller
public class RM_introductionController {
	@Autowired
	private RM_introductionService introductionService;
	
	@RequestMapping(value="/job/recruitment/introduction/Write.do", method=RequestMethod.POST)
	public void Write(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 데이터
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		int rmi_Personnel = Integer.parseInt(request.getParameter("rmi_Personnel"));
		String rmi_Type = request.getParameter("rmi_Type");
		String rmi_Work1 = request.getParameter("rmi_Work1");
		String rmi_Work2 = request.getParameter("rmi_Work2");
		String rmi_Work3 = request.getParameter("rmi_Work3");
		String rmi_Department = request.getParameter("rmi_Department");		
		String rmi_Official = request.getParameter("rmi_Official");
					
		RM_introductionDTO introductionDTO = new RM_introductionDTO();
		introductionDTO.setRmi_Personnel(rmi_Personnel);
		introductionDTO.setRmi_Type(rmi_Type);
		introductionDTO.setRmi_Work1(rmi_Work1);
		introductionDTO.setRmi_Work2(rmi_Work2);
		introductionDTO.setRmi_Work3(rmi_Work3);
		introductionDTO.setRmi_Department(rmi_Department);
		introductionDTO.setRmi_Official(rmi_Official);	
		// (2) DB			
		int su = introductionService.Write(introductionDTO);
		// (3) 화면네비게이션	
		out.print(su);
	}
}
