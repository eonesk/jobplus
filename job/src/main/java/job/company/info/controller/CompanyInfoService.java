package job.company.info.controller;

import job.company.info.bean.CompanyInfoDTO;

public interface CompanyInfoService {
	public int insertCompanyInfo(CompanyInfoDTO companyInfoDTO);
	
	public CompanyInfoDTO selectCompanyInfo(String comId, int cpi_Seq);
	
	public int selectLastSeq(String comId);
}
