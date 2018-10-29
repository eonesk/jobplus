package job.resume.trophy.controller;

import java.util.List;

import job.resume.trophy.bean.RS_trophyDTO;

public interface RS_trophyService {
	// 등록
	int Write(RS_trophyDTO trophyDTO);	
	// 갯수 
	int selectNumtrophy(String memId);
	// 리스트
	List<RS_trophyDTO> selectTitleList(String memId);
	// 삭제
	int Delete(int rst_Seq);	
}
