package job.member.bean;

import java.util.Date;

//회원정보 
public class MemberDTO {
	//주석인데
    // 회원 아이디 
    private String m_id;

    // 회원 비밀번호 
    private String m_pw;

    // 회원 이름 
    private String m_name;

    // 회원 성별 
    private String m_gender;

    // 회원 집번호 
    private String m_homenum;

    // 회원 핸드폰번호 
    private String m_phone;

    // 회원 생일 
    private Date m_birth;

    // 회원 이메일 
    private String m_email;

    // 회원 주소 
    private String m_address;

    // 이메일 수신동의 
    private String m_isemail;

    // 문자 수신동의 
    private String m_isphone;

    // 해외 거주 여부 
    private String m_isForeign;

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_homenum() {
		return m_homenum;
	}

	public void setM_homenum(String m_homenum) {
		this.m_homenum = m_homenum;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public Date getM_birth() {
		return m_birth;
	}

	public void setM_birth(Date m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	

	public String getM_isemail() {
		return m_isemail;
	}

	public void setM_isemail(String m_isemail) {
		this.m_isemail = m_isemail;
	}

	public String getM_isphone() {
		return m_isphone;
	}

	public void setM_isphone(String m_isphone) {
		this.m_isphone = m_isphone;
	}

	public String getM_isForeign() {
		return m_isForeign;
	}

	public void setM_isForeign(String m_isForeign) {
		this.m_isForeign = m_isForeign;
	}

    
}