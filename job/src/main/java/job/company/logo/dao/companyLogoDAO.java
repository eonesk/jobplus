package job.company.logo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.company.logo.bean.companyLogoDTO;
import job.resume.image.bean.RS_imageDTO;
 
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
	
	//사진 확인 
	public companyLogoDTO viewLogoOfId(String cpm_Id) {
		return sqlSession.selectOne("mybatis.logoMapper.viewLogoOfId", cpm_Id);
	}
	
	//개수 확인
	public int getLogoOfId(String cpm_Id) {
		return sqlSession.selectOne("mybatis.logoMapper.getLogoOfId", cpm_Id);
	}
	//쓴 목록 보기
	public List<companyLogoDTO> logoListOfId(int startNum, int endNum, String cpm_Id) {
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("cpm_Id", cpm_Id);
		System.out.println("map >>>>>>>>>>> " + map);
		return sqlSession.selectList("mybatis.logoMapper.logoListOfId", map);				
	}
}
