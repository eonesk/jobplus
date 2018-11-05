package job.resume.license.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.resume.license.bean.RS_licenseDTO;

@Repository
public class RS_licenseDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int rslsSave(RS_licenseDTO licenseDTO) {
		return sqlSession.insert("mybatis.licenseMapper.rslsSave", licenseDTO);
	}
	
	public int selectNumberOfLicense(String memId) {
		return sqlSession.selectOne("mybatis.licenseMapper.selectNumberOfLicense", memId);
	}
	
	public List<RS_licenseDTO> selectLicenseUserTitleList(String memId) {
		return sqlSession.selectList("mybatis.licenseMapper.selectLicenseUserTitleList", memId);
	}
	
	public RS_licenseDTO selectLicenseDTO(int rsls_Seq) {
		return sqlSession.selectOne("mybatis.licenseMapper.selectLicenseDTO", rsls_Seq);
	}
	
	public int selectLastSeq() {
		return sqlSession.selectOne("mybatis.licenseMapper.selectLastSeq");
	}
}
