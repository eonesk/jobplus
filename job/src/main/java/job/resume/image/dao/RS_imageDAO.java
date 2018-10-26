package job.resume.image.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.resume.image.bean.RS_imageDTO;

@Repository
public class RS_imageDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//이력서 이미지 등록
	public int imageWrite(RS_imageDTO imageDTO) {
		return sqlSession.insert("mybatis.imageMapper.imageWrite", imageDTO);
	}
//	//이력서 이미지 삭제
//	public int imageDelete(int rsim_Seq) {
//		return sqlSession.delete("mybatis.imageMapper.imageDelete", rsim_Seq);		
//	}
}