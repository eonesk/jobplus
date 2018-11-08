package job.recruitment.mainSearchResult.controller;

import job.recruitment.bean.RMDTO;
import job.recruitment.condition.bean.RM_conditionDTO;
import job.recruitment.job.bean.RM_jobDTO;

public interface MainSearchResultService {
	
	public String selectCpiCompanyName(String comId);
	
	public RMDTO selectRmTitle(int rm_Seq, String comId);
	
	public RM_jobDTO selectRmJob(int rmj_Seq);
	
	public RM_conditionDTO selectRmCondition(int rmc_Seq);
}
