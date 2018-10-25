package job.resume.foreign.controller;

import job.resume.foreign.bean.RS_foreignDTO;

public interface RS_foreignService {

	//등록
	int foreignWrite(RS_foreignDTO foreignDTO);
	
	//삭제
	int foreignDelete(int rsfSeq);
	
	//수정
	
	
}
