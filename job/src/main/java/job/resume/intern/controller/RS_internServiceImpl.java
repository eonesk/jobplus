package job.resume.intern.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.resume.intern.bean.RS_internDTO;
import job.resume.intern.dao.RS_internDAO;

@Service
public class RS_internServiceImpl implements RS_internService {
	@Autowired
	private RS_internDAO internDAO;
	
	@Override
	public int Write(RS_internDTO internDTO) {
		return internDAO.Write(internDTO);
	}
	@Override
	public int Delete(int rsit_Seq) {
		return internDAO.Delete(rsit_Seq);
	}

}
