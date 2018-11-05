package job.resume.vip.bean;

import java.util.Date;

public class RS_vipDTO {

    // 취업우대seq 
    private Integer rsv_seq;

    // 보훈대상 여부 
    private String rsv_isMedal;

    // 취업보호대상 여부 
    private String rsv_isProtect;

    // 고용지원금대상 여부 
    private String rsv_isMoney;

    // 장애 여부 
    private String rsv_isDisable;

    // 병역 
    private String rsv_military;

    // 입대일 
    private Date rsv_startDate;

    // 제대일 
    private Date rsv_endDate;

    // 군별, 제대 계급 
    private String rsv_position;

    // 회원 아이디 
    private String m_id;

	private String rsv_userTitle;
   
	public Integer getRsv_seq() {
		return rsv_seq;
	}

	public void setRsv_seq(Integer rsv_seq) {
		this.rsv_seq = rsv_seq;
	}

	public String getRsv_isMedal() {
		return rsv_isMedal;
	}

	public void setRsv_isMedal(String rsv_isMedal) {
		this.rsv_isMedal = rsv_isMedal;
	}

	public String getRsv_isProtect() {
		return rsv_isProtect;
	}

	public void setRsv_isProtect(String rsv_isProtect) {
		this.rsv_isProtect = rsv_isProtect;
	}

	public String getRsv_isMoney() {
		return rsv_isMoney;
	}

	public void setRsv_isMoney(String rsv_isMoney) {
		this.rsv_isMoney = rsv_isMoney;
	}

	public String getRsv_isDisable() {
		return rsv_isDisable;
	}

	public void setRsv_isDisable(String rsv_isDisable) {
		this.rsv_isDisable = rsv_isDisable;
	}

	public String getRsv_military() {
		return rsv_military;
	}

	public void setRsv_military(String rsv_military) {
		this.rsv_military = rsv_military;
	}

	public Date getRsv_startDate() {
		return rsv_startDate;
	}

	public void setRsv_startDate(Date rsv_startDate) {
		this.rsv_startDate = rsv_startDate;
	}

	public Date getRsv_endDate() {
		return rsv_endDate;
	}

	public void setRsv_endDate(Date rsv_endDate) {
		this.rsv_endDate = rsv_endDate;
	}

	public String getRsv_position() {
		return rsv_position;
	}

	public void setRsv_position(String rsv_position) {
		this.rsv_position = rsv_position;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getRsv_userTitle() {
		return rsv_userTitle;
	}

	public void setRsv_userTitle(String rsv_userTitle) {
		this.rsv_userTitle = rsv_userTitle;
	}

    

}
