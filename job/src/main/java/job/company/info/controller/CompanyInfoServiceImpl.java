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
	public CompanyInfoDTO selectCompanyInfo(String comId, int cpi_Seq) {
		return companyInfoDAO.selectCompanyInfo(comId, cpi_Seq);
	}

	@Override
	public int selectLastSeq(String comId) {
		return companyInfoDAO.selectLastSeq(comId);
	}

	@Override
	public CompanyMemberDTO selectCompanyMember(String comId) {
		return companyInfoDAO.selectCompanyMember(comId);
	}

}
