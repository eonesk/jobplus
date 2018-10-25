package job.resume.image.controller;

import job.resume.image.bean.RS_imageDTO;

public interface RS_imageService {

	//증명사진 등록
	int imageWrite(RS_imageDTO imageDTO);
//	//증명사진 삭제
//	int imageDelete(int rsimSeq);
}
