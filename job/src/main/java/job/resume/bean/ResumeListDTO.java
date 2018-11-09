package job.resume.bean;

import java.util.Date;

public class ResumeListDTO {
	
	// 이력서 seq
	private Integer rs_Seq;
	
	// 이력서 제목
	private String rs_Title;

	// 이력서 수정날짜 
	private Date rs_Logdate;

	public Integer getRs_Seq() {
		return rs_Seq;
	}

	public void setRs_Seq(Integer rs_Seq) {
		this.rs_Seq = rs_Seq;
	}
	
	public String getRs_Title() {
		return rs_Title;
	}

	public void setRs_Title(String rs_Title) {
		this.rs_Title = rs_Title;
	}

	public Date getRs_Logdate() {
		return rs_Logdate;
	}

	public void setRs_Logdate(Date rs_Logdate) {
		this.rs_Logdate = rs_Logdate;
	}
	
	
}
