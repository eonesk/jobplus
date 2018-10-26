package job.member.bean;

import java.util.Date;

//회원정보 
public class MemberDTO {
	//주석인데
    // 회원 아이디 
    private String m_Id;

    // 회원 비밀번호 
    private String m_Pw;

    // 회원 이름 
    private String m_Name;

    // 회원 성별 
    private String m_Gender;

    // 회원 집번호 
    private String m_Homenum;

    // 회원 핸드폰번호 
    private String m_Phone;

    // 회원 생일 
    private Date m_Birth;

    // 회원 이메일 
    private String m_Email;

    // 회원 주소 
    private String m_Address;

    // 이메일 수신동의 
    private String m_Isemail;

    // 문자 수신동의 
    private String m_Isphone;

    // 해외 거주 여부 
    private String m_Isforeign;

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getM_Pw() {
		return m_Pw;
	}

	public void setM_Pw(String m_Pw) {
		this.m_Pw = m_Pw;
	}

	public String getM_Name() {
		return m_Name;
	}

	public void setM_Name(String m_Name) {
		this.m_Name = m_Name;
	}

	public String getM_Gender() {
		return m_Gender;
	}

	public void setM_Gender(String m_Gender) {
		this.m_Gender = m_Gender;
	}

	public String getM_Homenum() {
		return m_Homenum;
	}

	public void setM_Homenum(String m_Homenum) {
		this.m_Homenum = m_Homenum;
	}

	public String getM_Phone() {
		return m_Phone;
	}

	public void setM_Phone(String m_Phone) {
		this.m_Phone = m_Phone;
	}

	public Date getM_Birth() {
		return m_Birth;
	}

	public void setM_Birth(Date m_Birth) {
		this.m_Birth = m_Birth;
	}

	public String getM_Email() {
		return m_Email;
	}

	public void setM_Email(String m_Email) {
		this.m_Email = m_Email;
	}

	public String getM_Address() {
		return m_Address;
	}

	public void setM_Address(String m_Address) {
		this.m_Address = m_Address;
	}

	public String getM_Isemail() {
		return m_Isemail;
	}

	public void setM_Isemail(String m_Isemail) {
		this.m_Isemail = m_Isemail;
	}

	public String getM_Isphone() {
		return m_Isphone;
	}

	public void setM_Isphone(String m_Isphone) {
		this.m_Isphone = m_Isphone;
	}

	public String getM_Isforeign() {
		return m_Isforeign;
	}

	public void setM_Isforeign(String m_Isforeign) {
		this.m_Isforeign = m_Isforeign;
	}

    
}