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
	public int updateResume_table(int table_Seq, int rs_Seq, String m_Id, String table) {
		return resumeDAO.updateResume_table(table_Seq, rs_Seq, m_Id, table);
	}

	@Override
	public int deleteResume(int rs_Seq, String m_Id) {
		return resumeDAO.deleteResume(rs_Seq, m_Id);
	}

	@Override
	public MemberDTO selectMember(String memId) {
		return resumeDAO.selectMember(memId);
	}

	@Override
	public ResumeDTO selectResume(String memId, int rs_seq) {
		return resumeDAO.selectResume(memId, rs_seq);
	}

	@Override
	public int selectLastSeq(String memId) {
		return resumeDAO.selectLastSeq(memId);
	}

}
