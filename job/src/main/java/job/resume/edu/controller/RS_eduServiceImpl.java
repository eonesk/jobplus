package job.resume.edu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.resume.edu.bean.RS_eduDTO;
import job.resume.edu.dao.RS_eduDAO;

@Service
public class RS_eduServiceImpl implements RS_eduService {

	@Autowired
	RS_eduDAO eduDAO;
	
	@Override
	public int rseSave(RS_eduDTO eduDTO) {
		return eduDAO.rseSave(eduDTO);
	}

	@Override
	public int selectNumberOfEdu(String memId) {
		return eduDAO.selectNumberOfEdu(memId);
	}

	@Override
	public List<RS_eduDTO> selectEduUserTitleList(String memId) {
		return eduDAO.selectEduUserTitleList(memId);
	}

	@Override
	public RS_eduDTO selectEduDTO(int rse_Seq) {
		return eduDAO.selectEduDTO(rse_Seq);
	}

	@Override
	public int selectLastSeq() {
		return eduDAO.selectLastSeq();
	}

}
