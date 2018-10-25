package job.resume.license.bean;

import java.util.Date;

public class RS_licenseDTO {

    // 자격증seq 
    private Integer rslsSeq;

    // 자격증 이름 
    private String rslsName;

    // 발행처 
    private String rslsCompany;

    // 취득년월 
    private Date rslsDate;

    // 회원 아이디 
    private String mId;

    // 사용자 설정 이름
    private String rslsUserTitle;

    public Integer getRslsSeq() {
        return rslsSeq;
    }

    public void setRslsSeq(Integer rslsSeq) {
        this.rslsSeq = rslsSeq;
    }

    public String getRslsName() {
        return rslsName;
    }

    public void setRslsName(String rslsName) {
        this.rslsName = rslsName;
    }

    public String getRslsCompany() {
        return rslsCompany;
    }

    public void setRslsCompany(String rslsCompany) {
        this.rslsCompany = rslsCompany;
    }

    public Date getRslsDate() {
        return rslsDate;
    }

    public void setRslsDate(Date rslsDate) {
        this.rslsDate = rslsDate;
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

	public String getRslsUserTitle() {
		return rslsUserTitle;
	}

	public void setRslsUserTitle(String rslsUserTitle) {
		this.rslsUserTitle = rslsUserTitle;
	}

}
