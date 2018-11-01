package job.resume.portfolio.controller;

import java.util.List;
import java.util.Map;

import job.resume.portfolio.bean.RS_portfolioDTO;

public interface RS_portfolioService {

	//등록
	int portfolioWrite(RS_portfolioDTO portfolioDTO);
	
	//개수확인
	int getportfolioOfId(String memId);

	//글 확인
	List<RS_portfolioDTO> viewportfolioOfId(String memId);
//	
//	//목록보기
//	//삭제
}
