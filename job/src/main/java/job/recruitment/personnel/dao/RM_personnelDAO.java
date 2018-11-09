package job.recruitment.personnel.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.recruitment.personnel.bean.RM_personnelDTO;

@Repository
public class RM_personnelDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 글 저장
	public int save(RM_personnelDTO rm_personnelDTO) {
		return sqlSession.insert("mybatis.personnelMapper.save", rm_personnelDTO);
	}
	
	// 글 불러오기
	public RM_personnelDTO load(int rmp_seq) {
		return sqlSession.selectOne("mybatis.personnelMapper.load", rmp_seq);
	}
}
