package job.resume.pr.bean;

public class RS_prDTO {

    // 자기소개서seq 
    private Integer rspr_Seq;

    // 제목 
    private String rspr_Title;

    // 내용 
    private String rspr_Content;

    // 회원 아이디 
    private String m_Id;
    
    // 사용자 설정 이름
    private String rspr_UserTitle;

	@Override
	public String toString() {
		return "RS_prDTO [rspr_Seq=" + rspr_Seq + ", rspr_Title=" + rspr_Title + ", rspr_Content=" + rspr_Content
				+ ", m_Id=" + m_Id + ", rspr_UserTitle=" + rspr_UserTitle + "]";
	}

	public Integer getRspr_Seq() {
		return rspr_Seq;
	}

	public void setRspr_Seq(Integer rspr_Seq) {
		this.rspr_Seq = rspr_Seq;
	}

	public String getRspr_Title() {
		return rspr_Title;
	}

	public void setRspr_Title(String rspr_Title) {
		this.rspr_Title = rspr_Title;
	}

	public String getRspr_Content() {
		return rspr_Content;
	}

	public void setRspr_Content(String rspr_Content) {
		this.rspr_Content = rspr_Content;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getRspr_UserTitle() {
		return rspr_UserTitle;
	}

	public void setRspr_UserTitle(String rspr_UserTitle) {
		this.rspr_UserTitle = rspr_UserTitle;
	}

    

}
