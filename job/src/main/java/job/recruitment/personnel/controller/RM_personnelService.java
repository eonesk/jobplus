package job.recruitment.personnel.controller;

import job.recruitment.personnel.bean.RM_personnelDTO;

public interface RM_personnelService {
	public int save(RM_personnelDTO rm_personnelDTO);
	public RM_personnelDTO load(int rmp_seq);
	int selectLastSeq();
	RM_personnelDTO selectTable(int rmp_Seq);
}