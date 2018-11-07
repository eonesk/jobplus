package job.company.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.company.member.bean.CompanyMemberDTO;


@Repository
public class CompanyMemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int companyMemberInsert(CompanyMemberDTO companyMemberDTO) {
		return sqlSession.insert("mybatis.companyMemberMapper.companyMemberInsert", companyMemberDTO);
	}	
	public int companyMemberModify(CompanyMemberDTO companyMemberDTO) {
		return sqlSession.update("mybatis.companyMemberMapper.companyMemberModify", companyMemberDTO);
	}	
	
	public CompanyMemberDTO companyMemberGet(String cpm_id) {
		return sqlSession.selectOne("mybatis.companyMemberMapper.companyMemberGet", cpm_id);
	}
	
	public String companyMemberLogin(String cpm_id, String cpm_pw) {
		Map<String, String> map = new HashMap<>();
		map.put("cpm_id", cpm_id);
		map.put("cpm_pwd", cpm_pw);
		return sqlSession.selectOne("mybatis.companyMemberMapper.companyMemberLogin", map);
	}
	
	
	public boolean isExistId(String cpm_id) {
		boolean exist = false;
		if(sqlSession.selectOne("mybatis.companyMemberMapper.isExistId", cpm_id) != null) {
			exist = true;
		}
		return exist;
	}
}