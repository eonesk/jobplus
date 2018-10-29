package job.resume.language.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.resume.language.bean.RS_languageDTO;
import job.resume.language.dao.RS_languageDAO;
@Service
public class RS_languageServiceImpl implements RS_languageService {	
	@Autowired
	private RS_languageDAO languageDAO;
	@Override
	public int Write(RS_languageDTO languageDTO) {
		return languageDAO.Write(languageDTO);
	}
	@Override
	public int selectNumlang(String memId) {
		return languageDAO.selectNumlang(memId);
	}
	@Override
	public List<RS_languageDTO> selectTitleList(String memId) {
		return languageDAO.selectTitleList(memId);
	}
	@Override
	public int Delete(int rslg_Seq) {
		return languageDAO.Delete(rslg_Seq);
	}

}
