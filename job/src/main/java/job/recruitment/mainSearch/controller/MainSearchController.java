package job.recruitment.mainSearch.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import job.recruitment.mainSearch.bean.MainSearchDTO;

@Controller
public class MainSearchController {

	@Autowired
	MainSearchService mainSearchService;
	
	@RequestMapping(value="/job/recruitment/mainSearch/searchR.do")
	public ModelAndView searchR(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		List<MainSearchDTO> rm_list = new ArrayList<>();
		
		List<Integer> accumRange = new ArrayList<>();
		List<Integer> rm_seq = new ArrayList<>();
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
						rm_seq.add(mainSearchService.selectRM_seq(range));
					}
					
					for(int seq:rm_seq) {
						System.out.println("rm_seq : " + seq);
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
						rm_seq.add(mainSearchService.selectRM_seq(range));
					}
					
					for(int seq:rm_seq) {
						System.out.println("[XOX] rm_seq : " + seq);
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
						rm_seq.add(mainSearchService.selectRM_seq(range));
					}
					
					for(int seq:rm_seq) {
						System.out.println("[XOO] rm_seq : " + seq);
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
					
					rm_seq = mainSearchService.selectRM_seqFromId(cpm_id);				
					
				} else {
					/* 회사명o 지역입력x 업종입력o */
					System.out.println("회사명o 지역입력x 업종입력o");
					
					// 아이디
					cpm_id = mainSearchService.selectCompany(searchCompany);
					
					if(cpm_id != null) {

						// 업종명
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
							
							int resultCnt;
							
							resultCnt = mainSearchService.selectRM_seqFromIdAndRMC_seq_cnt(cpm_id, range);
							
							if(resultCnt > 0) {
								int result;
								
								result = mainSearchService.selectRM_seqFromIdAndRMC_seq(cpm_id, range);
								
								System.out.println("[OXO] result : " + result);
								
								rm_seq.add(result);
							}
						}
						
						for(int seq:rm_seq) {
							System.out.println("[OXO] rm_seq : " + seq);
						}					
						
					}
					
				}
			} else {
				/* 지역입력 있을 때 */
				if(jobSelect3 == null) {
					/* 회사명o 지역입력o 업종입력x */
					System.out.println("회사명o 지역입력o 업종입력x");

					// 아이디
					cpm_id = mainSearchService.selectCompany(searchCompany);
					
					if(cpm_id != null) {

						// 지역명
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
							
							int resultCnt;
							
							resultCnt = mainSearchService.selectRM_seqFromIdAndRMC_seq_cnt(cpm_id, range);
							
							if(resultCnt > 0) {
								rm_seq.add(mainSearchService.selectRM_seqFromIdAndRMC_seq(cpm_id, range));
							}
							
						}
						
						for(int seq:rm_seq) {
							System.out.println("[OOX] rm_seq : " + seq);
						}
					}
					
					
					
				} else {
					/* 회사명o 지역입력o 업종입력o */
					System.out.println("회사명o 지역입력o 업종입력o");

					// 아이디
					cpm_id = mainSearchService.selectCompany(searchCompany);
					System.out.println("[OOO] cpm_id : " + cpm_id);
					if(cpm_id != null) {

						// 지역 업종
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
							
							int resultCnt;
							
							resultCnt = mainSearchService.selectRM_seqFromIdAndRMC_seq_cnt(cpm_id, range);
							
							if(resultCnt > 0) {
								rm_seq.add(mainSearchService.selectRM_seqFromIdAndRMC_seq(cpm_id, range));
							}
							
						}
						
						for(int seq:rm_seq) {
							System.out.println("[OOX] rm_seq : " + seq);
						}
					}					
				}
			}
		}
		
		for(int seq:rm_seq) {
			System.out.println("[Last]rm_seq : " + seq);
			MainSearchDTO mainSearchDTO = new MainSearchDTO();
			
			// rm_seq
			mainSearchDTO.setRm_seq(seq);
			
			// cpm_id
			cpm_id = mainSearchService.selectCpm_id(seq);
			System.out.println("[x__] cpm_id : " + cpm_id);			
			mainSearchDTO.setCpm_id(cpm_id);
			
			// rm_title
			String rm_title = mainSearchService.selectRM_title(seq);
			mainSearchDTO.setRm_title(rm_title);			
			System.out.println("rm_title : " + rm_title);
			
			// rmj_career
			String rmj_career = mainSearchService.selectRMJ_career(seq);
			mainSearchDTO.setRmj_career(rmj_career);
			System.out.println("rmj_career : " + rmj_career);
			
			// rma_stydyLV
			String rma_studyLV = mainSearchService.selectRMA_studyLV(seq);
			mainSearchDTO.setRma_studyLV(rma_studyLV);
			System.out.println("rma_studyLV : " + rma_studyLV);
			
			// rmj_type
			String rmj_type = mainSearchService.selectRMJ_type(seq);
			mainSearchDTO.setRmj_type(rmj_type);
			System.out.println("rmj_type : " + rmj_type);
			
			// rm_endDate
			Date rmt_endDate = mainSearchService.selectRMT_endDate(seq);
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
			dateFormat.format(rmt_endDate);
			mainSearchDTO.setRmt_endDate(dateFormat.format(rmt_endDate));
			System.out.println("rmt_endDate : " + rmt_endDate + " // " + mainSearchDTO.getRmt_endDate());
			
			rm_list.add(mainSearchDTO);
		}
		
		System.out.println("rm_seq.size : " + rm_seq.size());
		System.out.println("rm_list : " + rm_list);
		System.out.println("cpm_id : " + cpm_id);
		
		modelAndView.addObject("rm_list", rm_list);
		modelAndView.setViewName("/main/mainSearchResultForm.jsp");
		
		
		return modelAndView;
	}
}
