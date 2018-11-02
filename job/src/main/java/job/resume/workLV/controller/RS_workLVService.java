package job.resume.workLV.controller;

import java.util.List;

import job.resume.workLV.bean.RS_workLVDTO;

public interface RS_workLVService {
	int rswSave(RS_workLVDTO rs_workLVDTO);
	int rswCounting(String memId);
	List<RS_workLVDTO> rswGetList(String memId);
	RS_workLVDTO rswGetDTO(int rsw_seq);
}
