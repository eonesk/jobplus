package job.member.controller;

import job.member.bean.MemberDTO;

public interface MemberService {
	public int memberInsert(MemberDTO memberDTO);
	public int modify(MemberDTO memberDTO);
	public MemberDTO getMember(String id);
	public String login(String m_id, String m_pw);
	public boolean isExistId(String id);
}
