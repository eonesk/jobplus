package job.recruitment.bean;

import java.util.Date;

public class recruitmentDTO {

    // 채용공고seq 
    private Integer rm_Seq;

    // 제목 
    private String rm_Title;

    // 조회수 
    private Integer rm_Hit;

    // 스크랩수 
    private Integer rm_Scrap;

    // 고용형태 
    private String rm_Worktype;

    // 시작일 
    private Date rm_Startdate;

    // 종료일 
    private Date rm_Enddate;

    // 지원방식 
    private String rm_Support;

    // 근무지역 
    private String rm_Workspace;

    // 기업정보 
    private Integer cpi_Seq;

    // 합격자료 
    private String rm_Success;

    // 담당업무1 
    private String rm_Workpart1;

    // 담당업무2 
    private String rm_Workpart2;

    // 담당업무3 
    private String rm_Workpart3;

    // 담당자정보seq 
    private Integer rmp_Seq;

    // 채용종료 
    private String rm_End;

	public Integer getRm_Seq() {
		return rm_Seq;
	}

	public void setRm_Seq(Integer rm_Seq) {
		this.rm_Seq = rm_Seq;
	}

	public String getRm_Title() {
		return rm_Title;
	}

	public void setRm_Title(String rm_Title) {
		this.rm_Title = rm_Title;
	}

	public Integer getRm_Hit() {
		return rm_Hit;
	}

	public void setRm_Hit(Integer rm_Hit) {
		this.rm_Hit = rm_Hit;
	}

	public Integer getRm_Scrap() {
		return rm_Scrap;
	}

	public void setRm_Scrap(Integer rm_Scrap) {
		this.rm_Scrap = rm_Scrap;
	}

	public String getRm_Worktype() {
		return rm_Worktype;
	}

	public void setRm_Worktype(String rm_Worktype) {
		this.rm_Worktype = rm_Worktype;
	}

	public Date getRm_Startdate() {
		return rm_Startdate;
	}

	public void setRm_Startdate(Date rm_Startdate) {
		this.rm_Startdate = rm_Startdate;
	}

	public Date getRm_Enddate() {
		return rm_Enddate;
	}

	public void setRm_Enddate(Date rm_Enddate) {
		this.rm_Enddate = rm_Enddate;
	}

	public String getRm_Support() {
		return rm_Support;
	}

	public void setRm_Support(String rm_Support) {
		this.rm_Support = rm_Support;
	}

	public String getRm_Workspace() {
		return rm_Workspace;
	}

	public void setRm_Workspace(String rm_Workspace) {
		this.rm_Workspace = rm_Workspace;
	}

	public Integer getCpi_Seq() {
		return cpi_Seq;
	}

	public void setCpi_Seq(Integer cpi_Seq) {
		this.cpi_Seq = cpi_Seq;
	}

	public String getRm_Success() {
		return rm_Success;
	}

	public void setRm_Success(String rm_Success) {
		this.rm_Success = rm_Success;
	}

	public String getRm_Workpart1() {
		return rm_Workpart1;
	}

	public void setRm_Workpart1(String rm_Workpart1) {
		this.rm_Workpart1 = rm_Workpart1;
	}

	public String getRm_Workpart2() {
		return rm_Workpart2;
	}

	public void setRm_Workpart2(String rm_Workpart2) {
		this.rm_Workpart2 = rm_Workpart2;
	}

	public String getRm_Workpart3() {
		return rm_Workpart3;
	}

	public void setRm_Workpart3(String rm_Workpart3) {
		this.rm_Workpart3 = rm_Workpart3;
	}

	public Integer getRmp_Seq() {
		return rmp_Seq;
	}

	public void setRmp_Seq(Integer rmp_Seq) {
		this.rmp_Seq = rmp_Seq;
	}

	public String getRm_End() {
		return rm_End;
	}

	public void setRm_End(String rm_End) {
		this.rm_End = rm_End;
	}


}
