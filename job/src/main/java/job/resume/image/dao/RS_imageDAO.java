package job.resume.image.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import job.resume.image.bean.RS_imageDTO;

@Repository
public class RS_imageDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//증명사진 등록
	public int imageWrite(RS_imageDTO imageDTO) {
		return sqlSession.insert("mybatis.imageMapper.imageWrite", imageDTO);
	}
	
	//글 개수 확인하기
	public int getImageOfId(String m_Id) {
		return sqlSession.selectOne("mybatis.imageMapper.getImageOfId", m_Id);
	}
	
	//쓴 글 확인하기
	public RS_imageDTO viewImageOfId(String memId) {
		return sqlSession.selectOne("mybatis.imageMapper.viewImageOfId", memId);
	}
	//최근사진
	public RS_imageDTO ImageTopList(String m_Id) {
		return sqlSession.selectOne("mybatis.imageMapper.ImageTopList", m_Id);
	}
	
	//쓴 목록 보기
	public List<RS_imageDTO> ImageListOfId(int startNum, int endNum, String m_Id) {
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("m_Id", m_Id);
		System.out.println("map >>>>>>>>>>> " + map);
		return sqlSession.selectList("mybatis.imageMapper.ImageListOfId", map);				
	}

}
