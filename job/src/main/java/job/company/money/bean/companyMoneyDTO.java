package job.company.money.bean;

public class companyMoneyDTO {

    // 기업정보seq 
    private Integer cpi_Seq;

    // 자본금 
    private String cpmn_Base;

    // 매출액 
    private String cpmn_Sell;

    // 당기손익금액 
    private String cpmn_Palmoney;

    // 당기손익기준 
    private String cpmn_Paldate;

	public Integer getCpi_Seq() {
		return cpi_Seq;
	}

	public void setCpi_Seq(Integer cpi_Seq) {
		this.cpi_Seq = cpi_Seq;
	}

	public String getCpmn_Base() {
		return cpmn_Base;
	}

	public void setCpmn_Base(String cpmn_Base) {
		this.cpmn_Base = cpmn_Base;
	}

	public String getCpmn_Sell() {
		return cpmn_Sell;
	}

	public void setCpmn_Sell(String cpmn_Sell) {
		this.cpmn_Sell = cpmn_Sell;
	}

	public String getCpmn_Palmoney() {
		return cpmn_Palmoney;
	}

	public void setCpmn_Palmoney(String cpmn_Palmoney) {
		this.cpmn_Palmoney = cpmn_Palmoney;
	}

	public String getCpmn_Paldate() {
		return cpmn_Paldate;
	}

	public void setCpmn_Paldate(String cpmn_Paldate) {
		this.cpmn_Paldate = cpmn_Paldate;
	}

}
