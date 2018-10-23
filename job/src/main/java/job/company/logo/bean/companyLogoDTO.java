package job.company.logo.bean;

public class companyLogoDTO {

    // 기업로고seq 
    private Integer cplSeq;

    // 기업로고이미지 
    private String cplName;

    // 기업정보seq 
    private String cpiSeq;

    public Integer getCplSeq() {
        return cplSeq;
    }

    public void setCplSeq(Integer cplSeq) {
        this.cplSeq = cplSeq;
    }

    public String getCplName() {
        return cplName;
    }

    public void setCplName(String cplName) {
        this.cplName = cplName;
    }

    public String getCpiSeq() {
        return cpiSeq;
    }

    public void setCpiSeq(String cpiSeq) {
        this.cpiSeq = cpiSeq;
    }

}
