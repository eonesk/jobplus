package job.recruitment.mainSearch.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.recruitment.mainSearch.dao.MainSearchDAO;

@Service
public class MainSearchServiceImpl implements MainSearchService {
	
	@Autowired
	MainSearchDAO mainSearchDAO;

	@Override
	public int selectRM_seq(int range) {
		System.out.println("[ServiceImpl] range : " + range);
		return mainSearchDAO.selectRM_seq(range);
	}
	
	@Override
	public List<Integer> selectXXO(String jobSelect3) {
		System.out.println("[ServiceImpl] jobSelect3 : " + jobSelect3);
		return mainSearchDAO.selectXXO(jobSelect3);
	}

	@Override
	public List<Integer> selectXOX(String searchRegion) {
		return mainSearchDAO.selectXOX(searchRegion);
	}

	@Override
	public List<Integer> selectXOO(String jobSelect3, String searchRegion) {
		return mainSearchDAO.selectXOO(jobSelect3, searchRegion);
	}

	@Override
	public List<String> selectCompany(String searchCompany) {
		return mainSearchDAO.selectCompany(searchCompany);
	}

	@Override
	public List<Integer> selectRM_seqFromId(String cpm_id) {
		return mainSearchDAO.selectRM_seqFromId(cpm_id);
	}

	@Override
	public int selectRM_seqFromIdAndRMC_seq_cnt(String cpm_id, int range) {
		return mainSearchDAO.selectRM_seqFromIdAndRMC_seq_cnt(cpm_id, range);
	}

	@Override
	public int selectRM_seqFromIdAndRMC_seq(String cpm_id, int range) {
		return mainSearchDAO.selectRM_seqFromIdAndRMC_seq(cpm_id, range);
	}

	@Override
	public String selectRM_title(int seq) {
		return mainSearchDAO.selectRM_title(seq);
	}

	@Override
	public String selectCpm_id(int seq) {
		return mainSearchDAO.selectCpm_id(seq);
	}

	@Override
	public String selectRMJ_career(int seq) {
		return mainSearchDAO.selectRMJ_career(seq);
	}

	@Override
	public String selectRMA_studyLV(int seq) {
		return mainSearchDAO.selectRMA_studyLV(seq);
	}

	@Override
	public String selectRMJ_type(int seq) {
		return mainSearchDAO.selectRMJ_type(seq);
	}

	@Override
	public Date selectRMT_endDate(int seq) {
		return mainSearchDAO.selectRMT_endDate(seq);
	}

	@Override
	public String selectCPI_companyName(String cpm_id_re) {
		return mainSearchDAO.selectCPI_companyName(cpm_id_re);
	}
}
