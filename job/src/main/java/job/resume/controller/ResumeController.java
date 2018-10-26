package job.resume.controller;

import java.io.UnsupportedEncodingException;

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
	
	public ModelAndView resumeWrite(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		String[] tableName = {"rsim", "rss", "rsw", "rsit", 
				"rse", "rsls", "rst", "rsf", 
				"rslg", "rspf", "rsv", "rspr"};
		Integer[] seq = new Integer[tableName.length];
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		for(int i=0; i<seq.length; i++) {
			if(request.getParameter(tableName[i]+"Seq") != null) {
				seq[i] = Integer.parseInt(request.getParameter(tableName[i]+"Seq"));
			}else {
				seq[i] = null;
			}
		}
		
		ResumeDTO resumeDTO = new ResumeDTO();
		resumeDTO.setM_Id((String)session.getAttribute("memId"));
		resumeDTO.setRs_Title(request.getParameter("title"));
		resumeDTO.setRs_Type(request.getParameter("type"));
		resumeDTO.setRs_Pay(request.getParameter("pay"));
		resumeDTO.setRs_Workspace1(request.getParameter("workspace1"));
		resumeDTO.setRs_Workspace2(request.getParameter("workspace2"));
		resumeDTO.setRs_Workspace3(request.getParameter("workspace3"));
		resumeDTO.setRs_Job1(request.getParameter("job1"));
		resumeDTO.setRs_Job2(request.getParameter("job2"));
		resumeDTO.setRs_Job3(request.getParameter("job3"));
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
