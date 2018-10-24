package job.resume.intern.controller;

import job.resume.intern.bean.RS_internDTO;

public interface RS_internService {	
	// 글 등록
	int Write(RS_internDTO internDTO);
	// 글 삭제
	int Delete(int rsitSeq);	
}
