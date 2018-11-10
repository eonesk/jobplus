package job.recruitment.introduction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.recruitment.introduction.bean.RM_introductionDTO;
import job.recruitment.introduction.dao.RM_introductionDAO;
@Service
public class RM_introductionServiceImpl implements RM_introductionService {
	@Autowired
	private RM_introductionDAO introductionDAO;
	
	@Override
	public int Write(RM_introductionDTO introductionDTO) {
		return introductionDAO.Write(introductionDTO);
	}

	@Override
	public int selectLastSeq() {
		return introductionDAO.selectLastSeq();
	}

	@Override
	public RM_introductionDTO selectTable(int rmi_Seq) {
		return introductionDAO.selectTable(rmi_Seq);
	}

}
