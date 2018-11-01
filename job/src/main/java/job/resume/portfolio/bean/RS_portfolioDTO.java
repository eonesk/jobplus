package job.resume.portfolio.bean;

public class RS_portfolioDTO {

    // 포트폴리오seq 
    private Integer rspf_Seq;

    // 포트폴리오 URL 
    private String rspf_Url;

    // 포트폴리오 파일 
    private String rspf_File;

    // 회원 아이디 
    private String m_Id;
    
    // 파일구분 
    private String rspf_Type;

    // 파일타입 
    private String rspf_Fileorurl;

    // 제목
    private String rspf_Usertitle;
    
	public String getrspf_Usertitle() {
		return rspf_Usertitle;
	}

	public void setrspf_Usertitle(String rspf_Usertitle) {
		this.rspf_Usertitle = rspf_Usertitle;
	}

	public Integer getrspf_Seq() {
		return rspf_Seq;
	}
		
	public void setrspf_Seq(Integer rspf_Seq) {
		this.rspf_Seq = rspf_Seq;
	}

	public String getrspf_Url() {
		return rspf_Url;
	}

	public void setrspf_Url(String rspf_Url) {
		this.rspf_Url = rspf_Url;
	}

	public String getrspf_File() {
		return rspf_File;
	}

	public void setrspf_File(String rspf_File) {
		this.rspf_File = rspf_File;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getrspf_Type() {
		return rspf_Type;
	}

	public void setrspf_Type(String rspf_Type) {
		this.rspf_Type = rspf_Type;
	}

	public String getrspf_Fileorurl() {
		return rspf_Fileorurl;
	}

	public void setrspf_Fileorurl(String rspf_Fileorurl) {
		this.rspf_Fileorurl = rspf_Fileorurl;
	}
}
