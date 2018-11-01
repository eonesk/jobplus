package job.resume.trophy.bean;

import java.util.Date;

public class RS_trophyDTO {
    // 수상seq 
    private Integer rst_Seq;
    // 수상명 
    private String rst_Name;
    // 수여기관 
    private String rst_Company;
    // 수상연도 
    private Date rst_Date;
    // 수여내용 
    private String rst_Content;
    // 회원 아이디 
    private String m_Id;
    // 사용자정의 아이디
    private String RST_UserTitle;
    
	public Integer getRst_Seq() {
		return rst_Seq;
	}
	public void setRst_Seq(Integer rst_Seq) {
		this.rst_Seq = rst_Seq;
	}
	public String getRst_Name() {
		return rst_Name;
	}
	public void setRst_Name(String rst_Name) {
		this.rst_Name = rst_Name;
	}
	public String getRst_Company() {
		return rst_Company;
	}
	public void setRst_Company(String rst_Company) {
		this.rst_Company = rst_Company;
	}
	public Date getRst_Date() {
		return rst_Date;
	}
	public void setRst_Date(Date rst_Date) {
		this.rst_Date = rst_Date;
	}
	public String getRst_Content() {
		return rst_Content;
	}
	public void setRst_Content(String rst_Content) {
		this.rst_Content = rst_Content;
	}
	public String getM_Id() {
		return m_Id;
	}
	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}
	public String getRST_UserTitle() {
		return RST_UserTitle;
	}
	public void setRST_UserTitle(String rST_UserTitle) {
		RST_UserTitle = rST_UserTitle;
	}
	

}
