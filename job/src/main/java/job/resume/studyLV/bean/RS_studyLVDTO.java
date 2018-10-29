package job.resume.studyLV.bean;

import java.util.Date;

public class RS_studyLVDTO {

    // 학력seq 
    private Integer rss_Seq;

    // 학교구분 
    private String rss_Type;

    // 학교명 
    private String rss_Name;

    // 입학년월 
    private Date rss_Startdate;

    // 졸업년월 
    private Date rss_Enddate;

    // 고졸여부 
    private String rss_Ishighschool;

    // 전공명 
    private String rss_Major;

    // 학점 
    private Integer rss_Score;

    // 총점 
    private Integer rss_Totscore;

    // 회원 아이디 
    private String m_Id;
    
    // 사용자 설정 이름
    private String rss_UserTitle;

	@Override
	public String toString() {
		return "RS_studyLVDTO [rss_Seq=" + rss_Seq + ", rss_Type=" + rss_Type + ", rss_Name=" + rss_Name
				+ ", rss_Startdate=" + rss_Startdate + ", rss_Enddate=" + rss_Enddate + ", rss_Ishighschool="
				+ rss_Ishighschool + ", rss_Major=" + rss_Major + ", rss_Score=" + rss_Score + ", rss_Totscore="
				+ rss_Totscore + ", m_Id=" + m_Id + ", rss_UserTitle=" + rss_UserTitle + "]";
	}

	public Integer getRss_Seq() {
		return rss_Seq;
	}

	public void setRss_Seq(Integer rss_Seq) {
		this.rss_Seq = rss_Seq;
	}

	public String getRss_Type() {
		return rss_Type;
	}

	public void setRss_Type(String rss_Type) {
		this.rss_Type = rss_Type;
	}

	public String getRss_Name() {
		return rss_Name;
	}

	public void setRss_Name(String rss_Name) {
		this.rss_Name = rss_Name;
	}

	public Date getRss_Startdate() {
		return rss_Startdate;
	}

	public void setRss_Startdate(Date rss_Startdate) {
		this.rss_Startdate = rss_Startdate;
	}

	public Date getRss_Enddate() {
		return rss_Enddate;
	}

	public void setRss_Enddate(Date rss_Enddate) {
		this.rss_Enddate = rss_Enddate;
	}

	public String getRss_Ishighschool() {
		return rss_Ishighschool;
	}

	public void setRss_Ishighschool(String rss_Ishighschool) {
		this.rss_Ishighschool = rss_Ishighschool;
	}

	public String getRss_Major() {
		return rss_Major;
	}

	public void setRss_Major(String rss_Major) {
		this.rss_Major = rss_Major;
	}

	public Integer getRss_Score() {
		return rss_Score;
	}

	public void setRss_Score(Integer rss_Score) {
		this.rss_Score = rss_Score;
	}

	public Integer getRss_Totscore() {
		return rss_Totscore;
	}

	public void setRss_Totscore(Integer rss_Totscore) {
		this.rss_Totscore = rss_Totscore;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getRss_UserTitle() {
		return rss_UserTitle;
	}

	public void setRss_UserTitle(String rss_UserTitle) {
		this.rss_UserTitle = rss_UserTitle;
	}
}
