package job.recruitment.apply.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.recruitment.apply.bean.RM_applyDTO;


@Repository
public class RM_applyDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 글 저장
	public int Write(RM_applyDTO applyDTO) {
		return sqlSession.insert("mybatis.applyMapper.Write", applyDTO);
	}
	
	public int selectLastSeq() {
		return sqlSession.selectOne("mybatis.applyMapper.selectLastSeq");
	}
	public RM_applyDTO selectTable(int rma_Seq) {
		return sqlSession.selectOne("mybatis.applyMapper.selectTable", rma_Seq);
	}
}
