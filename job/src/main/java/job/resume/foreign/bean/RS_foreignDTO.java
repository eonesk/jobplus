package job.resume.foreign.bean;

import java.util.Date;

public class RS_foreignDTO {

    // 해외경험seq 
    private Integer rsf_Seq;

    // 국가명 
    private String rsf_Name;

    // 시작년월 
    private Date rsf_Startdate;

    // 종료년월 
    private Date rsf_Enddate;

    // 해외경험내용 
    private String rsf_Content;

    // 회원 아이디 
    private String m_Id;

	// 사용자 설정 이름 
    private String rsf_Usertitle;

	public Integer getRsf_Seq() {
		return rsf_Seq;
	}

	public void setRsf_Seq(Integer rsf_Seq) {
		this.rsf_Seq = rsf_Seq;
	}

	public String getRsf_Name() {
		return rsf_Name;
	}

	public void setRsf_Name(String rsf_Name) {
		this.rsf_Name = rsf_Name;
	}

	public Date getRsf_Startdate() {
		return rsf_Startdate;
	}

	public void setRsf_Startdate(Date rsf_Startdate) {
		this.rsf_Startdate = rsf_Startdate;
	}

	public Date getRsf_Enddate() {
		return rsf_Enddate;
	}

	public void setRsf_Enddate(Date rsf_Enddate) {
		this.rsf_Enddate = rsf_Enddate;
	}

	public String getRsf_Content() {
		return rsf_Content;
	}

	public void setRsf_Content(String rsf_Content) {
		this.rsf_Content = rsf_Content;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getRsf_Usertitle() {
		return rsf_Usertitle;
	}

	public void setRsf_Usertitle(String rsf_Usertitle) {
		this.rsf_Usertitle = rsf_Usertitle;
	}

}
