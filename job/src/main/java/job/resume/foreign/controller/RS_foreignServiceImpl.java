package job.resume.foreign.controller;

import java.util.List;

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

	@Override
	public int getForeignOfId(String memId) {
		return foreignDAO.getForeignOfId(memId);
	}

	@Override
	public List<RS_foreignDTO> viewForeignOfId(String memId) {
		return foreignDAO.viewForeignOfId(memId);
	}

//	@Override
//	public List<RS_foreignDTO> foreignListOfId(int startNum, int endNum, String memId) {
//		return foreignDAO.foreignListOfId(startNum, endNum, memId);
//	}

	/*@Override
	public int foreignDelete(int rsfSeq) {
		return foreignDAO.foreignDelete(rsfSeq);
	}*/



}
