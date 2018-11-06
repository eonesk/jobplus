package job.resume.pr.controller;

import java.util.List;

import job.resume.pr.bean.RS_prDTO;

public interface RS_prService {
	int rsprSave(RS_prDTO rsprDTO);
	int selectNumberOfPr(String memId);
	List<RS_prDTO> selectRsprUserTitleList(String memId);
	int selectLastSeq();
}
