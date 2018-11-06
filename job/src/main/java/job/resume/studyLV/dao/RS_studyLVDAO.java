package job.resume.studyLV.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.resume.studyLV.bean.RS_studyLVDTO;

@Repository
public class RS_studyLVDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int rssSave(RS_studyLVDTO studyLVDTO) {
		return sqlSession.insert("mybatis.studyLVMapper.rssSave", studyLVDTO);		
	}
	
	public int selectNumberOfStudyLV(String memId) {
		return sqlSession.selectOne("mybatis.studyLVMapper.selectNumberOfStudyLV", memId);
	}
	
	public List<RS_studyLVDTO> selectStudyLVUserTitleList(String memId) {
		return sqlSession.selectList("mybatis.studyLVMapper.selectStudyLVUserTitleList", memId);
	}
	
	public RS_studyLVDTO selectStudyLVDTO(int rss_Seq) {
		return sqlSession.selectOne("mybatis.studyLVMapper.selectStudyLVDTO", rss_Seq);
	}
}
