package job.resume.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.member.bean.MemberDTO;
import job.resume.bean.ResumeDTO;
import job.resume.bean.ResumeListDTO;

@Repository
public class ResumeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 이력서 새로 입력
	public int insertResume(ResumeDTO resumeDTO) {
		return sqlSession.insert("mybatis.resumeMapper.insertResume", resumeDTO);
	}
	
	// 이력서 수정폼을 생성 하기전 값 가져오기
	public ResumeDTO selectResume(String memId, int rs_seq) {
		Map<String, String> map = new HashMap<>();
		map.put("memId", memId);
		map.put("rs_seq", String.valueOf(rs_seq));
		
		return sqlSession.selectOne("mybatis.resumeMapper.selectResume", map);
	}

	// 이력서 자체의 업데이트문
	public int updateResume(ResumeDTO resumeDTO) {
		return sqlSession.update("mybatis.resumeMapper.updateResume", resumeDTO);
	}

	// 이력서의 하위테이블에 대한 개별적 업데이트문
	public int updateResume_table(int table_Seq, int rs_Seq, String m_Id, String table) {
		Map<String, String> map = new HashMap<>();
		String mybatisPath = "mybatis.resumeMapper.updateResume_" + table + "_SEQ";

		map.put("table_Seq", String.valueOf(table_Seq));
		map.put("rs_Seq", String.valueOf(rs_Seq));
		map.put("m_Id", m_Id);
		return sqlSession.update(mybatisPath, map);
	}

	// 이력서 삭제
	public int deleteResume(int rs_Seq, String m_Id) {
		Map<String, String> map = new HashMap<>();

		map.put("rs_Seq", String.valueOf(rs_Seq));
		map.put("m_Id", m_Id);
		return sqlSession.delete("mybatis.resumeMapper.deleteResume", map);
	}

	// 이력서 만들때 멤버테이블에서 정보가져오기
	public MemberDTO selectMember(String memId) {
		MemberDTO memberDTO = sqlSession.selectOne("mybatis.resumeMapper.selectMember", memId);
		return memberDTO;
	}
	
	public int selectLastSeq(String memId) {
		return sqlSession.selectOne("mybatis.resumeMapper.selectLastSeq", memId);
	}
	
	public List<ResumeListDTO> selectResumeList(String memId) {
		return sqlSession.selectList("mybatis.resumeMapper.selectResumeList", memId);
	}
}
