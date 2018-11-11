package job.recruitment.personnel.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



import job.recruitment.personnel.bean.RM_personnelDTO;


@Controller
public class RM_personnelController {
	@Autowired
	private RM_personnelService rm_personnelService;
	@RequestMapping(value="/job/recruitment/personnel/save.do", method=RequestMethod.POST)
	public void save(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 데이터
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		
		String rmp_name = request.getParameter("rmp_name");
		String rmp_dept = request.getParameter("rmp_dept");
		String rmp_email = request.getParameter("rmp_email");
		String rmp_phone1 = request.getParameter("rmp_phone1");
		String rmp_phone2 = request.getParameter("rmp_phone2");		
		
		//실제
		HttpSession session = request.getSession();
		String cpm_id = (String) session.getAttribute("cpm_id");
		
		RM_personnelDTO rm_personnelDTO = new RM_personnelDTO();
		rm_personnelDTO.setCpm_id(cpm_id);
		rm_personnelDTO.setRmp_name(rmp_name);
		rm_personnelDTO.setRmp_dept(rmp_dept);
		rm_personnelDTO.setRmp_email(rmp_email);
		rm_personnelDTO.setRmp_phone1(rmp_phone1);
		rm_personnelDTO.setRmp_phone2(rmp_phone2);
		
		// (2) DB			
		int insertCount = rm_personnelService.save(rm_personnelDTO);
		// (3) 화면네비게이션	
		out.print(insertCount);
	}
}
