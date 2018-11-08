package job.company.logo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import job.company.logo.bean.companyLogoDTO;
import job.resume.image.bean.RS_imageDTO;

public class companyLogoDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//증명사진 등록
	public int logoInsert(companyLogoDTO logoDTO) {
		return sqlSession.insert("mybatis.logoMapper.logoInsert", logoDTO);
	} 
	
//	//최근사진
//	public companyLogoDTO ImageTopList(String m_Id) {
//		return sqlSession.selectOne("mybatis.logoMapper.logoTopList", m_Id);
//	}

}
