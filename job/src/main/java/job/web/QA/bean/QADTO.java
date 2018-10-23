package job.web.QA.bean;

import java.util.Date;

public class QADTO {

    // QA게시판seq 
    private Integer qaSeq;

    // 분류 
    private String qaType;

    // 글제목 
    private String qaTitle;

    // 글내용 
    private String qaContent;

    // 아이디 
    private String mId;

    // 등록시간 
    private Date qaLogtime;

    // 조회수 
    private Integer qaHit;

    public Integer getQaSeq() {
        return qaSeq;
    }

    public void setQaSeq(Integer qaSeq) {
        this.qaSeq = qaSeq;
    }

    public String getQaType() {
        return qaType;
    }

    public void setQaType(String qaType) {
        this.qaType = qaType;
    }

    public String getQaTitle() {
        return qaTitle;
    }

    public void setQaTitle(String qaTitle) {
        this.qaTitle = qaTitle;
    }

    public String getQaContent() {
        return qaContent;
    }

    public void setQaContent(String qaContent) {
        this.qaContent = qaContent;
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

    public Date getQaLogtime() {
        return qaLogtime;
    }

    public void setQaLogtime(Date qaLogtime) {
        this.qaLogtime = qaLogtime;
    }

    public Integer getQaHit() {
        return qaHit;
    }

    public void setQaHit(Integer qaHit) {
        this.qaHit = qaHit;
    }

}
