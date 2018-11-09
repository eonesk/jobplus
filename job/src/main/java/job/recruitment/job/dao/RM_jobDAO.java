package job.recruitment.job.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.recruitment.job.bean.RM_jobDTO;

@Repository
public class RM_jobDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 글 저장
	public int save(RM_jobDTO rm_jobDTO) {
		return sqlSession.insert("mybatis.jobMapper.save", rm_jobDTO);
	}
	
	// 글 불러오기
	public RM_jobDTO load(int rmj_seq) {
		return sqlSession.selectOne("mybatis.jobMapper.load", rmj_seq);
	}
}
