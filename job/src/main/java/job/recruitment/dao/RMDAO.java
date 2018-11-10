package job.recruitment.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.recruitment.bean.RMDTO;

@Repository
public class RMDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int Write(RMDTO rmDTO) {
		return sqlSession.insert("mybatis.rmMapper.insertRM", rmDTO);
	}
	
	public RMDTO selectRm(int rm_Seq) {
		return sqlSession.selectOne("mybatis.rmMapper.selectRm", rm_Seq);
	}
}
