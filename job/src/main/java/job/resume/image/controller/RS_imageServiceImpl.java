package job.resume.image.controller;

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
//	public int imageDelete(int rsimSeq) {
//		return imageDAO.imageDelete(rsimSeq);
//	}
}
