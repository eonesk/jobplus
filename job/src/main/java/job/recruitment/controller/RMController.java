package job.recruitment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import job.recruitment.dao.RMDAO;

@Controller
public class RMController {
	
	@Autowired
	private RMDAO rmDAO;
	
	public ModelAndView rmViewForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		String comId = (String) session.getAttribute("comId");
		int rm_Seq = Integer.parseInt(request.getParameter("rm_Seq"));
		
		
		
		modelAndView.setViewName("/job/job/main/rmViewForm.jsp");
		return modelAndView;
	}
	
}
