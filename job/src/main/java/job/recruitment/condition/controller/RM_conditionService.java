package job.recruitment.condition.controller;

import job.recruitment.condition.bean.RM_conditionDTO;

public interface RM_conditionService {
	// 등록
	int Write(RM_conditionDTO conditionDTO);
	int selectLastSeq();
	RM_conditionDTO selectTable(int rmc_Seq);
}
