package job.recruitment.time.controller;

import job.recruitment.time.bean.RM_timeDTO;

public interface RM_timeService {

	// 등록
	int Write(RM_timeDTO timeDTO);	
	int selectLastSeq();
	RM_timeDTO selectTable(int rmt_Seq);
}
