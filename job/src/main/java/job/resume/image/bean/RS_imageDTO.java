package job.resume.image.bean;

public class RS_imageDTO {

    // 증명사진 seq 
    private Integer rsim_Seq;

    // 이력서 이미지 
    private String rsim_Name;

    // 회원 아이디 
    private String m_Id;
    
    // 사용자 설정 이름 
    private String rsim_Usertitle;

    public Integer getRsim_Seq() {
        return rsim_Seq;
    }

    public void setRsim_Seq(Integer rsim_Seq) {
        this.rsim_Seq = rsim_Seq;
    }

    public String getRsim_Name() {
        return rsim_Name;
    }

    public void setRsim_Name(String rsim_Name) {
        this.rsim_Name = rsim_Name;
    }

    public String getM_Id() {
        return m_Id;
    }

    public void setM_Id(String m_Id) {
        this.m_Id = m_Id;
    }
    
    public String getRsim_Usertitle() {
        return rsim_Usertitle;
    }

    public void setRsim_Usertitle(String rsim_Usertitle) {
        this.rsim_Usertitle = rsim_Usertitle;
    }
}