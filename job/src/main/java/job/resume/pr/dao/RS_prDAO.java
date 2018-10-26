package job.resume.pr.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.resume.pr.bean.RS_prDTO;

@Repository
public class RS_prDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int rsprSave(RS_prDTO rsprDTO) {
		return sqlSession.insert("mybatis.prMapper.rsprSave", rsprDTO);
	}
	
	public int selectNumberOfPr(String memId) {
		return sqlSession.selectOne("mybatis.prMapper.selectNumberOfPr", memId);
	}
	
	public List<RS_prDTO> selectRsprUserTitleList(String memId){
		return sqlSession.selectList("mybatis.prMapper.selectRsprUserTitleList", memId);
	}
}
