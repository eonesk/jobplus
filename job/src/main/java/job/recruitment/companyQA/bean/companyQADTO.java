package job.recruitment.companyQA.bean;

import java.util.Date;

public class companyQADTO {

    // 기업정보QnAseq 
    private Integer cpqa_Seq;

    // 채용공고seq 
    private Integer rm_Seq;

    // 기업질문 
    private String cpqa_Quest;

    // 기업답변 
    private String cpqa_Answer;

    // 등록시간 
    private Date cpqa_Logtime;

	public Integer getCpqa_Seq() {
		return cpqa_Seq;
	}

	public void setCpqa_Seq(Integer cpqa_Seq) {
		this.cpqa_Seq = cpqa_Seq;
	}

	public Integer getRm_Seq() {
		return rm_Seq;
	}

	public void setRm_Seq(Integer rm_Seq) {
		this.rm_Seq = rm_Seq;
	}

	public String getCpqa_Quest() {
		return cpqa_Quest;
	}

	public void setCpqa_Quest(String cpqa_Quest) {
		this.cpqa_Quest = cpqa_Quest;
	}

	public String getCpqa_Answer() {
		return cpqa_Answer;
	}

	public void setCpqa_Answer(String cpqa_Answer) {
		this.cpqa_Answer = cpqa_Answer;
	}

	public Date getCpqa_Logtime() {
		return cpqa_Logtime;
	}

	public void setCpqa_Logtime(Date cpqa_Logtime) {
		this.cpqa_Logtime = cpqa_Logtime;
	}

}
