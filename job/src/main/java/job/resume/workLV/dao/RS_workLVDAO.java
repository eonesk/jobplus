package job.resume.workLV.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.resume.workLV.bean.RS_workLVDTO;



@Repository
public class RS_workLVDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int rswSave(RS_workLVDTO rs_workLVDTO) {
		return sqlSession.insert("mybatis.workLVMapper.rswSave", rs_workLVDTO);		
	}
	
	public int rswCounting(String memId) {
		return sqlSession.selectOne("mybatis.workLVMapper.rswCounting", memId);
	}
	
	public List<RS_workLVDTO> rswGetList(String memId){
		return sqlSession.selectList("mybatis.workLVMapper.rswGetList", memId);
	}
}
