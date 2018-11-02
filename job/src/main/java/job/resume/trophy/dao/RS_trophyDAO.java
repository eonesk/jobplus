package job.resume.trophy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.resume.edu.bean.RS_eduDTO;
import job.resume.trophy.bean.RS_trophyDTO;


@Repository
public class RS_trophyDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 글 저장
	public int Write(RS_trophyDTO rs_trophyDTO) {
		return sqlSession.insert("mybatis.trophyMapper.Write", rs_trophyDTO);
	}
	// 갯수
	public int selectNumtrophy(String memId) {
		return sqlSession.selectOne("mybatis.trophyMapper.selectNumtrophy", memId);
	}
	// 리스트	
	public List<RS_trophyDTO> selectTitleList(String memId) {
		return sqlSession.selectList("mybatis.trophyMapper.selectTitleList", memId);
	}		
	// 글 삭제
	public int Delete(int rst_Seq) {	
		return sqlSession.delete("mybatis.trophyMapper.Delete", rst_Seq);
	}
	// 검색
	public RS_trophyDTO selectTrophyDTO(int rst_Seq) {
		return sqlSession.selectOne("mybatis.trophyMapper.selectTrophyDTO", rst_Seq);
	}
}
