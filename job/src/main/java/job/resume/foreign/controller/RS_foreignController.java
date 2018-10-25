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
	private RS_foreignService foreignService;
	
	@RequestMapping(value="/foreign/foreignWriteForm.do")
	public ModelAndView foreignWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("foreignWriteForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/foreign/foreignWrite.do")
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
		
		RS_foreignDTO foreignDTO = new RS_foreignDTO();
		foreignDTO.setRsfSeq(rsfSeq);
		foreignDTO.setRsfStartdate(date);
		foreignDTO.setRsfEnddate(date);
		foreignDTO.setRsfContent(rsfContent);
		foreignDTO.setMId(mId);
		//DB
		int su = foreignService.foreignWrite(foreignDTO);
		//화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("foreignWrite.jsp");
		
		return modelAndView;
	}
}
