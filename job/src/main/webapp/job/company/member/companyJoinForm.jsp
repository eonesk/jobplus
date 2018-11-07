<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".cpm_hideSpan").hide();
	//id 속성이 join인 <form>태그 안의 submit 버튼을 누른 경우
	$("form[name='joinForm']").submit(function() {
		var idReg = /^[A-za-z0-9]{5,15}$/g;
		var pwReg = /^[A-za-z0-9]{5,15}$/g;
		var numReg = /^[0-9]{5,15}$/g;

		if(!$("input[name='cpm_id']").val()){
			$("#cpm_hideIdSpan").css("color","red").html("아이디를 입력하세요.").show();
			$("input[name='cpm_id']").focus();
			return false;
		}else if(!idReg.test($("input[name='cpm_id']").val())){
			$("#cpm_hideIdSpan").css("color","red").html("아이디는 영문자로 시작하는 5~15자 영문자 또는 숫자이어야 합니다").show();
			$("input[name='cpm_id']").focus();
			return false;
		}else{
			$("#cpm_hideIdSpan").css("color","green").html("사용가능한 아이디 입니다.").show();
		}
		
		
		
		/**비밀번호 입력 검사 */
		if(!$("input[name='cpm_pw']").val()){
			$("#cpm_hidePwSpan").css("color","red").html("비밀번호를 입력하세요.").show(); 
			$("input[name='cpm_pw']").focus();
			return false;
		}else if(!pwReg.test($("input[name='cpm_pw']").val())){
			$("#cpm_hidePwSpan").css("color","red").html("비밀번호는 영문자로 시작하는 5~15자 영문자 또는 숫자이어야 합니다").show();
			$("input[name='cpm_pw']").focus();
			return false;
		}else{
			$("#cpm_hidePwSpan").css("color","green").html("사용가능한 비밀번호 입니다.").show();
		}
		
		//기업 사업자 번호
		if(!$("input[name='cpm_num']").val()){
			$("#cpm_hideNumSpan").css("color","red").html("사업자등록번호를 입력하세요.").show(); 
			$("input[name='cpm_num']").focus();
			return false;
		}else if(!numReg.test($("input[name='cpm_num']").val())){
			$("#cpm_hideNumSpan").css("color","red").html("올바른 값을 입력해 주십시오").show();
			$("input[name='cpm_num']").focus();
			return false;
		}else{
			$("#cpm_hideNumSpan").hide();
		}
		
		if($("#cpm_type").val() == "기업 분류"){
			$("#cpm_hideTypeSpan").css("color","red").html("사업자등록번호를 입력하세요.").show(); 
			$("input[name='cpm_type']").focus();
			return false;
		}else{
			$("#cpm_hideTypeSpan").hide();
		}
		
		
		/**라디오버튼 선택여부 검사 */
		//!$("라디오버튼CSS셀렉터").is("checked") --> 체크일 경우 : true
		if(!$("input[name='cpm_infotime']").is(":checked")){
			alert("정보보유 기간을 체크하세요.");
			$("input[name='cpm_infotime']:eq(0)").focus();
			return false;
		}
		
		
		/**체크박스 선택여부 검사 */
		if(!$("li.must .consent").is(":checked")){
			alert("필수약관에 동의 해주십시오.");
			$(this).focus();
			return false;
		}
	});
	
	$("#allConsent").change(function() {
		var is_check = $(this).is(":checked");
		if(is_check){
			$(this).next().addClass("mustCheckon");
			$(this).next().removeClass("mustCheckoff");
			$(".consent").next().addClass("mustCheckon");
			$(".consent").next().removeClass("mustCheckoff");
		}else{
			$(this).next().addClass("mustCheckoff");
			$(this).next().removeClass("mustCheckon");
			$(".consent").next().addClass("mustCheckoff");
			$(".consent").next().removeClass("mustCheckon");
		}
		$(".consent").prop("checked",is_check);
	});
	
	$(".consent").change(function() {
		var is_check = $(this).is(":checked");
		if(is_check){
			$(this).next().addClass("mustCheckon");
			$(this).next().removeClass("mustCheckoff");
		}else{
			$(this).next().addClass("mustCheckoff");
			$(this).next().removeClass("mustCheckon");
			$("#allConsent").next().addClass("mustCheckoff");
			$("#allConsent").next().removeClass("mustCheckon");
		}
		if(!is_check){
			$("#allConsent").prop("checked",is_check);  //infotimeCheckOff cpm_infotime
		}
	});
	
	$("input[name='cpm_infotime']").change(function() {
		var radio = $("input[name='cpm_infotime']");
		$.each(radio,function(key,value){
			 var is_check = $(this).is(":checked");
			 if(is_check){
				 $(this).next().addClass("infotimeCheckOn");
				 $(this).next().removeClass("infotimeCheckOff");
			 }else{
				 $(this).next().addClass("infotimeCheckOff");
				 $(this).next().removeClass("infotimeCheckOn");
			 }
		});
	});
});
</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

