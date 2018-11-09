package job.recruitment.mainSearch.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainSearchDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int selectRM_seq(int range) {
		System.out.println("[MainSearchDAO] range : " + range);
		return sqlSession.selectOne("mybatis.mainSearchMapper.selectRM_seq", range);
	}
	
	public List<Integer> selectXXO(String jobSelect3) {
		System.out.println("[MainSearchDAO] jobSelect3 : " + jobSelect3);
		return sqlSession.selectList("mybatis.mainSearchMapper.selectXXO", jobSelect3);
	}
	
	public List<Integer> selectXOX(String searchRegion) {
		return sqlSession.selectList("mybatis.mainSearchMapper.selectXOX", searchRegion);
	}
	
	public List<Integer> selectXOO(String jobSelect3, String searchRegion) {
		Map<String, String> map = new HashMap<>();
		
		map.put("jobSelect3", jobSelect3);
		map.put("searchRegion", searchRegion);
		
		return sqlSession.selectList("mybatis.mainSearchMapper.selectXOO", map);
	}
	
	public String selectCompany(String searchCompany) {
		return sqlSession.selectOne("mybatis.mainSearchMapper.selectCompany", searchCompany);
	}
	
	public List<Integer> selectRM_seqFromId(String cpm_id) {
		return sqlSession.selectList("mybatis.mainSearchMapper.selectRM_seqFromId", cpm_id);
	}
	
	public int selectRM_seqFromIdAndRMC_seq_cnt(String cpm_id, int range) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("cpm_id", cpm_id);
		map.put("range", range);
		
		return sqlSession.selectOne("mybatis.mainSearchMapper.selectRM_seqFromIdAndRMC_seq_cnt", map);
	}
	
	public int selectRM_seqFromIdAndRMC_seq(String cpm_id, int range) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("cpm_id", cpm_id);
		map.put("range", range);
		
		return sqlSession.selectOne("mybatis.mainSearchMapper.selectRM_seqFromIdAndRMC_seq", map);
	}
	
	public String selectRM_title(int seq) {
		return sqlSession.selectOne("mybatis.mainSearchMapper.selectRM_title", seq);
	}
	
	public String selectCpm_id(int seq) {
		return sqlSession.selectOne("mybatis.mainSearchMapper.selectCpm_id", seq);
	}
	
	public String selectRMJ_career(int seq) {
		return sqlSession.selectOne("mybatis.mainSearchMapper.selectRMJ_career", seq);
	}
	
	public String selectRMA_studyLV(int seq) {
		return sqlSession.selectOne("mybatis.mainSearchMapper.selectRMA_studyLV", seq);
	}
	
	public String selectRMJ_type(int seq) {
		return sqlSession.selectOne("mybatis.mainSearchMapper.selectRMJ_type", seq);
	}
	
	public Date selectRMT_endDate(int seq) {
		return sqlSession.selectOne("mybatis.mainSearchMapper.selectRMT_endDate", seq);
	}
	
}
