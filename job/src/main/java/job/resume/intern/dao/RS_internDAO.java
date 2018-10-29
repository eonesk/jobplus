package job.resume.intern.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.resume.intern.bean.RS_internDTO;

@Repository
public class RS_internDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 글 저장
	public int Write(RS_internDTO internDTO) {
		return sqlSession.insert("mybatis.internMapper.Write", internDTO);
	}
	// 갯수
	public int selectNumintern(String memId) {
		return sqlSession.selectOne("mybatis.internMapper.selectNumintern", memId);
	}
	// 리스트	
	public List<RS_internDTO> selectTitleList(String memId) {
		return sqlSession.selectList("mybatis.internMapper.selectTitleList", memId);
	}		
	// 글 삭제
	public int Delete(int rsit_Seq) {	
		return sqlSession.delete("mybatis.internMapper.Delete", rsit_Seq);
	}
}
