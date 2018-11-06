package job.resume.vip.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.resume.vip.bean.RS_vipDTO;

@Repository
public class RS_vipDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int rsvSave(RS_vipDTO rs_vipDTO) {
		return sqlSession.insert("mybatis.vipMapper.rsvSave", rs_vipDTO);		
	}
	
	public int rsvCounting(String memId) {
		return sqlSession.selectOne("mybatis.vipMapper.rsvCounting", memId);
	}
	
	public List<RS_vipDTO> rsvGetList(String memId){
		return sqlSession.selectList("mybatis.vipMapper.rsvGetList", memId);
	}
	
	public RS_vipDTO rsvGetDTO(int rsw_seq) {
		return sqlSession.selectOne("mybatis.vipMapper.rsvGetDTO", rsw_seq);
	}
	
	public int selectLastSeq() {
		return sqlSession.selectOne("mybatis.vipMapper.selectLastSeq");
	}
}
