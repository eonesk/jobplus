package job.recruitment.companyQA.bean;

public class companyQADTO {

    // 기업정보QnAseq 
    private Integer cpqaSeq;

    // 채용공고seq 
    private Integer rmSeq;

    // 기업질문 
    private String cpqaQuest;

    // 기업답변 
    private String cpqaAnswer;

    // 등록시간 
    private String cpqaLogtime;

    public Integer getCpqaSeq() {
        return cpqaSeq;
    }

    public void setCpqaSeq(Integer cpqaSeq) {
        this.cpqaSeq = cpqaSeq;
    }

    public Integer getRmSeq() {
        return rmSeq;
    }

    public void setRmSeq(Integer rmSeq) {
        this.rmSeq = rmSeq;
    }

    public String getCpqaQuest() {
        return cpqaQuest;
    }

    public void setCpqaQuest(String cpqaQuest) {
        this.cpqaQuest = cpqaQuest;
    }

    public String getCpqaAnswer() {
        return cpqaAnswer;
    }

    public void setCpqaAnswer(String cpqaAnswer) {
        this.cpqaAnswer = cpqaAnswer;
    }

    public String getCpqaLogtime() {
        return cpqaLogtime;
    }

    public void setCpqaLogtime(String cpqaLogtime) {
        this.cpqaLogtime = cpqaLogtime;
    }

}
