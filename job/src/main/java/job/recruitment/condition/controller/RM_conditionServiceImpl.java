package job.recruitment.condition.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.recruitment.condition.bean.RM_conditionDTO;
import job.recruitment.condition.dao.RM_conditionDAO;

@Service
public class RM_conditionServiceImpl implements RM_conditionService {

	@Autowired
	private RM_conditionDAO conditionDAO;
	
	@Override
	public int Write(RM_conditionDTO conditionDTO) {
		return conditionDAO.Write(conditionDTO);
	}

	@Override
	public int selectLastSeq() {
		return conditionDAO.selectLastSeq();
	}

}
