package job.recruitment.time.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RM_timeController {

	@RequestMapping(value="/job/recruitment/time/timeWriteFormNext.do", method=RequestMethod.POST)
	public ModelAndView timeWriteFormNext(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("진입");
		
		return modelAndView;
	}
	
}
