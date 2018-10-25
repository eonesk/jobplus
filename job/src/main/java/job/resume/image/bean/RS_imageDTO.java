package job.resume.image.bean;

public class RS_imageDTO {

    // 증명사진 seq 
    private Integer rsimSeq;

    // 이력서 이미지 
    private String rsimName;

    // 회원 아이디 
    private String mId;
    
    // 사용자 설정 이름 
    private String rsimUsertitle;

    public Integer getRsimSeq() {
        return rsimSeq;
    }

    public void setRsimSeq(Integer rsimSeq) {
        this.rsimSeq = rsimSeq;
    }

    public String getRsimName() {
        return rsimName;
    }

    public void setRsimName(String rsimName) {
        this.rsimName = rsimName;
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }
    
    public String getRsimUsertitle() {
        return rsimUsertitle;
    }

    public void setRsimUsertitle(String rsimUsertitle) {
        this.rsimUsertitle = rsimUsertitle;
    }
}
