package job.resume.edu.bean;

import java.util.Date;

public class RS_eduDTO {
	
    // 교육 이수seq 
    private Integer rse_Seq;

    // 교육명 
    private String rse_Name;

    // 교육기관 
    private String rse_Company;

    // 시작년월 
    private Date rse_Startdate;

    // 종료년월 
    private Date rse_Enddate;

    // 교육내용 
    private String rse_Content;

    // 회원 아이디 
    private String m_Id;
    
    // 사용자 설정 이름
    private String rse_UserTitle;

	@Override
	public String toString() {
		return "RS_eduDTO [rse_Seq=" + rse_Seq + ", rse_Name=" + rse_Name + ", rse_Company=" + rse_Company
				+ ", rse_Startdate=" + rse_Startdate + ", rse_Enddate=" + rse_Enddate + ", rse_Content=" + rse_Content
				+ ", m_Id=" + m_Id + ", rse_UserTitle=" + rse_UserTitle + "]";
	}

	public Integer getRse_Seq() {
		return rse_Seq;
	}

	public void setRse_Seq(Integer rse_Seq) {
		this.rse_Seq = rse_Seq;
	}

	public String getRse_Name() {
		return rse_Name;
	}

	public void setRse_Name(String rse_Name) {
		this.rse_Name = rse_Name;
	}

	public String getRse_Company() {
		return rse_Company;
	}

	public void setRse_Company(String rse_Company) {
		this.rse_Company = rse_Company;
	}

	public Date getRse_Startdate() {
		return rse_Startdate;
	}

	public void setRse_Startdate(Date rse_Startdate) {
		this.rse_Startdate = rse_Startdate;
	}

	public Date getRse_Enddate() {
		return rse_Enddate;
	}

	public void setRse_Enddate(Date rse_Enddate) {
		this.rse_Enddate = rse_Enddate;
	}

	public String getRse_Content() {
		return rse_Content;
	}

	public void setRse_Content(String rse_Content) {
		this.rse_Content = rse_Content;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getRse_UserTitle() {
		return rse_UserTitle;
	}

	public void setRse_UserTitle(String rse_UserTitle) {
		this.rse_UserTitle = rse_UserTitle;
	}
    
}
