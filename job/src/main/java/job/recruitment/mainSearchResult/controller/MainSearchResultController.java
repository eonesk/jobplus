package job.recruitment.mainSearchResult.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainSearchResultController {
	
	
	public ModelAndView mainSearchResultJson(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int endNum = pg*10;
		int startNum = endNum-9;
		
		
		return modelAndView;
	}
}
