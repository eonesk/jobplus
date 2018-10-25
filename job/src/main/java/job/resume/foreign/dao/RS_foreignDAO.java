package job.resume.foreign.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.resume.foreign.bean.RS_foreignDTO;

@Repository
public class RS_foreignDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//해외경험 입력,저장
	public int foreignWrite(RS_foreignDTO foreignDTO) {
		return sqlSession.insert("mybatis.foreignMapper.foreignWrite", foreignDTO);
	}
	
	//해외경험 삭제
	public int foreignDelete(int rsfSeq) {
		return sqlSession.delete("mybatis.foreignMapper.foreignDelete", rsfSeq);
	}
}
