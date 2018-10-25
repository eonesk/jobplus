package job.resume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResumeController {

	@Autowired
	ResumeService resumeService;
	
}
