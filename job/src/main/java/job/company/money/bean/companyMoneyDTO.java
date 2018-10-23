package job.company.money.bean;

public class companyMoneyDTO {

    // 기업정보seq 
    private Integer cpiSeq;

    // 자본금 
    private String cpmnBase;

    // 매출액 
    private String cpmnSell;

    // 당기손익금액 
    private String cpmnPalmoney;

    // 당기손익기준 
    private String cpmnPaldate;

    public Integer getCpiSeq() {
        return cpiSeq;
    }

    public void setCpiSeq(Integer cpiSeq) {
        this.cpiSeq = cpiSeq;
    }

    public String getCpmnBase() {
        return cpmnBase;
    }

    public void setCpmnBase(String cpmnBase) {
        this.cpmnBase = cpmnBase;
    }

    public String getCpmnSell() {
        return cpmnSell;
    }

    public void setCpmnSell(String cpmnSell) {
        this.cpmnSell = cpmnSell;
    }

    public String getCpmnPalmoney() {
        return cpmnPalmoney;
    }

    public void setCpmnPalmoney(String cpmnPalmoney) {
        this.cpmnPalmoney = cpmnPalmoney;
    }

    public String getCpmnPaldate() {
        return cpmnPaldate;
    }

    public void setCpmnPaldate(String cpmnPaldate) {
        this.cpmnPaldate = cpmnPaldate;
    }

}
