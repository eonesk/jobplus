package job.company.logo.bean;

public class companyLogoDTO {

    // 기업로고seq 
    private Integer cpl_Seq;

    // 기업로고이미지 
    private String cpl_Name;

    // 기업 아이디
    private String cpm_Id;

	public Integer getCpl_Seq() {
		return cpl_Seq;
	}

	public void setCpl_Seq(Integer cpl_Seq) {
		this.cpl_Seq = cpl_Seq;
	}

	public String getCpl_Name() {
		return cpl_Name;
	}

	public void setCpl_Name(String cpl_Name) {
		this.cpl_Name = cpl_Name;
	}

	public String getcpm_Id() {
		return cpm_Id;
	}

	public void setcpm_Id(String cpm_Id) {
		this.cpm_Id = cpm_Id;
	}

  

}
