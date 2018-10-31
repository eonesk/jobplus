package job.resume.portfolio.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.resume.foreign.bean.RS_foreignDTO;
import job.resume.portfolio.bean.RS_portfolioDTO;

@Repository
public class RS_portfolioDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//등록
	public int portfolioWrite(RS_portfolioDTO portfolioDTO) {
		System.out.println("[DAO] rs_pfType : " + portfolioDTO.getRs_pfType());
		return sqlSession.insert("mybatis.portfolioMapper.portfolioWrite", portfolioDTO);
	}
	
	public List<RS_portfolioDTO> selectPortfolioList(String memId) {
		return sqlSession.selectList("mybatis.portfolioMapper.selectPortfolioList", memId);
	}
	
	public int getportfolioOfId(String memId) {
		return sqlSession.selectOne("mybatis.portfolioMapper.getportfolioOfId", memId);
	}
	
//	public List<RS_portfolioDTO> viewportfolioOfId(String memId) {
//		return sqlSession.selectList("mybatis.portfolioMapper.viewportfolioOfId", memId);
//	}
}
