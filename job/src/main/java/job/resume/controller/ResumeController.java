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
		System.out.println(memberDTO);
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
		resumeDTO.setMId((String)session.getAttribute("memId"));
		resumeDTO.setRsTitle(request.getParameter("title"));
		resumeDTO.setRsType(request.getParameter("type"));
		resumeDTO.setRsPay(request.getParameter("pay"));
		resumeDTO.setRsWorkspace1(request.getParameter("workspace1"));
		resumeDTO.setRsWorkspace2(request.getParameter("workspace2"));
		resumeDTO.setRsWorkspace3(request.getParameter("workspace3"));
		resumeDTO.setRsJob1(request.getParameter("job1"));
		resumeDTO.setRsJob2(request.getParameter("job2"));
		resumeDTO.setRsJob3(request.getParameter("job3"));
		resumeDTO.setRsimSeq(seq[0]);
		resumeDTO.setRssSeq(seq[1]);
		resumeDTO.setRswSeq(seq[2]);
		resumeDTO.setRsitSeq(seq[3]);
		resumeDTO.setRseSeq(seq[4]);
		resumeDTO.setRslsSeq(seq[5]);
		resumeDTO.setRstSeq(seq[6]);
		resumeDTO.setRsfSeq(seq[7]);
		resumeDTO.setRslgSeq(seq[8]);
		resumeDTO.setRspfSeq(seq[9]);
		resumeDTO.setRsvSeq(seq[10]);
		resumeDTO.setRsprSeq(seq[11]);
		
		int su = resumeService.insertResume(resumeDTO);
		
		modelAndView.addObject("su", su);
		modelAndView.setViewName("resumeWrite.jsp");
		
		return modelAndView;
	}
}