#joinContainer {
	/**border: 1px solid gray;*/
	width: 500px;
	margin: auto;
	margin-bottom: 100px;
	padding-top: 50px;
}

#joinContainer #header {
	text-align: center;
	margin-bottom: 20px;
	margin-right: 20px;
}

#joinCategory .joinCategory {
	overflow: auto;
	margin-bottom: 30px;
}

#joinCategory .joinCategory li {
	padding-top: 20px;
	width: 248px;
	height: 50px;
	list-style: none;
	float: left;
	border: 1px solid gray;
	text-align: center;
	line-height: 18px;
}

#joinCategory .joinCategory li .tabBtn {
	text-decoration: none;
	color: gray;
	font-size: 12px;
}

#joinCategory .joinCategory li.on {
	background-color: #6666ff;
	color: white;
}

#joinCategory .joinCategory li.on .tabBtn {
	color: white;
}

#joinCategory .joinCategory li .tabBtn strong {
	display: block;
	font-size: 22px;
}

input[type=text], input[type=password], input[type=email],[type=tel]{
	display: inline-block;
	width: 100%;
	height: 50px;
}
.cpm_type{
	display: inline-block;
	width: 101%;
	height: 50px;
}

.cpm_type option{
	font-size:15px;
	font-weight:bold;
	
}

#joinContent h3 {

	font-size: 22px;
	margin-top: 25px;
	margin-bottom: 10px;
}

#joinContent #consent {
	width: 100%;
	background: #fff;
	border: 1px solid lightgray;
}

#joinContent #consent li {
	padding-left: 10px;
	padding-right: 10px;
	list-style: none;
	min-height: 45px;
}

#joinContent #consent li:nth-child(2) {
	padding-top: 20px;
	border-top: 1px solid lightgray;
}

input[type=checkbox] {
	 display: none;
}

#joinContent #consent li label {
	float: right;
	cursor: pointer;
	width: 30px;
	height: 30px;
}

#joinContent #consent li label.mustCheckoff {
	background: url('//www.saraminimage.co.kr/ui/join/bg_check_bullet.png')
		no-repeat 0 0px;
}

#joinContent #consent li label.mustCheckon {
	background: url('//www.saraminimage.co.kr/ui/join/bg_check_bullet.png')
		no-repeat 0 -30px;
}

#joinContent #consent #allCheck {
	font-weight: bold;
	padding-top: 10px;
}

.detailView {
	color: gray;
	font-size: 12px;
	float: right;
	padding-right: 20px;
	padding-top: 8px
}

.joinDiv {
	width: 100%;
	margin-top: 40px;
}

.joinBtn {
	display: block;
	margin: 0 auto;
	width: 220px;
	height: 60px;
	background-color: #444;
	font-size: 20px;
	color: #fff;
	letter-spacing: -1px;
	font-weight: bold;
	cursor: pointer;
}

.cmp_infotimeDiv{
	border:1px solid lightgray;
	width: 100%;
	height:50px;
	margin-top: 20px;
	
}

.cmp_infotitleSpan{
	display:inline-block;
	font-size:15px;
	font-weight:bold;
	margin-right:30px;
	margin-left: 10px;
}
.cmp_infoContentSpan{
	font-size:13px;
	margin-left:10px;
	margin-right:20px;
}
.cpm_infotimeLabel{
	position:relative;
	display:inline-block;
	
	top:10px;
	width: 30px;
	height: 30px;
}

.infotimeCheckOff{
	
	background: url('//www.saraminimage.co.kr/ui/join/bg_check_bullet.png')
		no-repeat 0 0px;
	
}

.infotimeCheckOn{
	
	background: url('//www.saraminimage.co.kr/ui/join/bg_check_bullet.png')
		no-repeat 0 -30px;
	
}

.cpm_infotime{
	display: none;
}

.cpm_hideSpan{
	display: inline-block;
	height:30px;
}


