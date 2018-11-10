package job.recruitment.time.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.recruitment.time.bean.RM_timeDTO;
import job.recruitment.time.dao.RM_timeDAO;

@Service
public class RM_timeServiceImpl implements RM_timeService {

	@Autowired
	private RM_timeDAO timeDAO;
	
	@Override
	public int Write(RM_timeDTO timeDTO) {
		return timeDAO.Write(timeDTO);
	}

	@Override
	public int selectLastSeq() {
		return timeDAO.selectLastSeq();
	}

	@Override
	public RM_timeDTO selectTable(int rmt_Seq) {
		return timeDAO.selectTable(rmt_Seq);
	}

}
