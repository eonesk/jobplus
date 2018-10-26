package job.resume.foreign.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.resume.foreign.bean.RS_foreignDTO;
import job.resume.foreign.dao.RS_foreignDAO;

@Service
public class RS_foreignServiceImpl implements RS_foreignService{
	
	@Autowired
	private RS_foreignDAO foreignDAO;
	
	@Override
	public int foreignWrite(RS_foreignDTO foreignDTO) {
		return foreignDAO.foreignWrite(foreignDTO);
	}

	/*@Override
	public int foreignDelete(int rsfSeq) {
		return foreignDAO.foreignDelete(rsfSeq);
	}*/



}
