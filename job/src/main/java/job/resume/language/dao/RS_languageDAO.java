package job.resume.language.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.resume.language.bean.RS_languageDTO;

@Repository
public class RS_languageDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 글 저장
	public int Write(RS_languageDTO languageDTO) {
		return sqlSession.insert("mybatis.languageMapper.Write", languageDTO);
	}
	// 갯수
	public int selectNumlang(String memId) {
		return sqlSession.selectOne("mybatis.languageMapper.selectNumlanguage", memId);
	}
	// 리스트	
	public List<RS_languageDTO> selectTitleList(String memId) {
		return sqlSession.selectList("mybatis.languageMapper.selectTitleList", memId);
	}		
	// 글 삭제
	public int Delete(int rslg_Seq) {	
		return sqlSession.delete("mybatis.languageMapper.Delete", rslg_Seq);
	}
}
