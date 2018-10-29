package job.resume.foreign.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import job.resume.foreign.bean.RS_foreignDTO;
import job.resume.foreign.controller.RS_foreignController;

@Controller
public class RS_foreignController {
	@Autowired
	private RS_foreignService foreignService;
	
	@RequestMapping(value="/job/resume/foreign/foreignWriteForm.do")
	public ModelAndView foreignWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("foreignWriteForm.jsp");
		return modelAndView;
	}
	
	//등록
	@RequestMapping(value="/job/resume/foreign/foreignWrite.do")
	public ModelAndView foreignWrite(HttpServletRequest request, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		RS_foreignDTO foreignDTO = new RS_foreignDTO();
		try {
			request.setCharacterEncoding("utf-8");
			//데이터
			String rsf_Name = request.getParameter("rsf_Name");
			String rsf_Startdate = request.getParameter("rsf_Startdate");
			String rsf_Enddate = request.getParameter("rsf_Enddate");
			String rsf_Content = request.getParameter("rsf_Content");
			String rsf_Usertitle = request.getParameter("rsf_Usertitle");
			Date Startdate=null;
			Date Enddate=null;
			
			//나중에 session으로 바꾸기
			//String m_Id = request.getParameter("m_Id");
			Startdate = new SimpleDateFormat("yyyyMMdd").parse(rsf_Startdate);
			Enddate = new SimpleDateFormat("yyyyMMdd").parse(rsf_Enddate);
			
			//임의로 id 지정
			String memId = "num1";
			foreignDTO.setRsf_Name(rsf_Name);
			foreignDTO.setRsf_Startdate(Startdate);
			foreignDTO.setRsf_Enddate(Enddate);
			foreignDTO.setRsf_Content(rsf_Content);
			foreignDTO.setM_Id(memId);
			foreignDTO.setRsf_Usertitle(rsf_Usertitle);
			//foreignDTO.setM_Id(m_Id);
			System.out.println("rsf_Usertitle="+rsf_Usertitle);
			//DB
			int su = foreignService.foreignWrite(foreignDTO);
			//화면 네비게이션
			
			modelAndView.addObject("su", su);
			modelAndView.setViewName("foreignWrite.jsp");

		} catch (Exception e2) {
			e2.printStackTrace(); 
		}
		return modelAndView;
	}
	
	//글 확인(이거를 다시 폼으로 불러옴)
	@RequestMapping(value="/job/resume/foreign/foreignWriteForm2.do")
	public ModelAndView viewForeignOfId(HttpServletRequest request) {
		// 임의로 아이디 지정 (session값)
		String memId = "num1";
		int getforeignOfId = foreignService.getForeignOfId(memId);
		//데이터
		String m_Id = request.getParameter(memId);
		int pg = Integer.parseInt(request.getParameter("pg"));
		//DB
		RS_foreignDTO foreignDTO = new RS_foreignDTO();
		foreignDTO.setM_Id(memId);
		foreignDTO = foreignService.viewForeignOfId(m_Id);
		//네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("foreignDTO", foreignDTO);
		modelAndView.addObject("m_Id", m_Id);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("");
		return modelAndView;
	}
	
	//쓴 목록 보기
	@RequestMapping(value="/job/resume/foreign/foreignList.do")
	public ModelAndView foreignListOfId(HttpServletRequest request) {
	
		//데이터
		String memId = "num1";
		String m_Id = request.getParameter(memId);
		String str = request.getParameter("pg");
		int pg = 0;
		if(str != null && str != "") {
			pg = Integer.parseInt(str);
		}else {
			pg = 1;
		}
		  // Value of counter to be checked

		//목록 수 : 10개씩
		int endNum = pg * 5;
		int startNum = endNum - 4;
//		int endNum = 10;
//		int startNum = 1;
		List<RS_foreignDTO> list = foreignService.foreignListOfId(startNum, endNum, memId);
		System.out.println("list :: " + list);
		//페이징 처리
		int totalA = foreignService.getForeignOfId(memId);
		int totalP = (totalA + 4) / 5;		// 총페이지수 = 9
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		if(endPage > totalP) endPage = totalP;
		//네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
//		modelAndView.addObject("m_Id", m_Id);
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.setViewName("foreignList.jsp");
		return modelAndView;		
	}
}
