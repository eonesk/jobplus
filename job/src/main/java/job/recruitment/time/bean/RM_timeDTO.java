package job.recruitment.time.bean;

import java.util.Date;

public class RM_timeDTO {
	 // 채용공고 접수기간seq 
    private Integer rmt_Seq;

    // 접수시작일 
    private Date rmt_Startdate;

    // 접수종료일 
    private Date rmt_Enddate;

    // 접수방법 
    private String rmt_How;

    // 접수양식 
    private String rmt_Form;

	public Integer getRmt_Seq() {
		return rmt_Seq;
	}

	public void setRmt_Seq(Integer rmt_Seq) {
		this.rmt_Seq = rmt_Seq;
	}

	public Date getRmt_Startdate() {
		return rmt_Startdate;
	}

	public void setRmt_Startdate(Date rmt_Startdate) {
		this.rmt_Startdate = rmt_Startdate;
	}

	public Date getRmt_Enddate() {
		return rmt_Enddate;
	}

	public void setRmt_Enddate(Date rmt_Enddate) {
		this.rmt_Enddate = rmt_Enddate;
	}

	public String getRmt_How() {
		return rmt_How;
	}

	public void setRmt_How(String rmt_How) {
		this.rmt_How = rmt_How;
	}

	public String getRmt_Form() {
		return rmt_Form;
	}

	public void setRmt_Form(String rmt_Form) {
		this.rmt_Form = rmt_Form;
	}
    
    
}
