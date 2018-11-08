package job.company.info.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.company.info.bean.CompanyInfoDTO;
import job.company.member.bean.CompanyMemberDTO;

@Repository
public class CompanyInfoDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertCompanyInfo(CompanyInfoDTO companyInfoDTO) {
		return sqlSession.insert("mybatis.companyInfoMapper.insertCompanyInfo", companyInfoDTO);
	}
	
	public CompanyInfoDTO selectCompanyInfo(String comId) {
		return sqlSession.selectOne("mybatis.companyInfoMapper.selectCompanyInfo", comId);
	}
	
	public int selectCount(String memId) {
		return sqlSession.selectOne("mybatis.companyInfoMapper.selectCount", memId);
	} 
	
	public CompanyMemberDTO selectCompanyMember(String comId) {
		return sqlSession.selectOne("mybatis.companyInfoMapper.selectCompanyMember", comId);
	}
	
	public int updateCompanyInfo(CompanyInfoDTO companyInfoDTO) {
		return sqlSession.update("mybatis.companyInfoMapper.updateCompanyInfo", companyInfoDTO);
	}
}
