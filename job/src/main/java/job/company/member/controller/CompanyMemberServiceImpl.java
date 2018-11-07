package job.company.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.company.member.bean.CompanyMemberDTO;
import job.company.member.dao.CompanyMemberDAO;

@Service
public class CompanyMemberServiceImpl implements CompanyMemberService{
	@Autowired
	private CompanyMemberDAO companyMemberDAO;
	
	@Override
	public int companyMemberInsert(CompanyMemberDTO companyMemberDTO) {
		return companyMemberDAO.companyMemberInsert(companyMemberDTO);
	}

	@Override
	public int companyMemberModify(CompanyMemberDTO companyMemberDTO) {
		return companyMemberDAO.companyMemberModify(companyMemberDTO);
	}

	@Override
	public CompanyMemberDTO companyMemberGet(String cpm_id) {
		return companyMemberDAO.companyMemberGet(cpm_id);
	}

	@Override
	public String companyMemberLogin(String cpm_id, String cpm_pw) {
		return companyMemberDAO.companyMemberLogin(cpm_id, cpm_pw);
	}

	@Override
	public boolean isExistId(String cpm_id) {
		return companyMemberDAO.isExistId(cpm_id);
	}

}
