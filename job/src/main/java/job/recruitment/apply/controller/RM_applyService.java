package job.recruitment.apply.controller;

import job.recruitment.apply.bean.RM_applyDTO;

public interface RM_applyService {
	// 등록
	int Write(RM_applyDTO applyDTO);	
}
