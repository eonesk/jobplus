package job.resume.foreign.controller;

import job.resume.foreign.bean.RS_foreignDTO;

public interface RS_foreignService {

	//등록
	int RS_foreignInsert(RS_foreignDTO rs_foreignDTO);
	
	//삭제
	int RS_foreignDelete(int rsfSeq);
	
	//수정
	
	
}
