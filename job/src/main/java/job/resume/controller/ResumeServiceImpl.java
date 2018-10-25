package job.resume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.member.bean.MemberDTO;
import job.resume.bean.ResumeDTO;
import job.resume.dao.ResumeDAO;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	private ResumeDAO resumeDAO;
	
	@Override
	public int insertResume(ResumeDTO resumeDTO) {
		return resumeDAO.insertResume(resumeDTO);
	}

	@Override
	public int updateResume(ResumeDTO resumeDTO) {
		return resumeDAO.updateResume(resumeDTO);
	}

	@Override
	public int updateResume_table(int tableSeq, int rsSeq, String mId, String table) {
		return resumeDAO.updateResume_table(tableSeq, rsSeq, mId, table);
	}

	@Override
	public int deleteResume(int rsSeq, String mId) {
		return resumeDAO.deleteResume(rsSeq, mId);
	}

	@Override
	public MemberDTO selectMember(String memId) {
		return resumeDAO.selectMember(memId);
	}

}
