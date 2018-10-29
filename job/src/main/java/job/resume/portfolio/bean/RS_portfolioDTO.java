package job.resume.portfolio.bean;

public class RS_portfolioDTO {

    // 포트폴리오seq 
    private Integer rs_pfSeq;

    // 포트폴리오 URL 
    private String rs_pfUrl;

    // 포트폴리오 파일 
    private String rs_pfFile;

    // 회원 아이디 
    private String m_Id;
    
    // 파일구분 
    private String rs_pfType;

    // 파일타입 
    private String rs_pfFileorurl;

    // 제목
    private String rs_pfUsertitle;
    
	public String getRs_pfUsertitle() {
		return rs_pfUsertitle;
	}

	public void setRs_pfUsertitle(String rs_pfUsertitle) {
		this.rs_pfUsertitle = rs_pfUsertitle;
	}

	public Integer getRs_pfSeq() {
		return rs_pfSeq;
	}
		
	public void setRs_pfSeq(Integer rs_pfSeq) {
		this.rs_pfSeq = rs_pfSeq;
	}

	public String getRs_pfUrl() {
		return rs_pfUrl;
	}

	public void setRs_pfUrl(String rs_pfUrl) {
		this.rs_pfUrl = rs_pfUrl;
	}

	public String getRs_pfFile() {
		return rs_pfFile;
	}

	public void setRs_pfFile(String rs_pfFile) {
		this.rs_pfFile = rs_pfFile;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getRs_pfType() {
		return rs_pfType;
	}

	public void setRs_pfType(String rs_pfType) {
		this.rs_pfType = rs_pfType;
	}

	public String getRs_pfFileorurl() {
		return rs_pfFileorurl;
	}

	public void setRs_pfFileorurl(String rs_pfFileorurl) {
		this.rs_pfFileorurl = rs_pfFileorurl;
	}
}
