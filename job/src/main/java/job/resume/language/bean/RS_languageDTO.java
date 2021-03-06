package job.resume.language.bean;

import java.util.Date;

public class RS_languageDTO {
    // 어학seq 
    private Integer rslg_Seq;
    // 어학 구분 
    private String rslg_Category;
    // 외국어명 
    private String rslg_Name;
    // 어학 수준 
    private String rslg_Lv;
    // 회원 아이디 
    private String m_Id;
    // 사용자 설정 이름
    private String RSLG_UserTitle;
    // 어학 점수
    private String rslg_Score;
    // 취득년월
    private Date rslg_Date;
    // 공인시험
    private String rslg_Test;
    
	@Override
	public String toString() {
		return "RS_languageDTO [rslg_Seq=" + rslg_Seq + ", rslg_Category=" + rslg_Category + ", rslg_Name=" + rslg_Name
				+ ", rslg_Lv=" + rslg_Lv + ", m_Id=" + m_Id + ", RSLG_UserTitle=" + RSLG_UserTitle + ", rslg_Score="
				+ rslg_Score + ", rslg_Date=" + rslg_Date + ", rslg_Test=" + rslg_Test + "]";
	}
	public Integer getRslg_Seq() {
		return rslg_Seq;
	}
	public void setRslg_Seq(Integer rslg_Seq) {
		this.rslg_Seq = rslg_Seq;
	}
	public String getRslg_Category() {
		return rslg_Category;
	}
	public void setRslg_Category(String rslg_Category) {
		this.rslg_Category = rslg_Category;
	}
	public String getRslg_Name() {
		return rslg_Name;
	}
	public void setRslg_Name(String rslg_Name) {
		this.rslg_Name = rslg_Name;
	}
	public String getRslg_Lv() {
		return rslg_Lv;
	}
	public void setRslg_Lv(String rslg_Lv) {
		this.rslg_Lv = rslg_Lv;
	}
	public String getM_Id() {
		return m_Id;
	}
	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}
	public String getRSLG_UserTitle() {
		return RSLG_UserTitle;
	}
	public void setRSLG_UserTitle(String rSLG_UserTitle) {
		RSLG_UserTitle = rSLG_UserTitle;
	}
	public String getRslg_Score() {
		return rslg_Score;
	}
	public void setRslg_Score(String rslg_Score) {
		this.rslg_Score = rslg_Score;
	}
	public Date getRslg_Date() {
		return rslg_Date;
	}
	public void setRslg_Date(Date rslg_Date) {
		this.rslg_Date = rslg_Date;
	}
	public String getRslg_Test() {
		return rslg_Test;
	}
	public void setRslg_Test(String rslg_Test) {
		this.rslg_Test = rslg_Test;
	}
    
    
	
    
}