</style>
</head>
<body>
	<div id=joinContainer>
		<div id="header">
			<a href="joinResult.jsp"><img src="img/test.png"></a>
		</div>
		<div id="joinCategory">
			<ul class="joinCategory">
				<li class="">
					<h2 class="tab01">
						<a href="#" class="tabBtn"><strong>개인회원가입</strong>만 15세 이상 가능
						</a>
					</h2>
				</li>
				<li class="on">
					<h2 class="tab02">
						<a href="CompanyJoinForm.do" class="tabBtn"><strong>기업회원가입</strong></a>
					</h2>
				</li>
			</ul>
		</div>
		<form action="CompanyjoinResult.do" name="joinForm" method="post" enctype="application/x-www-form-urlencoded">
			<div id="joinContent">
				<h3>
					<span>ID/PW</span>
				</h3>
				<input name="cpm_id" id="cpm_id" type="text" placeholder="아이디">
				<span id="cpm_hideIdSpan" class="cpm_hideSpan"></span>
				<input name="cpm_pw" id="cpm_pw" type="password" placeholder="비밀번호">
				<span id="cpm_hidePwSpan" class="cpm_hideSpan"></span>
				
				<h3>
					<span>기업인증</span>
				</h3>
				<input name="cpm_num" id="cpm_num" class="cpm_num" type="text" placeholder="사업자 등록 번호">
				<span id="cpm_hideNumSpan" class="cpm_hideSpan"></span> 
				
				<select id="cpm_type" name="cpm_type" class="cpm_type">
					<option>기업 분류</option>
					<option>일반</option>
					<option>인재파견</option>
					<option>헤드헌팅</option>
				</select>
				<span id="cpm_hideTypeSpan" class="cpm_hideSpan"></span>
				
				<h3>
					<span>약관동의</span>
				</h3>
				<div id="consent">
					<ul>
						<li id="allCheck">전체동의<input name="allConsent" id="allConsent" type="checkbox"><label
							for="allConsent" class="mustCheckoff"></label></li>
						<li class="must">개인회원 약관에 동의<input class="consent" name="ruleConsent" id="ruleConsent"
							type="checkbox" value="y"><label for="ruleConsent" class="mustCheckoff"></label><a
							href="#" class="detailView">상세보기</a></li>
						<li class="must">개인정보 수집 및 이용에 동의<input class="consent" name="takeConsent" id="takeConsent"
							type="checkbox" value="y"><label for="takeConsent" class="mustCheckoff"></label><a
							href="#" class="detailView">상세보기</a></li>
						<li>마케팅 정보 수신 동의 - 이메일<input name="m_Isemail" class="consent" id="m_Isemail"
							type="checkbox" value="y"><label for="m_Isemail" class="mustCheckoff"></label></li>
						<li>마케팅 정보 수신 동의 - SMS/MMS<input name="m_Isphone" class="consent" id="m_Isphone"
							type="checkbox" value="y"><label for="m_Isphone" class="mustCheckoff"></label></li>
						<li>개인정보 제 3자 제공 및 위탁사항 이용약관 <input name="m_Isforeign" class="consent" id="m_Isforeign"
							type="checkbox" value="y"><label for="m_Isforeign" class="mustCheckoff"></label><a
							href="#" class="detailView">상세보기</a></li>
					</ul>
				</div>
				
				<div id="cmp_infotimeDiv"  class="cmp_infotimeDiv">
					<span class="cmp_infotitleSpan">정보보유기간</span>
					<input type="radio" id="cpm_infotime1" name="cpm_infotime" class="cpm_infotime" value="1년">
					<label class="cpm_infotimeLabel infotimeCheckOff" for="cpm_infotime1"></label><span class="cmp_infoContentSpan">1년</span>
					<input type="radio" id="cpm_infotime2" name="cpm_infotime" class="cpm_infotime" value="3년">
					<label class="cpm_infotimeLabel infotimeCheckOff" for="cpm_infotime2"></label><span class="cmp_infoContentSpan">3년</span>
					<input type="radio" id="cpm_infotime3" name="cpm_infotime" class="cpm_infotime" value="5년">
					<label class="cpm_infotimeLabel infotimeCheckOff" for="cpm_infotime3"></label><span class="cmp_infoContentSpan">5년</span>
					<input type="radio" id="cpm_infotime4" name="cpm_infotime" class="cpm_infotime" value="탈퇴시">
					<label class="cpm_infotimeLabel infotimeCheckOff" for="cpm_infotime4"></label><span class="cmp_infoContentSpan">탈퇴시</span>
				</div>
				
				<div class="joinDiv">
					<input class="joinBtn" type="submit" value="회원가입 완료">
				</div>
			</div>
		</form>
	</div>
</body>
</html>