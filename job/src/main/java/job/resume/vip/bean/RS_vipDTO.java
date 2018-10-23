package job.resume.vip.bean;

import java.util.Date;

public class RS_vipDTO {

    // 취업우대seq 
    private Integer rsvSeq;

    // 보훈대상 여부 
    private String rsvIsmedal;

    // 취업보호대상 여부 
    private String rsvIsprotect;

    // 고용지원금대상 여부 
    private String rsvIsmoney;

    // 장애 여부 
    private String rsvIsdisable;

    // 병역 
    private String rsvMilitary;

    // 입대일 
    private Date rsvStartdate;

    // 제대일 
    private Date rsvEnddate;

    // 군별, 제대 계급 
    private String rsvPosition;

    // 회원 아이디 
    private String mId;

    public Integer getRsvSeq() {
        return rsvSeq;
    }

    public void setRsvSeq(Integer rsvSeq) {
        this.rsvSeq = rsvSeq;
    }

    public String getRsvIsmedal() {
        return rsvIsmedal;
    }

    public void setRsvIsmedal(String rsvIsmedal) {
        this.rsvIsmedal = rsvIsmedal;
    }

    public String getRsvIsprotect() {
        return rsvIsprotect;
    }

    public void setRsvIsprotect(String rsvIsprotect) {
        this.rsvIsprotect = rsvIsprotect;
    }

    public String getRsvIsmoney() {
        return rsvIsmoney;
    }

    public void setRsvIsmoney(String rsvIsmoney) {
        this.rsvIsmoney = rsvIsmoney;
    }

    public String getRsvIsdisable() {
        return rsvIsdisable;
    }

    public void setRsvIsdisable(String rsvIsdisable) {
        this.rsvIsdisable = rsvIsdisable;
    }

    public String getRsvMilitary() {
        return rsvMilitary;
    }

    public void setRsvMilitary(String rsvMilitary) {
        this.rsvMilitary = rsvMilitary;
    }

    public Date getRsvStartdate() {
        return rsvStartdate;
    }

    public void setRsvStartdate(Date rsvStartdate) {
        this.rsvStartdate = rsvStartdate;
    }

    public Date getRsvEnddate() {
        return rsvEnddate;
    }

    public void setRsvEnddate(Date rsvEnddate) {
        this.rsvEnddate = rsvEnddate;
    }

    public String getRsvPosition() {
        return rsvPosition;
    }

    public void setRsvPosition(String rsvPosition) {
        this.rsvPosition = rsvPosition;
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

}
