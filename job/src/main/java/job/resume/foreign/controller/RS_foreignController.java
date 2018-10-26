package job.resume.foreign.controller;

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

import job.resume.foreign.bean.RS_foreignDTO;

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
	
	@RequestMapping(value="/job/resume/foreign/foreignWrite.do")
	public ModelAndView foreignWrite(HttpServletRequest request, HttpSession session) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//데이터
		String rsfName = request.getParameter("rsfName");
		String rsfStartdate = request.getParameter("rsfStartdate");
		String rsfEnddate = request.getParameter("rsfEnddate");
		String rsfContent = request.getParameter("rsfContent");
		String rsfUsertitle = request.getParameter("rsfUsertitle");

		//나중에 session으로 바꾸기
		//String mId = request.getParameter("mId");
        Date Startdate=null;
		try {
			Startdate = new SimpleDateFormat("yyyyMMdd").parse(rsfStartdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date Enddate=null;
		try {
			Enddate = new SimpleDateFormat("yyyyMMdd").parse(rsfEnddate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("Enddate:"+Enddate);
		//임의로 id 지정
		String memId = "num1";
		
		RS_foreignDTO foreignDTO = new RS_foreignDTO();
		foreignDTO.setRsfName(rsfName);
		foreignDTO.setRsfStartdate(Startdate);
		foreignDTO.setRsfEnddate(Enddate);
		foreignDTO.setRsfContent(rsfContent);
		foreignDTO.setMId(memId);
		foreignDTO.setRsfUsertitle(rsfUsertitle);
		System.out.println("[foreign Cont] foreignDTO : " + foreignDTO.toString());
		//foreignDTO.setMId(mId);
		//DB
		int su = foreignService.foreignWrite(foreignDTO);
		//화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("foreignWrite.jsp");
		
		return modelAndView;
	}
}
