package job.resume.foreign.dao;

import java.util.List;
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
	
	//글 개수 확인
	public int getForeignOfId(String m_Id) {
		return sqlSession.selectOne("mybatis.foreignMapper.getForeignOfId", m_Id);
	}
	
	//쓴 글 확인
	public List<RS_foreignDTO> viewForeignOfId(String memId) {
		return sqlSession.selectList("mybatis.foreignMapper.viewForeignOfId", memId);
	}
	
//	//목록보기
//	public List<RS_foreignDTO> foreignListOfId(int startNum, int endNum, String m_Id) {
//		Map<String, Object> map = new HashMap<>();
//		map.put("startNum", startNum);
//		map.put("endNum", endNum);
//		map.put("m_Id", m_Id);
//		System.out.println("map >>>>>>>>>>> " + map);
//		return sqlSession.selectList("mybatis.foreignMapper.foreignListOfId", map);
//	}
	
	/*//해외경험 삭제
	public int foreignDelete(int rsfSeq) {
		return sqlSession.delete("mybatis.foreignMapper.foreignDelete", rsfSeq);
	}*/
}
