package job.resume.vip.controller;

import java.util.List;

import job.resume.vip.bean.RS_vipDTO;


public interface RS_vipService {
	int rsvSave(RS_vipDTO rs_vipDTO);
	int rsvCounting(String memId);
	List<RS_vipDTO> rsvGetList(String memId);
	RS_vipDTO rsvGetDTO(int rsw_seq);
	int selectLastSeq();
}
