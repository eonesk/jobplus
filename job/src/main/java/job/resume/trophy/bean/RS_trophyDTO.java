package job.resume.trophy.bean;

public class RS_trophyDTO {

    // 수상seq 
    private Integer rstSeq;

    // 수상명 
    private String rstName;

    // 수여기관 
    private String rstCompany;

    // 수상연도 
    private String rstDate;

    // 수여내용 
    private String rstContent;

    // 회원 아이디 
    private String mId;

    public Integer getRstSeq() {
        return rstSeq;
    }

    public void setRstSeq(Integer rstSeq) {
        this.rstSeq = rstSeq;
    }

    public String getRstName() {
        return rstName;
    }

    public void setRstName(String rstName) {
        this.rstName = rstName;
    }

    public String getRstCompany() {
        return rstCompany;
    }

    public void setRstCompany(String rstCompany) {
        this.rstCompany = rstCompany;
    }

    public String getRstDate() {
        return rstDate;
    }

    public void setRstDate(String rstDate) {
        this.rstDate = rstDate;
    }

    public String getRstContent() {
        return rstContent;
    }

    public void setRstContent(String rstContent) {
        this.rstContent = rstContent;
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

}
