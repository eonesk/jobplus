package job.company.member.controller;

import job.company.member.bean.CompanyMemberDTO;

public interface CompanyMemberService {
	public int companyMemberInsert(CompanyMemberDTO companyMemberDTO);
	public int companyMemberModify(CompanyMemberDTO companyMemberDTO);
	public CompanyMemberDTO companyMemberGet(String cpm_id);
	public String companyMemberLogin(String cpm_id, String cpm_pw);
	public boolean isExistId(String cpm_id);
}
