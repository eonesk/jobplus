package job.resume.studyLV.controller;

import java.util.List;

import job.resume.studyLV.bean.RS_studyLVDTO;

public interface RS_studyLVService {
	int rssSave(RS_studyLVDTO studyLVDTO);
	int selectNumberOfStudyLV(String memId);
	List<RS_studyLVDTO> selectStudyLVUserTitleList(String memId);
	RS_studyLVDTO selectStudyLVDTO(int rss_Seq);
	int selectLastSeq();
}
