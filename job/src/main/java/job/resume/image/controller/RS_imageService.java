package job.resume.image.controller;

import java.util.List;
import job.resume.image.bean.RS_imageDTO;
public interface RS_imageService {

	//증명사진 등록
	int imageWrite(RS_imageDTO imageDTO);
	
	//글 개수 확인하기
	int getImageOfId(String memId);
	
	//쓴 글 확인하기
	RS_imageDTO viewImageOfId(String memId);
	
	/**
	 * 최근사진
	 * @param memId
	 * @return
	 */
	RS_imageDTO ImageTopList(String memId);
	
	//쓴 목록 보기
	List<RS_imageDTO> ImageListOfId(int startNum, int endNum, String memId);
	
}