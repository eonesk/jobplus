package job.resume.portfolio.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import job.resume.portfolio.bean.RS_portfolioDTO;

@Repository
public class RS_portfolioDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//등록
	public int portfolioWrite(RS_portfolioDTO portfolioDTO) {
		System.out.println("[DAO] rspf_Type : " + portfolioDTO.getrspf_Type());
		return sqlSession.insert("mybatis.portfolioMapper.portfolioWrite", portfolioDTO);
	}
	
	public RS_portfolioDTO viewportfolioOfId(String memId) {
		return sqlSession.selectOne("mybatis.portfolioMapper.viewportfolioOfId", memId);
	}
	
	public int getportfolioOfId(String memId) {
		return sqlSession.selectOne("mybatis.portfolioMapper.getportfolioOfId", memId);
	}
	
	public List<RS_portfolioDTO> portfolioListOfId(int startNum, int endNum, String m_Id) {
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("m_Id", m_Id);
		System.out.println("map >>>>>>>>>>> " + map);
		return sqlSession.selectList("mybatis.portfolioMapper.portfolioListOfId", map);
	}
}
