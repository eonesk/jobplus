package job.recruitment.mainSearchResult.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.recruitment.bean.RMDTO;
import job.recruitment.condition.bean.RM_conditionDTO;
import job.recruitment.job.bean.RM_jobDTO;
import job.recruitment.mainSearchResult.dao.MainSearchResultDAO;

@Service
public class MainSearchResultServiceImpl implements MainSearchResultService {

	@Autowired
	private MainSearchResultDAO mainSearchResultDAO;
	
	@Override
	public String selectCpiCompanyName(String comId) {
		return mainSearchResultDAO.selectCpiCompanyName(comId);
	}

	@Override
	public RMDTO selectRmTitle(int rm_Seq, String comId) {
		return mainSearchResultDAO.selectRmTitle(rm_Seq, comId);
	}

	@Override
	public RM_jobDTO selectRmJob(int rmj_Seq) {
		return mainSearchResultDAO.selectRmJob(rmj_Seq);
	}

	@Override
	public RM_conditionDTO selectRmCondition(int rmc_Seq) {
		return mainSearchResultDAO.selectRmCondition(rmc_Seq);
	}

}
