package job.recruitment.job.controller;

import job.recruitment.job.bean.RM_jobDTO;

public interface RM_jobService {
	public int save(RM_jobDTO rm_jobDTO);
	public RM_jobDTO load(int rmj_seq);
	int selectLastSeq();
}