package job.resume.workLV.controller;

import java.util.List;

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

	@Override
	public int rswCounting(String memId) {
		return rs_workLVDAO.rswCounting(memId);
	}

	@Override
	public List<RS_workLVDTO> rswGetList(String memId) {
		return rs_workLVDAO.rswGetList(memId);
	}

	@Override
	public RS_workLVDTO rswGetDTO(int rsw_seq) {
		return rs_workLVDAO.rswGetDTO(rsw_seq);
	}

	@Override
	public int selectLastSeq() {
		return rs_workLVDAO.selectLastSeq();
	}

}
