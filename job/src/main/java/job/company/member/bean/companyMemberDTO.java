package job.company.member.bean;

public class companyMemberDTO {

	// 기업아이디
	private String cpm_id;

	// 기업비밀번호
	private String cpm_pw;

	// 사업자등록번호
	private String cpm_num;

	// 기업구분
	private String cpm_type;

	// 개인정보보유기간
	private String cpm_infotime;

	public String getCpm_id() {
		return cpm_id;
	}

	public void setCpm_id(String cpm_id) {
		this.cpm_id = cpm_id;
	}

	public String getCpm_pw() {
		return cpm_pw;
	}

	public void setCpm_pw(String cpm_pw) {
		this.cpm_pw = cpm_pw;
	}

	public String getCpm_num() {
		return cpm_num;
	}

	public void setCpm_num(String cpm_num) {
		this.cpm_num = cpm_num;
	}

	public String getCpm_type() {
		return cpm_type;
	}

	public void setCpm_type(String cpm_type) {
		this.cpm_type = cpm_type;
	}

	public String getCpm_infotime() {
		return cpm_infotime;
	}

	public void setCpm_infotime(String cpm_infotime) {
		this.cpm_infotime = cpm_infotime;
	}


}