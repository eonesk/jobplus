package job.resume.studyLV.bean;

import java.util.Date;

public class RS_studyLVDTO {

    // 학력seq 
    private Integer rssSeq;

    // 학교구분 
    private String rssType;

    // 학교명 
    private String rssName;

    // 입학년월 
    private Date rssStartdate;

    // 졸업년월 
    private Date rssEnddate;

    // 고졸여부 
    private String rssIshighschool;

    // 전공명 
    private String rssMajor;

    // 학점 
    private Integer rssScore;

    // 총점 
    private Integer rssTotscore;

    // 회원 아이디 
    private String mId;

    public Integer getRssSeq() {
        return rssSeq;
    }

    public void setRssSeq(Integer rssSeq) {
        this.rssSeq = rssSeq;
    }

    public String getRssType() {
        return rssType;
    }

    public void setRssType(String rssType) {
        this.rssType = rssType;
    }

    public String getRssName() {
        return rssName;
    }

    public void setRssName(String rssName) {
        this.rssName = rssName;
    }

    public Date getRssStartdate() {
        return rssStartdate;
    }

    public void setRssStartdate(Date rssStartdate) {
        this.rssStartdate = rssStartdate;
    }

    public Date getRssEnddate() {
        return rssEnddate;
    }

    public void setRssEnddate(Date rssEnddate) {
        this.rssEnddate = rssEnddate;
    }

    public String getRssIshighschool() {
        return rssIshighschool;
    }

    public void setRssIshighschool(String rssIshighschool) {
        this.rssIshighschool = rssIshighschool;
    }

    public String getRssMajor() {
        return rssMajor;
    }

    public void setRssMajor(String rssMajor) {
        this.rssMajor = rssMajor;
    }

    public Integer getRssScore() {
        return rssScore;
    }

    public void setRssScore(Integer rssScore) {
        this.rssScore = rssScore;
    }

    public Integer getRssTotscore() {
        return rssTotscore;
    }

    public void setRssTotscore(Integer rssTotscore) {
        this.rssTotscore = rssTotscore;
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

}
