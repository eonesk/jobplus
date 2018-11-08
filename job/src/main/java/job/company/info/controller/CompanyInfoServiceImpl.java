package job.company.info.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.company.info.bean.CompanyInfoDTO;
import job.company.info.dao.CompanyInfoDAO;
import job.company.member.bean.CompanyMemberDTO;

@Service
public class CompanyInfoServiceImpl implements CompanyInfoService {

	@Autowired
	private CompanyInfoDAO companyInfoDAO;
	
	@Override
	public int insertCompanyInfo(CompanyInfoDTO companyInfoDTO) {
		return companyInfoDAO.insertCompanyInfo(companyInfoDTO);
	}

	@Override
	public CompanyInfoDTO selectCompanyInfo(String comId) {
		return companyInfoDAO.selectCompanyInfo(comId);
	}

	@Override
	public int selectCount(String comId) {
		return companyInfoDAO.selectCount(comId);
	}

	@Override
	public CompanyMemberDTO selectCompanyMember(String comId) {
		return companyInfoDAO.selectCompanyMember(comId);
	}

	@Override
	public int updateCompanyInfo(CompanyInfoDTO companyInfoDTO) {
		return companyInfoDAO.updateCompanyInfo(companyInfoDTO);
	}

}
