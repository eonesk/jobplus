package job.recruitment.mainSearch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.recruitment.mainSearch.dao.MainSearchDAO;

@Service
public class MainSearchServiceImpl implements MainSearchService {
	
	@Autowired
	MainSearchDAO mainSearchDAO;

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
	public String selectCompany(String searchCompany) {
		return mainSearchDAO.selectCompany(searchCompany);
	}

	@Override
	public String selectTitle(int range) {
		return mainSearchDAO.selectTitle(range);
	}
	
	

}
