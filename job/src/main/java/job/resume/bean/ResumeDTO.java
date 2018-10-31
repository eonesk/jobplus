package job.resume.bean;

import java.util.Date;

//이력서 
public class ResumeDTO {

	// 이력서 seq
	private Integer rs_Seq;

	// 회원 아이디
	private String m_Id;

	// 이력서 이름
	private String rs_Name;

	// 이력서 생년월일
	private Date rs_Birth;

	// 이력서 성별
	private String rs_Gender;

	// 이력서 이메일
	private String rs_Email;

	// 이력서 전화번호
	private String rs_Homenum;

	// 이력서 제목
	private String rs_Title;

	// 이력서 핸드폰번호
	private String rs_Phone;

	// 이력서 주소
	private String rs_Address;

	// 고용형태
	private String rs_Type;

	// 희망연봉
	private String rs_Pay;

	// 희망근무지1
	private String rs_Workspace1;

	// 희망근무지2
	private String rs_Workspace2;

	// 희망근무지3
	private String rs_Workspace3;

	// 직무1
	private String rs_Job1;

	// 직무2
	private String rs_Job2;

	// 직무3
	private String rs_Job3;

	// 증명사진 seq
	private Integer rsim_Seq;

	// 학력seq1
	private Integer rss_Seq1;

	// 학력seq2
	private Integer rss_Seq2;

	// 학력seq3
	private Integer rss_Seq3;

	// 경력seq1
	private Integer rsw_Seq1;

	// 경력seq2
	private Integer rsw_Seq2;

	// 경력seq3
	private Integer rsw_Seq3;

	// 인턴,대외활동seq1
	private Integer rsit_Seq1;

	// 인턴,대외활동seq2
	private Integer rsit_Seq2;

	// 인턴,대외활동seq3
	private Integer rsit_Seq3;

	// 교육 이수seq1
	private Integer rse_Seq1;

	// 교육 이수seq2
	private Integer rse_Seq2;

	// 교육 이수seq3
	private Integer rse_Seq3;

	// 자격증seq1
	private Integer rsls_Seq1;

	// 자격증seq2
	private Integer rsls_Seq2;

	// 자격증seq3
	private Integer rsls_Seq3;

	// 수상seq1
	private Integer rst_Seq1;

	// 수상seq2
	private Integer rst_Seq2;

	// 수상seq3
	private Integer rst_Seq3;

	// 해외경험seq1
	private Integer rsf_Seq1;

	// 해외경험seq2
	private Integer rsf_Seq2;

	// 해외경험seq3
	private Integer rsf_Seq3;

	// 어학seq1
	private Integer rslg_Seq1;

	// 어학seq2
	private Integer rslg_Seq2;

	// 어학seq3
	private Integer rslg_Seq3;

	// 포트폴리오seq
	private Integer rspf_Seq;

	// 취업우대seq
	private Integer rsv_Seq;

	// 자기소개서seq
	private Integer rspr_Seq;
	
	// 이력서 수정날짜 
    private Date rs_Logdate;

	public Date getRs_Logdate() {
		return rs_Logdate;
	}

	public void setRs_Logdate(Date rs_Logdate) {
		this.rs_Logdate = rs_Logdate;
	}

	public Integer getRs_Seq() {
		return rs_Seq;
	}

