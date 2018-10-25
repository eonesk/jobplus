package job.resume.workLV.bean;

import java.util.Date;

public class RS_workLVDTO {

    // 경력seq 
    private Integer rswSeq;

    // 회사명 
    private String rswCompany;

    // 부서명 
    private String rswDept;

    // 입사년월 
    private Date rswStartdate;

    // 퇴사년월 
    private Date rswEnddate;

    // 재직여부 
    private String rswIsnow;

    // 직급 
    private String rswPosition;

    // 직무 
    private String rswJob;

    // 연봉 
    private String rswPay;

    // 담당업무 
    private String rswPart;

    // 경력기술서 
    private String rswCareer;

    // 회원 아이디 
    private String mId;    

    // 사용자 설정 이름
    private String rswUserTitle;

    public Integer getRswSeq() {
        return rswSeq;
    }

    public void setRswSeq(Integer rswSeq) {
        this.rswSeq = rswSeq;
    }

    public String getRswCompany() {
        return rswCompany;
    }

    public void setRswCompany(String rswCompany) {
        this.rswCompany = rswCompany;
    }

    public String getRswDept() {
        return rswDept;
    }

    public void setRswDept(String rswDept) {
        this.rswDept = rswDept;
    }

    public Date getRswStartdate() {
        return rswStartdate;
    }

    public void setRswStartdate(Date rswStartdate) {
        this.rswStartdate = rswStartdate;
    }

    public Date getRswEnddate() {
        return rswEnddate;
    }

    public void setRswEnddate(Date rswEnddate) {
        this.rswEnddate = rswEnddate;
    }

    public String getRswIsnow() {
        return rswIsnow;
    }

    public void setRswIsnow(String rswIsnow) {
        this.rswIsnow = rswIsnow;
    }

    public String getRswPosition() {
        return rswPosition;
    }

    public void setRswPosition(String rswPosition) {
        this.rswPosition = rswPosition;
    }

    public String getRswJob() {
        return rswJob;
    }

    public void setRswJob(String rswJob) {
        this.rswJob = rswJob;
    }

    public String getRswPay() {
        return rswPay;
    }

    public void setRswPay(String rswPay) {
        this.rswPay = rswPay;
    }

    public String getRswPart() {
        return rswPart;
    }

    public void setRswPart(String rswPart) {
        this.rswPart = rswPart;
    }

    public String getRswCareer() {
        return rswCareer;
    }

    public void setRswCareer(String rswCareer) {
        this.rswCareer = rswCareer;
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

	public String getRswUserTitle() {
		return rswUserTitle;
	}

	public void setRswUserTitle(String rswUserTitle) {
		this.rswUserTitle = rswUserTitle;
	}

}
