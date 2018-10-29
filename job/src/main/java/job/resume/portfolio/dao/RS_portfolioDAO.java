package job.resume.portfolio.dao;

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
		return sqlSession.insert("mybatis.portfolioMapper.portfolioWrite", portfolioDTO);
	}
}
