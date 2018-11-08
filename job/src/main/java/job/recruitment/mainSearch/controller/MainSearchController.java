package job.recruitment.mainSearch.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainSearchController {
	
	@RequestMapping(value="/job/recruitment/mainSearch/searchR.do")
	public ModelAndView searchR(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		String searchCompany = request.getParameter("searchCompany");
		System.out.println("[MainSearchController] searchCompany : " + searchCompany);
		
		String[] searchRegion = request.getParameterValues("searchRegion");
		
		for(int i = 0; i < searchRegion.length; i++) {
			System.out.println("[MainSearchController] searchRegion["+i+"] : " + searchRegion[i]);
		}
		
		String[] jobSelect3 = request.getParameterValues("jobSelect3");
		
		
		for(int j = 0; j < jobSelect3.length; j++) {
			System.out.println("[MainSearchController] jobSelect3["+j+"] : " + jobSelect3[j]);
		}
		
		modelAndView.addObject("searchCompany", searchCompany);
		modelAndView.addObject("searchRegion", searchRegion);
		modelAndView.addObject("jobSelect3", jobSelect3);
		modelAndView.setViewName("/main/mainSearchResultForm.jsp");
		
		
		return modelAndView;
	}
}
