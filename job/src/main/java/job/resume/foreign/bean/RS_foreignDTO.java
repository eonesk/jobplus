package job.resume.foreign.bean;

public class RS_foreignDTO {

    // 해외경험seq 
    private Integer rsfSeq;

    // 국가명 
    private String rsfName;

    // 시작년월 
    private String rsfStartdate;

    // 종료년월 
    private String rsfEnddate;

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

    public String getRsfStartdate() {
        return rsfStartdate;
    }

    public void setRsfStartdate(String rsfStartdate) {
        this.rsfStartdate = rsfStartdate;
    }

    public String getRsfEnddate() {
        return rsfEnddate;
    }

    public void setRsfEnddate(String rsfEnddate) {
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
