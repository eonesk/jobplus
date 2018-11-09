package job.company.logo.controller;

import job.company.logo.bean.companyLogoDTO;

public interface companyLogoService {

	int logoInsert(companyLogoDTO logoDTO);
	companyLogoDTO logoTopList(String cpm_Id);
}
 