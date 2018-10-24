package job.resume.intern.bean;

import java.util.Date;

public class RS_internDTO {
    // 인턴,대외활동seq 
    private Integer rsitSeq;
    // 활동구분 
    private String rsitType;
    // 회사 
    private String rsitCompany;
    // 시작년월 
    private Date rsitStartdate;
    // 종료년월 
    private Date rsitEnddate;
    // 활동내용 
    private String rsitContent;
    // 회원 아이디 
    private String mId;
    // 사용자정의 아이디
    private String userTitle;

    public Integer getRsitSeq() {
        return rsitSeq;
    }

    public void setRsitSeq(Integer rsitSeq) {
        this.rsitSeq = rsitSeq;
    }

    public String getRsitType() {
        return rsitType;
    }

    public void setRsitType(String rsitType) {
        this.rsitType = rsitType;
    }

    public String getRsitCompany() {
        return rsitCompany;
    }

    public void setRsitCompany(String rsitCompany) {
        this.rsitCompany = rsitCompany;
    }

    public Date getRsitStartdate() {
        return rsitStartdate;
    }

    public void setRsitStartdate(Date rsitStartdate) {
        this.rsitStartdate = rsitStartdate;
    }

    public Date getRsitEnddate() {
        return rsitEnddate;
    }

    public void setRsitEnddate(Date rsitEnddate) {
        this.rsitEnddate = rsitEnddate;
    }

    public String getRsitContent() {
        return rsitContent;
    }

    public void setRsitContent(String rsitContent) {
        this.rsitContent = rsitContent;
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

	public String getUserTitle() {
		return userTitle;
	}

	public void setUserTitle(String userTitle) {
		this.userTitle = userTitle;
	}
    
}
