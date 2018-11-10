package job.recruitment.condition.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.recruitment.condition.bean.RM_conditionDTO;

@Repository
public class RM_conditionDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 글 저장
	public int Write(RM_conditionDTO conditionDTO) {
		return sqlSession.insert("mybatis.conditionMapper.Write", conditionDTO);
	}
		
	public int selectLastSeq() {
		return sqlSession.selectOne("mybatis.conditionMapper.selectLastSeq");
	}
}
