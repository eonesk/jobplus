package job.resume.license.controller;

import java.util.List;

import job.resume.license.bean.RS_licenseDTO;

public interface RS_licenseService {
	int rslsSave(RS_licenseDTO licenseDTO);
	int selectNumberOfLicense(String memId);
	List<RS_licenseDTO> selectLicenseUserTitleList(String memId);
	RS_licenseDTO selectLicenseDTO(int rsls_Seq);
	int selectLastSeq();
}