	public void setRs_Seq(Integer rs_Seq) {
		this.rs_Seq = rs_Seq;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getRs_Name() {
		return rs_Name;
	}

	public void setRs_Name(String rs_Name) {
		this.rs_Name = rs_Name;
	}

	public Date getRs_Birth() {
		return rs_Birth;
	}

	public void setRs_Birth(Date rs_Birth) {
		this.rs_Birth = rs_Birth;
	}

	public String getRs_Gender() {
		return rs_Gender;
	}

	public void setRs_Gender(String rs_Gender) {
		this.rs_Gender = rs_Gender;
	}

	public String getRs_Email() {
		return rs_Email;
	}

	public void setRs_Email(String rs_Email) {
		this.rs_Email = rs_Email;
	}

	public String getRs_Homenum() {
		return rs_Homenum;
	}

	public void setRs_Homenum(String rs_Homenum) {
		this.rs_Homenum = rs_Homenum;
	}

	public String getRs_Title() {
		return rs_Title;
	}

	public void setRs_Title(String rs_Title) {
		this.rs_Title = rs_Title;
	}

	public String getRs_Phone() {
		return rs_Phone;
	}

	public void setRs_Phone(String rs_Phone) {
		this.rs_Phone = rs_Phone;
	}

	public String getRs_Address() {
		return rs_Address;
	}

	public void setRs_Address(String rs_Address) {
		this.rs_Address = rs_Address;
	}

	public String getRs_Type() {
		return rs_Type;
	}

	public void setRs_Type(String rs_Type) {
		this.rs_Type = rs_Type;
	}

	public String getRs_Pay() {
		return rs_Pay;
	}

	public void setRs_Pay(String rs_Pay) {
		this.rs_Pay = rs_Pay;
	}

	public String getRs_Workspace1() {
		return rs_Workspace1;
	}

	public void setRs_Workspace1(String rs_Workspace1) {
		this.rs_Workspace1 = rs_Workspace1;
	}

	public String getRs_Workspace2() {
		return rs_Workspace2;
	}

	public void setRs_Workspace2(String rs_Workspace2) {
		this.rs_Workspace2 = rs_Workspace2;
	}

	public String getRs_Workspace3() {
		return rs_Workspace3;
	}

	public void setRs_Workspace3(String rs_Workspace3) {
		this.rs_Workspace3 = rs_Workspace3;
	}

	public String getRs_Job1() {
		return rs_Job1;
	}

	public void setRs_Job1(String rs_Job1) {
		this.rs_Job1 = rs_Job1;
	}

	public String getRs_Job2() {
		return rs_Job2;
	}

	public void setRs_Job2(String rs_Job2) {
		this.rs_Job2 = rs_Job2;
	}

	public String getRs_Job3() {
		return rs_Job3;
	}

	public void setRs_Job3(String rs_Job3) {
		this.rs_Job3 = rs_Job3;
	}

	public Integer getRsim_Seq() {
		return rsim_Seq;
	}

	public void setRsim_Seq(Integer rsim_Seq) {
		this.rsim_Seq = rsim_Seq;
	}

	public Integer getRss_Seq1() {
		return rss_Seq1;
	}

	public void setRss_Seq1(Integer rss_Seq1) {
		this.rss_Seq1 = rss_Seq1;
	}

	public Integer getRss_Seq2() {
		return rss_Seq2;
	}

	public void setRss_Seq2(Integer rss_Seq2) {
		this.rss_Seq2 = rss_Seq2;
	}

	public Integer getRss_Seq3() {
		return rss_Seq3;
	}

	public void setRss_Seq3(Integer rss_Seq3) {
		this.rss_Seq3 = rss_Seq3;
	}

	public Integer getRsw_Seq1() {
		return rsw_Seq1;
	}

	public void setRsw_Seq1(Integer rsw_Seq1) {
		this.rsw_Seq1 = rsw_Seq1;
	}

	public Integer getRsw_Seq2() {
		return rsw_Seq2;
	}

	public void setRsw_Seq2(Integer rsw_Seq2) {
		this.rsw_Seq2 = rsw_Seq2;
	}

	public Integer getRsw_Seq3() {
		return rsw_Seq3;
	}

	public void setRsw_Seq3(Integer rsw_Seq3) {
		this.rsw_Seq3 = rsw_Seq3;
	}

	public Integer getRsit_Seq1() {
		return rsit_Seq1;
	}

	public void setRsit_Seq1(Integer rsit_Seq1) {
		this.rsit_Seq1 = rsit_Seq1;
	}

	public Integer getRsit_Seq2() {
		return rsit_Seq2;
	}

	public void setRsit_Seq2(Integer rsit_Seq2) {
		this.rsit_Seq2 = rsit_Seq2;
	}

	public Integer getRsit_Seq3() {
		return rsit_Seq3;
	}

	public void setRsit_Seq3(Integer rsit_Seq3) {
		this.rsit_Seq3 = rsit_Seq3;
	}

	public Integer getRse_Seq1() {
		return rse_Seq1;
	}

	public void setRse_Seq1(Integer rse_Seq1) {
		this.rse_Seq1 = rse_Seq1;
	}

	public Integer getRse_Seq2() {
		return rse_Seq2;
	}

	public void setRse_Seq2(Integer rse_Seq2) {
		this.rse_Seq2 = rse_Seq2;
	}

	public Integer getRse_Seq3() {
		return rse_Seq3;
	}

	public void setRse_Seq3(Integer rse_Seq3) {
		this.rse_Seq3 = rse_Seq3;
	}

	public Integer getRsls_Seq1() {
		return rsls_Seq1;
	}

	public void setRsls_Seq1(Integer rsls_Seq1) {
		this.rsls_Seq1 = rsls_Seq1;
	}

	public Integer getRsls_Seq2() {
		return rsls_Seq2;
	}

	public void setRsls_Seq2(Integer rsls_Seq2) {
		this.rsls_Seq2 = rsls_Seq2;
	}

	public Integer getRsls_Seq3() {
		return rsls_Seq3;
	}

	public void setRsls_Seq3(Integer rsls_Seq3) {
		this.rsls_Seq3 = rsls_Seq3;
	}

	public Integer getRst_Seq1() {
		return rst_Seq1;
	}

	public void setRst_Seq1(Integer rst_Seq1) {
		this.rst_Seq1 = rst_Seq1;
	}

	public Integer getRst_Seq2() {
		return rst_Seq2;
	}

	public void setRst_Seq2(Integer rst_Seq2) {
		this.rst_Seq2 = rst_Seq2;
	}

	public Integer getRst_Seq3() {
		return rst_Seq3;
	}

	public void setRst_Seq3(Integer rst_Seq3) {
		this.rst_Seq3 = rst_Seq3;
	}

	public Integer getRsf_Seq1() {
		return rsf_Seq1;
	}

	public void setRsf_Seq1(Integer rsf_Seq1) {
		this.rsf_Seq1 = rsf_Seq1;
	}

	public Integer getRsf_Seq2() {
		return rsf_Seq2;
	}

	public void setRsf_Seq2(Integer rsf_Seq2) {
		this.rsf_Seq2 = rsf_Seq2;
	}

	public Integer getRsf_Seq3() {
		return rsf_Seq3;
	}

	public void setRsf_Seq3(Integer rsf_Seq3) {
		this.rsf_Seq3 = rsf_Seq3;
	}

	public Integer getRslg_Seq1() {
		return rslg_Seq1;
	}

	public void setRslg_Seq1(Integer rslg_Seq1) {
		this.rslg_Seq1 = rslg_Seq1;
	}

	public Integer getRslg_Seq2() {
		return rslg_Seq2;
	}

	public void setRslg_Seq2(Integer rslg_Seq2) {
		this.rslg_Seq2 = rslg_Seq2;
	}

	public Integer getRslg_Seq3() {
		return rslg_Seq3;
	}

	public void setRslg_Seq3(Integer rslg_Seq3) {
		this.rslg_Seq3 = rslg_Seq3;
	}

	public Integer getRspf_Seq() {
		return rspf_Seq;
	}

	public void setRspf_Seq(Integer rspf_Seq) {
		this.rspf_Seq = rspf_Seq;
	}

	public Integer getRsv_Seq() {
		return rsv_Seq;
	}

	public void setRsv_Seq(Integer rsv_Seq) {
		this.rsv_Seq = rsv_Seq;
	}

	public Integer getRspr_Seq() {
		return rspr_Seq;
	}

	public void setRspr_Seq(Integer rspr_Seq) {
		this.rspr_Seq = rspr_Seq;
	}
}