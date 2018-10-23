package job.resume.license.bean;

public class RS_licenseDTO {

    // 자격증seq 
    private Integer rslsSeq;

    // 자격증 이름 
    private String rslsName;

    // 발행처 
    private String rslsCompany;

    // 취득년월 
    private String rslsDate;

    // 회원 아이디 
    private String mId;

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

    public String getRslsDate() {
        return rslsDate;
    }

    public void setRslsDate(String rslsDate) {
        this.rslsDate = rslsDate;
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

}
