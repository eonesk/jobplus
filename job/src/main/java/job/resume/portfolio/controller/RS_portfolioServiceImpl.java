package job.resume.portfolio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import job.resume.portfolio.bean.RS_portfolioDTO;
import job.resume.portfolio.dao.RS_portfolioDAO;

@Service
public class RS_portfolioServiceImpl implements RS_portfolioService {
	@Autowired
	private RS_portfolioDAO portfolioDAO;
	
	@Override
	public int portfolioWrite(RS_portfolioDTO PortfolioDTO) {
		return portfolioDAO.portfolioWrite(PortfolioDTO);
	}

//	@Override
//	public int getportfolioOfId(String memId) {
//		return 0;
//	}
//
//	@Override
//	public RS_portfolioDTO viewportfolioOfId(String memId) {
//		return null;
//	}


}
