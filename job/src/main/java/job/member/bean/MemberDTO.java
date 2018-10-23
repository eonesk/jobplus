package job.member.bean;

import java.util.Date;

//회원정보 
public class MemberDTO {
	
    // 회원 아이디 
    private String mId;

    // 회원 비밀번호 
    private String mPw;

    // 회원 이름 
    private String mName;

    // 회원 성별 
    private String mGender;

    // 회원 집번호 
    private String mHomenum;

    // 회원 핸드폰번호 
    private String mPhone;

    // 회원 생일 
    private Date mBirth;

    // 회원 이메일 
    private String mEmail;

    // 회원 주소 
    private String mAddress;

    // 이메일 수신동의 
    private String mIsemail;

    // 문자 수신동의 
    private String mIsphone;

    // 해외 거주 여부 
    private String mIsforeign;

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

    public String getMPw() {
        return mPw;
    }

    public void setMPw(String mPw) {
        this.mPw = mPw;
    }

    public String getMName() {
        return mName;
    }

    public void setMName(String mName) {
        this.mName = mName;
    }

    public String getMGender() {
        return mGender;
    }

    public void setMGender(String mGender) {
        this.mGender = mGender;
    }

    public String getMHomenum() {
        return mHomenum;
    }

    public void setMHomenum(String mHomenum) {
        this.mHomenum = mHomenum;
    }

    public String getMPhone() {
        return mPhone;
    }

    public void setMPhone(String mPhone) {
        this.mPhone = mPhone;
    }

    public Date getMBirth() {
        return mBirth;
    }

    public void setMBirth(Date mBirth) {
        this.mBirth = mBirth;
    }

    public String getMEmail() {
        return mEmail;
    }

    public void setMEmail(String mEmail) {
        this.mEmail = mEmail;
    }

    public String getMAddress() {
        return mAddress;
    }

    public void setMAddress(String mAddress) {
        this.mAddress = mAddress;
    }

    public String getMIsemail() {
        return mIsemail;
    }

    public void setMIsemail(String mIsemail) {
        this.mIsemail = mIsemail;
    }

    public String getMIsphone() {
        return mIsphone;
    }

    public void setMIsphone(String mIsphone) {
        this.mIsphone = mIsphone;
    }

    public String getMIsforeign() {
        return mIsforeign;
    }

    public void setMIsforeign(String mIsforeign) {
        this.mIsforeign = mIsforeign;
    }

}