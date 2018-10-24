package job.resume.edu.bean;

import java.util.Date;

public class RS_eduDTO {
int a=1;
    // 교육 이수seq 
    private Integer rseSeq;

    // 교육명 
    private String rseName;

    // 교육기관 
    private String rseCompany;

    // 시작년월 
    private Date rseStartdate;

    // 종료년월 
    private Date rseEnddate;

    // 교육내용 
    private String rseContent;

    // 회원 아이디 
    private String mId;

    public Integer getRseSeq() {
        return rseSeq;
    }

    public void setRseSeq(Integer rseSeq) {
        this.rseSeq = rseSeq;
    }

    public String getRseName() {
        return rseName;
    }

    public void setRseName(String rseName) {
        this.rseName = rseName;
    }

    public String getRseCompany() {
        return rseCompany;
    }

    public void setRseCompany(String rseCompany) {
        this.rseCompany = rseCompany;
    }

    public Date getRseStartdate() {
        return rseStartdate;
    }

    public void setRseStartdate(Date rseStartdate) {
        this.rseStartdate = rseStartdate;
    }

    public Date getRseEnddate() {
        return rseEnddate;
    }

    public void setRseEnddate(Date rseEnddate) {
        this.rseEnddate = rseEnddate;
    }

    public String getRseContent() {
        return rseContent;
    }

    public void setRseContent(String rseContent) {
        this.rseContent = rseContent;
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

}
