package job.recruitment.mainSearch.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainSearchController {

	@Autowired
	MainSearchService mainSearchService;
	
	@RequestMapping(value="/job/recruitment/mainSearch/searchR.do")
	public ModelAndView searchR(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		List<Integer> accumRange = new ArrayList<>();
		List<String> rm_title = new ArrayList<>();
		String cpm_id = "";
		
		String searchCompany = request.getParameter("searchCompany");
		System.out.println("[MainSearchController] searchCompany : " + searchCompany);
		
		if(searchCompany.equals("")) {
			System.out.println("[searchCompany] : 회사이름없음");
		}
		
		String[] searchRegion = request.getParameterValues("searchRegion");
		
		if(searchRegion == null) {
			System.out.println("[searchRegion] : 지역이름없음");
		} else {
			for(int i = 0; i < searchRegion.length; i++) {
				System.out.println("[MainSearchController] searchRegion["+i+"] : " + searchRegion[i]);
			}
		}	
		
		String[] jobSelect3 = request.getParameterValues("jobSelect3");
		
		if(jobSelect3 == null) {
			System.out.println("[jobSelect3] : 업종이름없음");
		} else {
			for(int j = 0; j < jobSelect3.length; j++) {
				System.out.println("[MainSearchController] jobSelect3["+j+"] : " + jobSelect3[j]);
			}
		}
////////////////////////////////////////////////////////////////////////////////////////////////////
		
		if(searchCompany.equals("")) {
			/*회사명입력 없을 때*/
			if(searchRegion == null) {
				/* 회사명x 지역입력x */
				if(jobSelect3 == null) {
					/* 회사명x 지역입력x 업종입력x */
					System.out.println("회사명x 지역입력x 업종입력x");
				} else {
					/* 회사명x 지역입력x 업종입력o */
					System.out.println("회사명x 지역입력x 업종입력o");
					List<Integer> accumRMC_seq = new ArrayList<>();
					accumRange = new ArrayList<>();
					
					for(int i = 0; i < jobSelect3.length; i++) {
						System.out.println("[MainSearchController] jobSelect3["+i+"] : " + jobSelect3[i]);
						accumRMC_seq = mainSearchService.selectXXO(jobSelect3[i]);
						for(int value:accumRMC_seq) {
							System.out.println("value : " + value);
							accumRange.add(value);							
						}
					}
					// 중복 제거
					for (int i = 0; i < accumRange.size(); i++) {
		                for (int j = 0; j < accumRange.size(); j++) {
		                    if (i == j) {
		                    } else if (accumRange.get(j).equals(accumRange.get(i))) {
		                    	accumRange.remove(j);
		                    }
		                }
		            }
					
					for(int range:accumRange) {
						System.out.println("accumRange : " + range);
						rm_title.add(mainSearchService.selectTitle(range));
					}
					
					for(String title:rm_title) {
						System.out.println("rm_title : " + title);
					}
					
				}
			} else {
				/* 회사명x 지역입력o */
				if(jobSelect3 == null) {
					/* 회사명x 지역입력o 업종입력x */
					System.out.println("회사명x 지역입력o 업종입력x");
					List<Integer> accumRMC_seq = new ArrayList<>();
					accumRange = new ArrayList<>();
					
					for(int i = 0; i < searchRegion.length; i++) {
						System.out.println("[MainSearchController] searchRegion["+i+"] : " + searchRegion[i]);
						accumRMC_seq = mainSearchService.selectXOX(searchRegion[i]);
						for(int value:accumRMC_seq) {
							System.out.println("value : " + value);
							accumRange.add(value);							
						}
					}
					
					for(int range:accumRange) {
						System.out.println("accumRange : " + range);
					}
					
					for(int range:accumRange) {
						System.out.println("accumRange : " + range);
						rm_title.add(mainSearchService.selectTitle(range));
					}
					
					for(String title:rm_title) {
						System.out.println("rm_title : " + title);
					}
					
					
				} else {
					/* 회사명x 지역입력o 업종입력o */
					System.out.println("회사명x 지역입력o 업종입력o");
					List<Integer> accumRMC_seq = new ArrayList<>();
					accumRange = new ArrayList<>();
					
					for(int i = 0; i < jobSelect3.length; i++) {
						System.out.println("[MainSearchController] jobSelect3["+i+"] : " + jobSelect3[i]);
						for(int j = 0; j < searchRegion.length; j++) {
							System.out.println("--[MainSearchController] searchRegion["+j+"] : " + searchRegion[j]);
							accumRMC_seq = mainSearchService.selectXOO(jobSelect3[i], searchRegion[j]);
							for(int value:accumRMC_seq) {
								System.out.println("value : " + value);
								accumRange.add(value);							
							}
						}
					}
					// 중복 제거
					for (int i = 0; i < accumRange.size(); i++) {
		                for (int j = 0; j < accumRange.size(); j++) {
		                    if (i == j) {
		                    } else if (accumRange.get(j).equals(accumRange.get(i))) {
		                    	accumRange.remove(j);
		                    }
		                }
		            }
					
					for(int range:accumRange) {
						System.out.println("accumRange : " + range);
					}
					
					for(int range:accumRange) {
						
						System.out.println("accumRange : " + range);
						rm_title.add(mainSearchService.selectTitle(range));
					}
					
					for(String title:rm_title) {
						System.out.println("rm_title : " + title);
					}
				}
			}
		} else {
			/* 회사명입력 있을 때 */
			if(searchRegion == null) {
				/* 회사명o 지역입력x */
				if(jobSelect3 == null) {
					/* 회사명o 지역입력x 업종입력x */
					System.out.println("회사명o 지역입력x 업종입력x");					
					
					cpm_id = mainSearchService.selectCompany(searchCompany);
					
					
					
				} else {
					/* 회사명o 지역입력x 업종입력o */
					System.out.println("회사명o 지역입력x 업종입력o");
				}
			} else {
				/* 지역입력 있을 때 */
				if(jobSelect3 == null) {
					/* 회사명o 지역입력o 업종입력x */
					System.out.println("회사명o 지역입력o 업종입력x");
				} else {
					/* 회사명o 지역입력o 업종입력o */
					System.out.println("회사명o 지역입력o 업종입력o");
				}
			}
		}
		
		for(int range:accumRange) {
			System.out.println("[Last]accumRange : " + range);
		}
		
		System.out.println("cpm_id : " + cpm_id);
		
		modelAndView.addObject("cpm_id", cpm_id);
		modelAndView.addObject("accumRange", accumRange);
		modelAndView.addObject("rm_title", rm_title);
		
		
		modelAndView.addObject("searchCompany", searchCompany);
		modelAndView.addObject("searchRegion", searchRegion);
		modelAndView.addObject("jobSelect3", jobSelect3);
		modelAndView.setViewName("/main/mainSearchResultForm.jsp");
		
		
		return modelAndView;
	}
}
