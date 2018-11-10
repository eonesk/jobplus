package job.recruitment.apply.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.recruitment.apply.bean.RM_applyDTO;
import job.recruitment.apply.dao.RM_applyDAO;
@Service
public class RM_applyServiceImpl implements RM_applyService {
	@Autowired
	private RM_applyDAO applyDAO;
	
	@Override
	public int Write(RM_applyDTO applyDTO) {		
		return applyDAO.Write(applyDTO);
	}

	@Override
	public int selectLastSeq() {
		return applyDAO.selectLastSeq();
	}

	@Override
	public RM_applyDTO selectTable(int rma_Seq) {
		return applyDAO.selectTable(rma_Seq);
	}

}
