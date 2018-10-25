package job.resume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResumeController {

	@Autowired
	private ResumeService resumeService;
	
	@RequestMapping(value = "/")
	public ModelAndView resumeForm() {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("");
		
		return modelAndView;
	}
}
