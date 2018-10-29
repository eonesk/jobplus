package job.resume.edu.controller;

import java.util.List;

import job.resume.edu.bean.RS_eduDTO;

public interface RS_eduService {
	int rseSave(RS_eduDTO eduDTO);
	int selectNumberOfEdu(String memId);
	List<RS_eduDTO> selectEduUserTitleList(String memId);
}
