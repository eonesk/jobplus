package job.resume.pr.bean;

public class RS_prDTO {

    // 자기소개서seq 
    private Integer rsprSeq;

    // 제목 
    private String rsprTitle;

    // 내용 
    private String rsprContent;

    // 회원 아이디 
    private String mId;

    public Integer getRsprSeq() {
        return rsprSeq;
    }

    public void setRsprSeq(Integer rsprSeq) {
        this.rsprSeq = rsprSeq;
    }

    public String getRsprTitle() {
        return rsprTitle;
    }

    public void setRsprTitle(String rsprTitle) {
        this.rsprTitle = rsprTitle;
    }

    public String getRsprContent() {
        return rsprContent;
    }

    public void setRsprContent(String rsprContent) {
        this.rsprContent = rsprContent;
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

}
