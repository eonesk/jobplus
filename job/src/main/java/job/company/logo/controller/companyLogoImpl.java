package job.company.logo.controller;

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
}