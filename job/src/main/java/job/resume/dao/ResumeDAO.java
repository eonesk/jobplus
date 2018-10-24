package job.resume.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.resume.bean.ResumeDTO;

@Repository
public class ResumeDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//이력서 새로 입력
	public int insertResume(ResumeDTO resumeDTO) {
		return sqlSession.insert("mybatis.resumeMapper.insertResume", resumeDTO);
	}
	
	//이력서 자체의 업데이트문
	public int updateResume(ResumeDTO resumeDTO) {
		return sqlSession.update("mybatis.resumeMapper.updateResume", resumeDTO);
	}
	
	//이력서의 하위테이블에 대한 개별적 업데이트문
	public int updateResume_table(int tableSeq, int rsSeq, String mId, String table) {
		Map<String, String> map = new HashMap<>();
		String mybatisPath = "mybatis.resumeMapper.updateResume_"+table+"_SEQ";
		
		map.put("tableSeq", String.valueOf(tableSeq));
		map.put("rsSeq", String.valueOf(rsSeq));
		map.put("mId", mId);
		return sqlSession.update(mybatisPath, map);
	}
	
	public int deleteResume(int rsSeq, String mId) {
		Map<String, String> map = new HashMap<>();
		
		map.put("rsSeq", String.valueOf(rsSeq));
		map.put("mId", mId);
		return sqlSession.delete("mybatis.resumeMapper.deleteResume", map);
	}
	
}
