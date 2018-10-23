package job.resume.intern.bean;

public class RS_internDTO {

	// 인턴,대외활동seq
	private Integer rsitSeq;

	// 활동구분
	private String rsitType;

	// 회사
	private String rsitCompany;

	// 시작년월
	private String rsitStartdate;

	// 종료년월
	private String rsitEnddate;

	// 활동내용
	private String rsitContent;

	// 회원 아이디
	private String mId;

	public Integer getRsitSeq() {
		return rsitSeq;
	}

	public void setRsitSeq(Integer rsitSeq) {
		this.rsitSeq = rsitSeq;
	}

	public String getRsitType() {
		return rsitType;
	}

	public void setRsitType(String rsitType) {
		this.rsitType = rsitType;
	}

	public String getRsitCompany() {
		return rsitCompany;
	}

	public void setRsitCompany(String rsitCompany) {
		this.rsitCompany = rsitCompany;
	}

	public String getRsitStartdate() {
		return rsitStartdate;
	}

	public void setRsitStartdate(String rsitStartdate) {
		this.rsitStartdate = rsitStartdate;
	}

	public String getRsitEnddate() {
		return rsitEnddate;
	}

	public void setRsitEnddate(String rsitEnddate) {
		this.rsitEnddate = rsitEnddate;
	}

	public String getRsitContent() {
		return rsitContent;
	}

	public void setRsitContent(String rsitContent) {
		this.rsitContent = rsitContent;
	}

	public String getMId() {
		return mId;
	}

	public void setMId(String mId) {
		this.mId = mId;
	}

}
