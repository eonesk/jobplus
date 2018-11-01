package job.resume.workLV.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.resume.workLV.bean.RS_workLVDTO;
import job.resume.workLV.dao.RS_workLVDAO;
@Service
public class RS_workLVServiceImpl implements RS_workLVService {
	@Autowired
	RS_workLVDAO rs_workLVDAO;
	
	@Override
	public int rswSave(RS_workLVDTO rs_workLVDTO) {
		return rs_workLVDAO.rswSave(rs_workLVDTO);
	}

}
