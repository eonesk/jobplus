package job.resume.portfolio.controller;

import java.util.List;
import java.util.Map;

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

	@Override
	public int getportfolioOfId(String memId) {
		return portfolioDAO.getportfolioOfId(memId);
	}

	@Override
	public RS_portfolioDTO viewportfolioOfId(String memId) {
		return portfolioDAO.viewportfolioOfId(memId);
	}

	@Override
	public List<RS_portfolioDTO> portfolioListOfId(int startNum, int endNum, String memId) {
		return portfolioDAO.portfolioListOfId(startNum, endNum, memId);
	}

	@Override
	public RS_portfolioDTO selectPortfolioDTO(int rspf_Seq) {
		return portfolioDAO.selectPortfolioDTO(rspf_Seq);
	}


}
