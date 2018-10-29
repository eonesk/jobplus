package job.resume.trophy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.resume.trophy.bean.RS_trophyDTO;
import job.resume.trophy.dao.RS_trophyDAO;
@Service
public class RS_trophyServiceImpl implements RS_trophyService {
	@Autowired
	private RS_trophyDAO trophyDAO;
	
	@Override
	public int Write(RS_trophyDTO trophyDTO) {
		return trophyDAO.Write(trophyDTO);
	}
	@Override
	public int selectNumtrophy(String memId) {
		return trophyDAO.selectNumtrophy(memId);
	}
	@Override
	public List<RS_trophyDTO> selectTitleList(String memId) {
		return trophyDAO.selectTitleList(memId);
	}
	@Override
	public int Delete(int rst_Seq) {
		return trophyDAO.Delete(rst_Seq);
	}

}
