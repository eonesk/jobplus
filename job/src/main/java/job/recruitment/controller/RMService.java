package job.recruitment.controller;

import job.recruitment.bean.RMDTO;

public interface RMService {
	int Write(RMDTO rmDTO);
	RMDTO selectRM(int rm_Seq);
}
