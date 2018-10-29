package job.resume.license.bean;

import java.util.Date;

public class RS_licenseDTO {

    // 자격증seq 
    private Integer rsls_Seq;

    // 자격증 이름 
    private String rsls_Name;

    // 발행처 
    private String rsls_Company;

    // 취득년월 
    private Date rsls_Date;

    // 회원 아이디 
    private String m_Id;

    // 사용자 설정 이름
    private String rsls_UserTitle;

	@Override
	public String toString() {
		return "RS_licenseDTO [rsls_Seq=" + rsls_Seq + ", rsls_Name=" + rsls_Name + ", rsls_Company=" + rsls_Company
				+ ", rsls_Date=" + rsls_Date + ", m_Id=" + m_Id + ", rsls_UserTitle=" + rsls_UserTitle + "]";
	}

	public Integer getRsls_Seq() {
		return rsls_Seq;
	}

	public void setRsls_Seq(Integer rsls_Seq) {
		this.rsls_Seq = rsls_Seq;
	}

	public String getRsls_Name() {
		return rsls_Name;
	}

	public void setRsls_Name(String rsls_Name) {
		this.rsls_Name = rsls_Name;
	}

	public String getRsls_Company() {
		return rsls_Company;
	}

	public void setRsls_Company(String rsls_Company) {
		this.rsls_Company = rsls_Company;
	}

	public Date getRsls_Date() {
		return rsls_Date;
	}

	public void setRsls_Date(Date rsls_Date) {
		this.rsls_Date = rsls_Date;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getRsls_UserTitle() {
		return rsls_UserTitle;
	}

	public void setRsls_UserTitle(String rsls_UserTitle) {
		this.rsls_UserTitle = rsls_UserTitle;
	}

}
