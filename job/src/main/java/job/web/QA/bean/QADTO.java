package job.web.QA.bean;

import java.util.Date;

public class QADTO {

    // QA게시판seq 
    private Integer qa_Seq;

    // 분류 
    private String qa_Type;

    // 글제목 
    private String qa_Title;

    // 글내용 
    private String qa_Content;

    // 아이디 
    private String m_Id;

    // 등록시간 
    private Date qa_Logtime;

    // 조회수 
    private Integer qa_Hit;

	public Integer getQa_Seq() {
		return qa_Seq;
	}

	public void setQa_Seq(Integer qa_Seq) {
		this.qa_Seq = qa_Seq;
	}

	public String getQa_Type() {
		return qa_Type;
	}

	public void setQa_Type(String qa_Type) {
		this.qa_Type = qa_Type;
	}

	public String getQa_Title() {
		return qa_Title;
	}

	public void setQa_Title(String qa_Title) {
		this.qa_Title = qa_Title;
	}

	public String getQa_Content() {
		return qa_Content;
	}

	public void setQa_Content(String qa_Content) {
		this.qa_Content = qa_Content;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public Date getQa_Logtime() {
		return qa_Logtime;
	}

	public void setQa_Logtime(Date qa_Logtime) {
		this.qa_Logtime = qa_Logtime;
	}

	public Integer getQa_Hit() {
		return qa_Hit;
	}

	public void setQa_Hit(Integer qa_Hit) {
		this.qa_Hit = qa_Hit;
	}


}
