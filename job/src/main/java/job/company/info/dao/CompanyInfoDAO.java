package job.company.info.dao;

import java.util.HashMap;
import java.util.Map;

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
	
	public CompanyInfoDTO selectCompanyInfo(String comId, int cpi_Seq) {
		Map<String, String> map = new HashMap<>();
		map.put("comId", comId);
		map.put("cpi_Seq", String.valueOf(cpi_Seq));
		
		return sqlSession.selectOne("mybatis.companyInfoMapper.selectCompanyInfo", map);
	}
	
	public int selectLastSeq(String memId) {
		return sqlSession.selectOne("mybatis.companyInfoMapper.selectLastSeq", memId);
	} 
	
	public CompanyMemberDTO selectCompanyMember(String comId) {
		return sqlSession.selectOne("mybatis.companyInfoMapper.selectCompanyMember", comId);
	}
}
