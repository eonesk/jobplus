package job.resume.pr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.resume.pr.bean.RS_prDTO;
import job.resume.pr.dao.RS_prDAO;

@Service
public class RS_prServiceImpl implements RS_prService {

	@Autowired
	private RS_prDAO rsprDAO;
	
	@Override
	public int rsprSave(RS_prDTO rsprDTO) {
		return rsprDAO.rsprSave(rsprDTO);
	}

	@Override
	public int selectNumberOfPr(String memId) {
		return rsprDAO.selectNumberOfPr(memId);
	}

	@Override
	public List<RS_prDTO> selectRsprUserTitleList(String memId) {
		return rsprDAO.selectRsprUserTitleList(memId);
	}

	@Override
	public int selectLastSeq() {
		return rsprDAO.selectLastSeq();
	}

}
