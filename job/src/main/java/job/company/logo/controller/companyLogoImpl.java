package job.company.logo.controller;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.company.logo.bean.companyLogoDTO;
import job.company.logo.dao.companyLogoDAO;

@Service
public class companyLogoImpl implements companyLogoService {
	@Autowired
	private companyLogoDAO logoDAO;

	@Override
	public int logoInsert(companyLogoDTO logoDTO) { 
		return logoDAO.logoInsert(logoDTO);
	}

	@Override
	public companyLogoDTO logoTopList(String cpm_Id) {
		return logoDAO.logoTopList(cpm_Id);
	}
	@Override
	public companyLogoDTO viewLogoOfId(String cpm_Id) {
		return logoDAO.viewLogoOfId(cpm_Id);
	}

	@Override
	public List<companyLogoDTO> logoListOfId(int startNum, int endNum, String cpm_Id) {
		return logoDAO.logoListOfId(startNum, endNum, cpm_Id);
	}

	@Override
	public int getLogoOfId(String cpm_Id) {
		return logoDAO.getLogoOfId(cpm_Id);
	}
}