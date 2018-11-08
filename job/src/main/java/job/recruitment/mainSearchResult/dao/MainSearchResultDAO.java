package job.recruitment.mainSearchResult.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.recruitment.bean.RMDTO;
import job.recruitment.condition.bean.RM_conditionDTO;
import job.recruitment.job.bean.RM_jobDTO;

@Repository
public class MainSearchResultDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public String selectCpiCompanyName(String comId) {
		return sqlSession.selectOne("mybatis.mainSearchResultMapper.selectCpiCompanyName", comId);
	}
	
	public RMDTO selectRmTitle(int rm_Seq, String comId) {
		Map<String, String> map = new HashMap<>();
		map.put("rm_Seq", String.valueOf(rm_Seq));
		map.put("comId", comId);
		return sqlSession.selectOne("mybatis.mainSearchResultMapper.selectCpiCompanyName", map);
	}
	
	public RM_jobDTO selectRmJob(int rmj_Seq) {
		return sqlSession.selectOne("mybatis.mainSearchResultMapper.selectRmJob", rmj_Seq);
	}
	
	public RM_conditionDTO selectRmCondition(int rmc_Seq) {
		return sqlSession.selectOne("mybatis.mainSearchResultMapper.selectRmCondition", rmc_Seq);
	}
}
