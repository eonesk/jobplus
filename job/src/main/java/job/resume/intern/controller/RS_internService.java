package job.resume.intern.controller;

import java.util.List;

import job.resume.intern.bean.RS_internDTO;

public interface RS_internService {	
	// 등록
	int Write(RS_internDTO internDTO);	
	// 갯수 
	int selectNumintern(String memId);
	// 리스트
	List<RS_internDTO> selectTitleList(String memId);
	// 삭제
	int Delete(int rsit_Seq);
	// seq검색
	RS_internDTO selectInternDTO(int rsit_Seq);
	
	int selectLastSeq();
}
