package job.resume.intern.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.resume.intern.bean.RS_internDTO;

@Repository
public class RS_internDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 글 저장
	public int Write(RS_internDTO rs_internDTO) {
		return sqlSession.insert("mybatis.internMapper.Write", rs_internDTO);
	}

	// 글 삭제
	public int Delete(int rsitSeq) {	
		return sqlSession.delete("mybatis.internMapper.Delete", rsitSeq);
	}
}
