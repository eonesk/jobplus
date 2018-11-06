package job.resume.image.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import job.resume.image.bean.RS_imageDTO;
import job.resume.image.dao.RS_imageDAO;

@Service
public class RS_imageServiceImpl implements RS_imageService {
	@Autowired
	private RS_imageDAO imageDAO;

	@Override
	public int imageWrite(RS_imageDTO imageDTO) {
		return imageDAO.imageWrite(imageDTO);
	}
//	@Override
//	public int imageDelete(int rsim_Seq) {
//		return imageDAO.imageDelete(rsim_Seq);
//	}

	@Override
	public int getImageOfId(String memId) {
		return imageDAO.getImageOfId(memId);
	}	
	/**
	 * 최근사진
	 */
	@Override
	public RS_imageDTO ImageTopList(String memId) {
		return imageDAO.ImageTopList(memId);
	}

	@Override
	public List<RS_imageDTO> ImageListOfId(int startNum, int endNum,String m_Id) {
		return imageDAO.ImageListOfId(startNum, endNum, m_Id);
	}
	@Override
	public RS_imageDTO viewImageOfId(String memId) {
		return imageDAO.viewImageOfId(memId);
	}


}