package job.resume.language.controller;

import java.util.List;

import job.resume.language.bean.RS_languageDTO;

public interface RS_languageService {
	// 등록
	int Write(RS_languageDTO languageDTO);	
	// 갯수 
	int selectNumlang(String memId);
	// 리스트
	List<RS_languageDTO> selectTitleList(String memId);
	// 삭제
	int Delete(int rslg_Seq);
	// seq검색
	RS_languageDTO selectLangDTO(int rslg_Seq);
}
