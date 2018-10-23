package job.recruitment.condition.bean;

public class RM_conditionDTO {

    // 채용공고seq 
    private Integer rmSeq;

    // 급여 
    private String rmcSalary;

    // 업종1(대분류) 
    private String rmcBusiness1;

    // 업종2(중분류) 
    private String rmcBusiness2;

    // 업종3(소분류) 
    private String rmcBusiness3;

    // 근무지역 
    private String rmcWorkspace;

    // 근무요일 
    private String rmcWeek;

    // 근무시간 
    private String rmcTime;

    public Integer getRmSeq() {
        return rmSeq;
    }

    public void setRmSeq(Integer rmSeq) {
        this.rmSeq = rmSeq;
    }

    public String getRmcSalary() {
        return rmcSalary;
    }

    public void setRmcSalary(String rmcSalary) {
        this.rmcSalary = rmcSalary;
    }

    public String getRmcBusiness1() {
        return rmcBusiness1;
    }

    public void setRmcBusiness1(String rmcBusiness1) {
        this.rmcBusiness1 = rmcBusiness1;
    }

    public String getRmcBusiness2() {
        return rmcBusiness2;
    }

    public void setRmcBusiness2(String rmcBusiness2) {
        this.rmcBusiness2 = rmcBusiness2;
    }

    public String getRmcBusiness3() {
        return rmcBusiness3;
    }

    public void setRmcBusiness3(String rmcBusiness3) {
        this.rmcBusiness3 = rmcBusiness3;
    }

    public String getRmcWorkspace() {
        return rmcWorkspace;
    }

    public void setRmcWorkspace(String rmcWorkspace) {
        this.rmcWorkspace = rmcWorkspace;
    }

    public String getRmcWeek() {
        return rmcWeek;
    }

    public void setRmcWeek(String rmcWeek) {
        this.rmcWeek = rmcWeek;
    }

    public String getRmcTime() {
        return rmcTime;
    }

    public void setRmcTime(String rmcTime) {
        this.rmcTime = rmcTime;
    }

}
