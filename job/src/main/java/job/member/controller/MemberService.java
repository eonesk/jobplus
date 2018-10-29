package job.member.controller;

import job.member.bean.MemberDTO;

public interface MemberService {
	public int memberInsert(MemberDTO memberDTO);
	public int modify(MemberDTO memberDTO);
	public MemberDTO getMember(String id);
	public String login(String id, String pwd);
	public boolean isExistId(String id);
}
