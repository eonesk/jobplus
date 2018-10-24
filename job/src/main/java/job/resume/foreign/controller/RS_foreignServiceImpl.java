package job.resume.foreign.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.resume.foreign.bean.RS_foreignDTO;
import job.resume.foreign.dao.RS_foreignDAO;

@Service
public class RS_foreignServiceImpl implements RS_foreignService{
	
	@Autowired
	private RS_foreignDAO rs_foreignDAO;
	
	@Override
	public int RS_foreignInsert(RS_foreignDTO rs_foreignDTO) {
		return rs_foreignDAO.RS_foreignInsert(rs_foreignDTO);
	}

	@Override
	public int RS_foreignDelete(int rsfSeq) {
		return rs_foreignDAO.RS_foreignDelete(rsfSeq);
	}



}
