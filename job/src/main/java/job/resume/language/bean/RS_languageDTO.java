package job.resume.language.bean;

public class RS_languageDTO {

    // 어학seq 
    private Integer rslgSeq;

    // 어학 구분 
    private String rslgCategory;

    // 외국어명 
    private String rslgName;

    // 어학 수준 
    private String rslgLv;

    // 회원 아이디 
    private String mId;

    public Integer getRslgSeq() {
        return rslgSeq;
    }

    public void setRslgSeq(Integer rslgSeq) {
        this.rslgSeq = rslgSeq;
    }

    public String getRslgCategory() {
        return rslgCategory;
    }

    public void setRslgCategory(String rslgCategory) {
        this.rslgCategory = rslgCategory;
    }

    public String getRslgName() {
        return rslgName;
    }

    public void setRslgName(String rslgName) {
        this.rslgName = rslgName;
    }

    public String getRslgLv() {
        return rslgLv;
    }

    public void setRslgLv(String rslgLv) {
        this.rslgLv = rslgLv;
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

}
