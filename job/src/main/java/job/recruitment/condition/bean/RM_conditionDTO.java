package job.recruitment.condition.bean;

public class RM_conditionDTO {

    // 채용공고seq 
    private Integer rm_Seq;

    // 급여 
    private String rmc_Salary;

    // 업종1(대분류) 
    private String rmc_Business1;

    // 업종2(중분류) 
    private String rmc_Business2;

    // 업종3(소분류) 
    private String rmc_Business3;

    // 근무지역 
    private String rmc_Workspace;

    // 근무요일 
    private String rmc_Week;

    // 근무시간 
    private String rmc_Time;

	public Integer getRm_Seq() {
		return rm_Seq;
	}

	public void setRm_Seq(Integer rm_Seq) {
		this.rm_Seq = rm_Seq;
	}

	public String getRmc_Salary() {
		return rmc_Salary;
	}

	public void setRmc_Salary(String rmc_Salary) {
		this.rmc_Salary = rmc_Salary;
	}

	public String getRmc_Business1() {
		return rmc_Business1;
	}

	public void setRmc_Business1(String rmc_Business1) {
		this.rmc_Business1 = rmc_Business1;
	}

	public String getRmc_Business2() {
		return rmc_Business2;
	}

	public void setRmc_Business2(String rmc_Business2) {
		this.rmc_Business2 = rmc_Business2;
	}

	public String getRmc_Business3() {
		return rmc_Business3;
	}

	public void setRmc_Business3(String rmc_Business3) {
		this.rmc_Business3 = rmc_Business3;
	}

	public String getRmc_Workspace() {
		return rmc_Workspace;
	}

	public void setRmc_Workspace(String rmc_Workspace) {
		this.rmc_Workspace = rmc_Workspace;
	}

	public String getRmc_Week() {
		return rmc_Week;
	}

	public void setRmc_Week(String rmc_Week) {
		this.rmc_Week = rmc_Week;
	}

	public String getRmc_Time() {
		return rmc_Time;
	}

	public void setRmc_Time(String rmc_Time) {
		this.rmc_Time = rmc_Time;
	}

}
