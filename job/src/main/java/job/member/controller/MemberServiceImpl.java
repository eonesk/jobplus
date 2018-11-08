package job.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.member.bean.MemberDTO;
import job.member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int memberInsert(MemberDTO memberDTO) {
		return memberDAO.memberInsert(memberDTO);
	}

	@Override
	public int modify(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDTO getMember(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String login(String m_id, String m_pw) {
		return memberDAO.login(m_id, m_pw);
	}

	@Override
	public boolean isExistId(String id) {
		// TODO Auto-generated method stub
		return false;
	}
}
