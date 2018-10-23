package job.resume.portfolio.bean;

public class RS_portfolioDTO {

    // 포트폴리오seq 
    private Integer rspfSeq;

    // 포트폴리오 URL 
    private String rspfUrl;

    // 포트폴리오 파일 
    private String rspfFile;

    // 회원 아이디 
    private String mId;

    public Integer getRspfSeq() {
        return rspfSeq;
    }

    public void setRspfSeq(Integer rspfSeq) {
        this.rspfSeq = rspfSeq;
    }

    public String getRspfUrl() {
        return rspfUrl;
    }

    public void setRspfUrl(String rspfUrl) {
        this.rspfUrl = rspfUrl;
    }

    public String getRspfFile() {
        return rspfFile;
    }

    public void setRspfFile(String rspfFile) {
        this.rspfFile = rspfFile;
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

}
