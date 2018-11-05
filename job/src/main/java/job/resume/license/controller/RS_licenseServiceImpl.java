package job.resume.license.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.resume.license.bean.RS_licenseDTO;
import job.resume.license.dao.RS_licenseDAO;

@Service
public class RS_licenseServiceImpl implements RS_licenseService {

	@Autowired
	RS_licenseDAO licenseDAO;

	@Override
	public int rslsSave(RS_licenseDTO licenseDTO) {
		return licenseDAO.rslsSave(licenseDTO);
	}

	@Override
	public int selectNumberOfLicense(String memId) {
		return licenseDAO.selectNumberOfLicense(memId);
	}

	@Override
	public List<RS_licenseDTO> selectLicenseUserTitleList(String memId) {
		return licenseDAO.selectLicenseUserTitleList(memId);
	}

	@Override
	public RS_licenseDTO selectLicenseDTO(int rsls_Seq) {
		return licenseDAO.selectLicenseDTO(rsls_Seq);
	}

	@Override
	public int selectLastSeq() {
		return licenseDAO.selectLastSeq();
	}
	
	
}
