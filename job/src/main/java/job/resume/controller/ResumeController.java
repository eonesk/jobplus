package job.resume.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.glassfish.external.statistics.annotations.Reset;

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

		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		String m_birth_string = sdFormat.format(memberDTO.getM_birth());

		modelAndView.addObject("modify", false);
		modelAndView.addObject("m_birth", m_birth_string);
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.setViewName("resumeWriteForm.jsp");

		return modelAndView;
	}
	
	@RequestMapping(value = "/job/resume/resume/resumeModifyForm.do")
	public ModelAndView resumeModifyForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();

		session.setAttribute("memId", "test");

		String memId = (String) session.getAttribute("memId");
		
		//수정해야됨!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		int rs_seq = 64;
		
		ResumeDTO resumeDTO = resumeService.selectResume(memId, rs_seq);
		
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		String rs_birth_string = sdFormat.format(resumeDTO.getRs_Birth());
		
		modelAndView.addObject("modify", true);
		modelAndView.addObject("rs_Birth", rs_birth_string);
		modelAndView.addObject("resumeDTO", resumeDTO);
		modelAndView.setViewName("resumeWriteForm.jsp");

		return modelAndView;
	}
	
	public ResumeDTO resumeSetting(HttpServletRequest request, boolean ck) {
		HttpSession session = request.getSession();
		String[] tableName = { "rsim", "rss", "rss", "rss", "rsw", "rsw", "rsw", 
				"rsit", "rsit", "rsit", "rse", "rse", "rse", 
				"rsls", "rsls", "rsls", "rst", "rst", "rst", 
				"rsf", "rsf", "rsf", "rslg", "rslg", "rslg", 
				"rspf", "rsv", "rspr" };
		String[] tableNum = {
			"", "1", "2", "3", "1", "2", "3",
			"1", "2", "3", "1", "2", "3",
			"1", "2", "3", "1", "2", "3",
			"1", "2", "3", "1", "2", "3",
			"", "", ""};
		Integer[] seq = new Integer[tableName.length];
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		for (int i=0; i < seq.length; i++) {			
			if (request.getParameter(tableName[i] + "_Seq" + tableNum[i]).equals("")) {
				seq[i] = null;
			}else if(request.getParameter(tableName[i] + "_Seq" + tableNum[i]) == null) {
				seq[i] = null;
			}else {
				seq[i] = Integer.valueOf(request.getParameter(tableName[i] + "_Seq" + tableNum[i]));
			}
		}
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("rs_birth"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		ResumeDTO resumeDTO = new ResumeDTO();
		if(ck) {
			resumeDTO.setRs_Seq(Integer.parseInt(request.getParameter("rs_seq")));
		}
		resumeDTO.setM_Id((String) session.getAttribute("memId"));
		resumeDTO.setRs_Name(request.getParameter("rs_name"));
		resumeDTO.setRs_Birth(date);
		resumeDTO.setRs_Gender(request.getParameter("rs_gender"));
		resumeDTO.setRs_Email(request.getParameter("rs_email"));
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
		resumeDTO.setRss_Seq1(seq[1]);
		resumeDTO.setRss_Seq2(seq[2]);
		resumeDTO.setRss_Seq3(seq[3]);
		resumeDTO.setRsw_Seq1(seq[4]);
		resumeDTO.setRsw_Seq2(seq[5]);
		resumeDTO.setRsw_Seq3(seq[6]);
		resumeDTO.setRsit_Seq1(seq[7]);
		resumeDTO.setRsit_Seq2(seq[8]);
		resumeDTO.setRsit_Seq3(seq[9]);
		resumeDTO.setRse_Seq1(seq[10]);
		resumeDTO.setRse_Seq2(seq[11]);
		resumeDTO.setRse_Seq3(seq[12]);
		resumeDTO.setRsls_Seq1(seq[13]);
		resumeDTO.setRsls_Seq2(seq[14]);
		resumeDTO.setRsls_Seq3(seq[15]);
		resumeDTO.setRst_Seq1(seq[16]);
		resumeDTO.setRst_Seq2(seq[17]);
		resumeDTO.setRst_Seq3(seq[18]);
		resumeDTO.setRsf_Seq1(seq[19]);
		resumeDTO.setRsf_Seq2(seq[20]);
		resumeDTO.setRsf_Seq3(seq[21]);
		resumeDTO.setRslg_Seq1(seq[22]);
		resumeDTO.setRslg_Seq2(seq[23]);
		resumeDTO.setRslg_Seq3(seq[24]);
		resumeDTO.setRspf_Seq(seq[25]);
		resumeDTO.setRsv_Seq(seq[26]);
		resumeDTO.setRspr_Seq(seq[27]);
		
		return resumeDTO;
	}
	
	@RequestMapping(value = "/job/resume/resume/resumeModify.do")
	public void resumeModify(HttpServletRequest request, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		int rs_Seq = Integer.parseInt(request.getParameter("rs_seq"));
		resumeService.updateResume(resumeSetting(request, true));
		
		out.print(rs_Seq);
	}

	@RequestMapping(value = "/job/resume/resume/resumeWrite.do")
	public void resumeWrite(HttpServletRequest request, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		int su = resumeService.insertResume(resumeSetting(request, false));
		int rs_Seq = 0;
		if(su>0) {
			rs_Seq = resumeService.selectLastSeq((String) session.getAttribute("memId"));
		}
		
		out.print(rs_Seq);
	}
	
	@RequestMapping(value="/job/resume/resume/resumeDelete.do")
	public ModelAndView resumeDelete(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		String m_Id = (String) session.getAttribute("memId");
		int rs_Seq = Integer.parseInt(request.getParameter("rs_Seq"));
		
		int su = resumeService.deleteResume(rs_Seq, m_Id);
		
		modelAndView.addObject("su", su);
		modelAndView.setViewName("resumeDelete.jsp");
		
		return modelAndView;
	}
}
