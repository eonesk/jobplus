package job.resume.studyLV.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.resume.studyLV.bean.RS_studyLVDTO;
import job.resume.studyLV.dao.RS_studyLVDAO;

@Service
public class RS_studyLVServiceImpl implements RS_studyLVService {

	@Autowired
	RS_studyLVDAO studyLVDAO;
	
	@Override
	public int rssSave(RS_studyLVDTO studyLVDTO) {
		return studyLVDAO.rssSave(studyLVDTO);
	}

	@Override
	public int selectNumberOfStudyLV(String memId) {
		return studyLVDAO.selectNumberOfStudyLV(memId);
	}

	@Override
	public List<RS_studyLVDTO> selectStudyLVUserTitleList(String memId) {
		return studyLVDAO.selectStudyLVUserTitleList(memId);
	}

	@Override
	public RS_studyLVDTO selectStudyLVDTO(int rss_Seq) {
		return studyLVDAO.selectStudyLVDTO(rss_Seq);
	}

	
}
