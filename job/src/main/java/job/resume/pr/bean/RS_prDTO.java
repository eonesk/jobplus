package job.resume.pr.bean;

public class RS_prDTO {

    // 자기소개서seq 
    private Integer rsprSeq;

    // 제목 
    private String rsprTitle;

    // 내용 
    private String rsprContent;

    // 회원 아이디 
    private String mId;
    
    // 사용자 설정 이름
    private String rsprUserTitle;

    public Integer getRsprSeq() {
        return rsprSeq;
    }

    public void setRsprSeq(Integer rsprSeq) {
        this.rsprSeq = rsprSeq;
    }

    public String getRsprTitle() {
        return rsprTitle;
    }

    public void setRsprTitle(String rsprTitle) {
        this.rsprTitle = rsprTitle;
    }

    public String getRsprContent() {
        return rsprContent;
    }

    public void setRsprContent(String rsprContent) {
        this.rsprContent = rsprContent;
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

	public String getRsprUserTitle() {
		return rsprUserTitle;
	}

	public void setRsprUserTitle(String rsprUserTitle) {
		this.rsprUserTitle = rsprUserTitle;
	}

}
