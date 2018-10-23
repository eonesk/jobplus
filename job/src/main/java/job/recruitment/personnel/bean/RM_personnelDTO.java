package job.recruitment.personnel.bean;

public class RM_personnelDTO {

    // 담당자정보seq 
    private Integer rmpSeq;

    // 기업아이디 
    private String comId;

    // 이름 
    private String rmpName;

    // 부서 
    private String rmpDept;

    // 이메일 
    private String rmpEmail;

    // 전화번호1 
    private String rmpPhone1;

    // 전화번호2 
    private String rmpPhone2;

    public Integer getRmpSeq() {
        return rmpSeq;
    }

    public void setRmpSeq(Integer rmpSeq) {
        this.rmpSeq = rmpSeq;
    }

    public String getComId() {
        return comId;
    }

    public void setComId(String comId) {
        this.comId = comId;
    }

    public String getRmpName() {
        return rmpName;
    }

    public void setRmpName(String rmpName) {
        this.rmpName = rmpName;
    }

    public String getRmpDept() {
        return rmpDept;
    }

    public void setRmpDept(String rmpDept) {
        this.rmpDept = rmpDept;
    }

    public String getRmpEmail() {
        return rmpEmail;
    }

    public void setRmpEmail(String rmpEmail) {
        this.rmpEmail = rmpEmail;
    }

    public String getRmpPhone1() {
        return rmpPhone1;
    }

    public void setRmpPhone1(String rmpPhone1) {
        this.rmpPhone1 = rmpPhone1;
    }

    public String getRmpPhone2() {
        return rmpPhone2;
    }

    public void setRmpPhone2(String rmpPhone2) {
        this.rmpPhone2 = rmpPhone2;
    }

}
