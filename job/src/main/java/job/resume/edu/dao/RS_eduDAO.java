package job.resume.edu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.resume.edu.bean.RS_eduDTO;

@Repository
public class RS_eduDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int rseSave(RS_eduDTO eduDTO) {
		return sqlSession.insert("mybatis.eduMapper.rseSave", eduDTO);		
	}
	
	public int selectNumberOfEdu(String memId) {
		return sqlSession.selectOne("mybatis.eduMapper.selectNumberOfEdu", memId);
	}
	
	public List<RS_eduDTO> selectEduUserTitleList(String memId){
		return sqlSession.selectList("mybatis.eduMapper.selectEduUserTitleList", memId);
	}
	
	public RS_eduDTO selectEduDTO(int rse_Seq) {
		return sqlSession.selectOne("mybatis.eduMapper.selectEduDTO", rse_Seq);
	}
}
