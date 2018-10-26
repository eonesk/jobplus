package job.resume.intern.bean;

import java.util.Date;

public class RS_internDTO {
    // 인턴,대외활동seq 
    private Integer rsit_Seq;
    // 활동구분 
    private String rsit_Type;
    // 회사 
    private String rsit_Company;
    // 시작년월 
    private Date rsit_Startdate;
    // 종료년월 
    private Date rsit_Enddate;
    // 활동내용 
    private String rsit_Content;
    // 회원 아이디 
    private String m_Id;
    // 사용자정의 아이디
    private String rsit_UserTitle;
    
	public Integer getRsit_Seq() {
		return rsit_Seq;
	}
	public void setRsit_Seq(Integer rsit_Seq) {
		this.rsit_Seq = rsit_Seq;
	}
	public String getRsit_Type() {
		return rsit_Type;
	}
	public void setRsit_Type(String rsit_Type) {
		this.rsit_Type = rsit_Type;
	}
	public String getRsit_Company() {
		return rsit_Company;
	}
	public void setRsit_Company(String rsit_Company) {
		this.rsit_Company = rsit_Company;
	}
	public Date getRsit_Startdate() {
		return rsit_Startdate;
	}
	public void setRsit_Startdate(Date rsit_Startdate) {
		this.rsit_Startdate = rsit_Startdate;
	}
	public Date getRsit_Enddate() {
		return rsit_Enddate;
	}
	public void setRsit_Enddate(Date rsit_Enddate) {
		this.rsit_Enddate = rsit_Enddate;
	}
	public String getRsit_Content() {
		return rsit_Content;
	}
	public void setRsit_Content(String rsit_Content) {
		this.rsit_Content = rsit_Content;
	}
	public String getM_Id() {
		return m_Id;
	}
	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}
	public String getRsit_UserTitle() {
		return rsit_UserTitle;
	}
	public void setRsit_UserTitle(String rsit_UserTitle) {
		this.rsit_UserTitle = rsit_UserTitle;
	}	
    
    
}
