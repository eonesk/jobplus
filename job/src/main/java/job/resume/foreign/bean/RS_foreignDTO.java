package job.resume.foreign.bean;

import java.util.Date;

public class RS_foreignDTO {

    // 해외경험seq 
    private Integer rsfSeq;

    // 국가명 
    private String rsfName;

    // 시작년월 
    private Date rsfStartdate;

    // 종료년월 
    private Date rsfEnddate;

    // 해외경험내용 
    private String rsfContent;

    // 회원 아이디 
    private String mId;

    public Integer getRsfSeq() {
        return rsfSeq;
    }

    public void setRsfSeq(Integer rsfSeq) {
        this.rsfSeq = rsfSeq;
    }

    public String getRsfName() {
        return rsfName;
    }

    public void setRsfName(String rsfName) {
        this.rsfName = rsfName;
    }

    public Date getRsfStartdate() {
        return rsfStartdate;
    }

    public void setRsfStartdate(Date rsfStartdate) {
        this.rsfStartdate = rsfStartdate;
    }

    public Date getRsfEnddate() {
        return rsfEnddate;
    }

    public void setRsfEnddate(Date rsfEnddate) {
        this.rsfEnddate = rsfEnddate;
    }

    public String getRsfContent() {
        return rsfContent;
    }

    public void setRsfContent(String rsfContent) {
        this.rsfContent = rsfContent;
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

}
