package job.recruitment.mainSearch.bean;

import java.util.Date;

public class MainSearchDTO {
	
	// 채용공고 seq - RM
	private int rm_seq;
	
	// 기업아이디 - RM
	private String cpm_id;
	
	// 기업이름 - CompanyInfo
	private String cpi_companyName;
	
	// 채용공고 제목 - RM
	private String rm_title;
	
	// 경력여부 - RM_job
	private String rmj_career;
	
	// 학력조건  - RM_apply
	private String rma_studyLV;
	
	// 고용형태 - RM_job
	private String rmj_type;
	
	// 접수종료일 - RM_time
	private String rmt_endDate;

	@Override
	public String toString() {
		return "MainSearchDTO [rm_seq=" + rm_seq + ", cpm_id=" + cpm_id + ", cpi_companyName=" + cpi_companyName
				+ ", rm_title=" + rm_title + ", rmj_career=" + rmj_career + ", rma_studyLV=" + rma_studyLV
				+ ", rmj_type=" + rmj_type + ", rmt_endDate=" + rmt_endDate + "]";
	}

	public int getRm_seq() {
		return rm_seq;
	}

	public void setRm_seq(int rm_seq) {
		this.rm_seq = rm_seq;
	}

	public String getCpm_id() {
		return cpm_id;
	}

	public void setCpm_id(String cpm_id) {
		this.cpm_id = cpm_id;
	}

	public String getRm_title() {
		return rm_title;
	}

	public void setRm_title(String rm_title) {
		this.rm_title = rm_title;
	}

	public String getRmj_career() {
		return rmj_career;
	}

	public void setRmj_career(String rmj_career) {
		this.rmj_career = rmj_career;
	}

	public String getRma_studyLV() {
		return rma_studyLV;
	}

	public void setRma_studyLV(String rma_studyLV) {
		this.rma_studyLV = rma_studyLV;
	}

	public String getRmj_type() {
		return rmj_type;
	}

	public void setRmj_type(String rmj_type) {
		this.rmj_type = rmj_type;
	}

	public String getRmt_endDate() {
		return rmt_endDate;
	}

	public void setRmt_endDate(String rmt_endDate) {
		this.rmt_endDate = rmt_endDate;
	}

	public String getCpi_companyName() {
		return cpi_companyName;
	}

	public void setCpi_companyName(String cpi_companyName) {
		this.cpi_companyName = cpi_companyName;
	}
	
	
}
