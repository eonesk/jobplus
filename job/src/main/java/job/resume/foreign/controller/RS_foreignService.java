package job.resume.foreign.controller;

import java.util.List;
import job.resume.foreign.bean.RS_foreignDTO;

public interface RS_foreignService {

	//해외경험 등록
	int foreignWrite(RS_foreignDTO foreignDTO);
	
	//글 개수 확인
	int getForeignOfId(String memId);
	
	//쓴 글 확인
	List<RS_foreignDTO> viewForeignOfId(String memId);
	
//	//쓴 목록 보기
//	List<RS_foreignDTO> foreignListOfId(int startNum, int endNum, String memId);
	
	//삭제
	//int foreignDelete(int rsfSeq);
	
	//수정
	
	
}
