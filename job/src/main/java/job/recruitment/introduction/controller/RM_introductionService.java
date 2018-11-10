package job.recruitment.introduction.controller;

import job.recruitment.introduction.bean.RM_introductionDTO;

public interface RM_introductionService {
	// 등록
	int Write(RM_introductionDTO introductionDTO);
	int selectLastSeq();
}
