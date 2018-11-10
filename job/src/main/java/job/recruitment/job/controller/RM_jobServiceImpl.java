package job.recruitment.job.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.recruitment.job.bean.RM_jobDTO;
import job.recruitment.job.dao.RM_jobDAO;

@Service
public class RM_jobServiceImpl implements RM_jobService {
	@Autowired
	RM_jobDAO rm_jobDAO;
	
	@Override
	public int save(RM_jobDTO rm_jobDTO) {
		return rm_jobDAO.save(rm_jobDTO);
	}

	@Override
	public RM_jobDTO load(int rmj_seq) {
		return rm_jobDAO.load(rmj_seq);
	}

	@Override
	public int selectLastSeq() {
		return rm_jobDAO.selectLastSeq();
	}
}
