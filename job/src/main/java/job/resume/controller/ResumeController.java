package job.resume.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import job.member.bean.MemberDTO;
import job.resume.bean.ResumeDTO;

@Controller
public class ResumeController {

	@Autowired
	private ResumeService resumeService;
	
	@RequestMapping(value = "/job/resume/resume/resumeWriteForm.do")
	public ModelAndView resumeWriteForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		session.setAttribute("memId", "test");
		
		String memId = (String) session.getAttribute("memId");
		MemberDTO memberDTO = resumeService.selectMember(memId);
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.setViewName("resumeWriteForm.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/job/resume/resume/resumeWrite.do")
	public ModelAndView resumeWrite(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		String[] tableName = {"RSIM", "RSS", "RSW", "RSIT", 
				"RSE", "RSLS", "RST", "RSF", 
				"RSLG", "RSPF", "RSV", "RSPR"};
		Integer[] seq = new Integer[tableName.length];
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		for(int i=0; i<seq.length; i++) {
			if(request.getParameter(tableName[i]+"Seq") != null) {
				seq[i] = Integer.parseInt(request.getParameter(tableName[i]+"_seq"));
			}else {
				seq[i] = null;
			}
		}
		Date date=null;
		try {
			date = new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("rs_birth"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		ResumeDTO resumeDTO = new ResumeDTO();
		resumeDTO.setM_Id((String)session.getAttribute("memId"));
		resumeDTO.setRs_Name(request.getParameter("rs_name"));
		resumeDTO.setRs_Birth(date);
		resumeDTO.setRs_Gender(request.getParameter("rs_gender"));
		resumeDTO.setRs_Email(request.getParameter("rs_gender"));
		resumeDTO.setRs_Homenum(request.getParameter("rs_homenum"));
		resumeDTO.setRs_Phone(request.getParameter("rs_phone"));
		resumeDTO.setRs_Address(request.getParameter("rs_address"));
		resumeDTO.setRs_Title(request.getParameter("rs_title"));
		resumeDTO.setRs_Pay(request.getParameter("rs_pay"));
		resumeDTO.setRs_Type(request.getParameter("rs_type"));
		resumeDTO.setRs_Workspace1(request.getParameter("rs_workspace1"));
		resumeDTO.setRs_Workspace2(request.getParameter("rs_workspace2"));
		resumeDTO.setRs_Workspace3(request.getParameter("rs_workspace3"));
		resumeDTO.setRs_Job1(request.getParameter("rs_job1"));
		resumeDTO.setRs_Job2(request.getParameter("rs_job2"));
		resumeDTO.setRs_Job3(request.getParameter("rs_job3"));
		resumeDTO.setRsim_Seq(seq[0]);
		resumeDTO.setRss_Seq(seq[1]);
		resumeDTO.setRsw_Seq(seq[2]);
		resumeDTO.setRsit_Seq(seq[3]);
		resumeDTO.setRse_Seq(seq[4]);
		resumeDTO.setRsls_Seq(seq[5]);
		resumeDTO.setRst_Seq(seq[6]);
		resumeDTO.setRsf_Seq(seq[7]);
		resumeDTO.setRslg_Seq(seq[8]);
		resumeDTO.setRspf_Seq(seq[9]);
		resumeDTO.setRsv_Seq(seq[10]);
		resumeDTO.setRspr_Seq(seq[11]);
		
		int su = resumeService.insertResume(resumeDTO);
		
		modelAndView.addObject("su", su);
		modelAndView.setViewName("resumeWrite.jsp");
		
		return modelAndView;
	}
}
