package job.recruitment.personnel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.recruitment.personnel.bean.RM_personnelDTO;
import job.recruitment.personnel.dao.RM_personnelDAO;
@Service
public class RM_personnelServiceImpl implements RM_personnelService {
	@Autowired
	RM_personnelDAO rm_personnelDAO;
	
	@Override
	public int save(RM_personnelDTO rm_personnelDTO) {
		return rm_personnelDAO.save(rm_personnelDTO);
	}

	@Override
	public RM_personnelDTO load(int rmp_seq) {
		return rm_personnelDAO.load(rmp_seq);
	}

	@Override
	public int selectLastSeq() {
		return rm_personnelDAO.selectLastSeq();
	}

	@Override
	public RM_personnelDTO selectTable(int rmp_Seq) {
		return rm_personnelDAO.selectTable(rmp_Seq);
	}

}
