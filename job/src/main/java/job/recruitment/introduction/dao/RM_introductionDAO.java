package job.recruitment.introduction.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.recruitment.introduction.bean.RM_introductionDTO;

@Repository
public class RM_introductionDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 글 저장
	public int Write(RM_introductionDTO introductionDTO) {
		return sqlSession.insert("mybatis.introductionMapper.Write", introductionDTO);
	}
	
	public int selectLastSeq() {
		return sqlSession.selectOne("mybatis.introductionMapper.selectLastSeq");
	}
}
