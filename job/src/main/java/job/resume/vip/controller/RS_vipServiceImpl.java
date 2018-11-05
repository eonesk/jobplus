package job.resume.vip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.resume.vip.bean.RS_vipDTO;
import job.resume.vip.dao.RS_vipDAO;

@Service
public class RS_vipServiceImpl implements RS_vipService {
	@Autowired
	RS_vipDAO rs_vipDAO;
	
	@Override
	public int rsvSave(RS_vipDTO rs_vipDTO) {
		return rs_vipDAO.rsvSave(rs_vipDTO);
	}

	@Override
	public int rsvCounting(String memId) {
		return rs_vipDAO.rsvCounting(memId);
	}

	@Override
	public List<RS_vipDTO> rsvGetList(String memId) {
		return rs_vipDAO.rsvGetList(memId);
	}

	@Override
	public RS_vipDTO rsvGetDTO(int rsv_seq) {
		return rs_vipDAO.rsvGetDTO(rsv_seq);
	}

}
