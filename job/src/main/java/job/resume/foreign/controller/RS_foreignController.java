package job.resume.foreign.controller;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import job.resume.foreign.bean.RS_foreignDTO;

@Controller
public class RS_foreignController {
	
	@Autowired
	private RS_foreignService rs_foreignService;
	
	@RequestMapping(value="/resume/foreign/foreignWriteForm.do")
	public ModelAndView foreignWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("foreignWriteForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/job/foreign/foreignWrite.do")
	public ModelAndView foreignWrite(HttpServletRequest request) {
		
		//데이터
		int rsfSeq = Integer.parseInt(request.getParameter("rsfSeq"));
		String rsfName = request.getParameter("rsfName");
		String rsfStartdate = request.getParameter("rsfStartdate");
        Date date=null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(rsfStartdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String rsfEnddate = request.getParameter("rsfEnddate");
		String rsfContent = request.getParameter("rsfContent");
		//나중에 session으로 바꾸기
		String mId = request.getParameter("mId");
		
		RS_foreignDTO rs_foreignDTO = new RS_foreignDTO();
		rs_foreignDTO.setRsfSeq(rsfSeq);
		rs_foreignDTO.setRsfStartdate(date);
		rs_foreignDTO.setRsfEnddate(date);
		rs_foreignDTO.setRsfContent(rsfContent);
		rs_foreignDTO.setMId(mId);
		//DB
		int su = rs_foreignService.RS_foreignInsert(rs_foreignDTO);
		//화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("foreignWrite.jsp");
		
		return modelAndView;
	}
}
