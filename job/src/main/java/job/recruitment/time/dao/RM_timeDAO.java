package job.recruitment.time.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.recruitment.time.bean.RM_timeDTO;

@Repository
public class RM_timeDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 글 저장
	public int Write(RM_timeDTO timeDTO) {
		return sqlSession.insert("mybatis.timeMapper.Write", timeDTO);
	}
	public int selectLastSeq() {
		return sqlSession.selectOne("mybatis.timeMapper.selectLastSeq");
	}
}
