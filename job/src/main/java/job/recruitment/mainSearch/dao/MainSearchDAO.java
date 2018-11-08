package job.recruitment.mainSearch.dao;

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
	
	public String selectTitle(int range) {
		return sqlSession.selectOne("mybatis.mainSearchMapper.selectTitle", range);
	}
	
}
