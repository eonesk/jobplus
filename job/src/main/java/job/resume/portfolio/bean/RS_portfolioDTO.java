package job.resume.portfolio.bean;

public class RS_portfolioDTO {

    // 포트폴리오seq 
    private Integer rspfSeq;

    // 포트폴리오 URL 
    private String rspfUrl;

    // 포트폴리오 파일 
    private String rspfFile;

    // 회원 아이디 
    private String mId;
    
    // 파일구분 
    private String rspfType;

    // 포트폴리오 구분 
    private String rspfFileorurl;

    public Integer getRspfSeq() {
		return rspfSeq;
	}

	public void setRspfSeq(Integer rspfSeq) {
		this.rspfSeq = rspfSeq;
	}

	public String getRspfUrl() {
		return rspfUrl;
	}

	public void setRspfUrl(String rspfUrl) {
		this.rspfUrl = rspfUrl;
	}

	public String getRspfFile() {
		return rspfFile;
	}

	public void setRspfFile(String rspfFile) {
		this.rspfFile = rspfFile;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getRspfType() {
		return rspfType;
	}

	public void setRspfType(String rspfType) {
		this.rspfType = rspfType;
	}

	public String getRspfFileorurl() {
		return rspfFileorurl;
	}

	public void setRspfFileorurl(String rspfFileorurl) {
		this.rspfFileorurl = rspfFileorurl;
	}

}
