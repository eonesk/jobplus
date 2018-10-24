package job.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.member.bean.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int write(MemberDTO memberDTO) {
		return sqlSession.insert("mybatis.memberMapper.memberInsert", memberDTO);
	}	
	public int modify(MemberDTO memberDTO) {
		return sqlSession.update("mybatis.memberMapper.memberModify", memberDTO);
	}	
	// 회원1명의 정보 읽어오기
	public MemberDTO getMember(String id) {
		return sqlSession.selectOne("mybatis.memberMapper.memberGet", id);
	}
	
	public String login(String id, String pwd) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		return sqlSession.selectOne("mybatis.memberMapper.memberLogin", map);
	}
	
	
	public boolean isExistId(String id) {
		boolean exist = false;
		if(sqlSession.selectOne("mybatis.memberMapper.isExistId", id) != null) {
			exist = true;
		}
		return exist;
	}
}
