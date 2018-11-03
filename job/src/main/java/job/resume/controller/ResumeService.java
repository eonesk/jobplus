package job.resume.controller;

import job.member.bean.MemberDTO;
import job.resume.bean.ResumeDTO;

public interface ResumeService {
	// 이력서 새로 입력
	public int insertResume(ResumeDTO resumeDTO);

	// 이력서 자체의 업데이트문
	public int updateResume(ResumeDTO resumeDTO);

	// 이력서의 하위테이블에 대한 개별적 업데이트문
	public int updateResume_table(int table_Seq, int rs_Seq, String m_Id, String table);

	// 이력서 삭제
	public int deleteResume(int rs_Seq, String m_Id);

	// 이력서 만들때 멤버테이블에서 정보가져오기
	public MemberDTO selectMember(String memId);
	
	public ResumeDTO selectResume(String memId, int rs_seq);
	
	public int selectLastSeq(String memId);
}
