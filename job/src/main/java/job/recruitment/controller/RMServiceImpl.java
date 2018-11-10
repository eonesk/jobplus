package job.recruitment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.recruitment.bean.RMDTO;
import job.recruitment.dao.RMDAO;

@Service
public class RMServiceImpl implements RMService {

	@Autowired
	private RMDAO rmDAO;
	
	@Override
	public int Write(RMDTO rmDTO) {
		return rmDAO.Write(rmDTO); 
	}
}
