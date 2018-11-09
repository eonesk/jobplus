package job.company.logo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.company.logo.bean.companyLogoDTO;

@Repository
public class companyLogoDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//로고 등록
	public int logoInsert(companyLogoDTO logoDTO) {
		return sqlSession.insert("mybatis.logoMapper.logoInsert", logoDTO);
	} 
	
	//최근사진
	public companyLogoDTO logoTopList(String cpm_Id) {
		return sqlSession.selectOne("mybatis.logoMapper.logoTopList",cpm_Id);
	}

}
