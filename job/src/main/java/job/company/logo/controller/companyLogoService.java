package job.company.logo.controller;

import java.util.List;

import job.company.logo.bean.companyLogoDTO;
 

public interface companyLogoService {

	int logoInsert(companyLogoDTO logoDTO);
	
	companyLogoDTO logoTopList(String cpm_Id);

	companyLogoDTO viewLogoOfId(String cpm_Id);
	
	List<companyLogoDTO> logoListOfId(int startNum, int endNum, String cpm_Id);
	
	int getLogoOfId(String cpm_Id);
	
}
