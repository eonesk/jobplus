<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function() {
	//id 속성이 join인 <form>태그 안의 submit 버튼을 누른 경우
	$("form[name='joinForm']").submit(function() {
		//$(input요소).val() 는 사용자가 입력한 값을 리턴한다.
		if(!$("input[name='m_Id']").val()){
			alert("아이디를 입력하세요.");
			$("input[name='m_Id']").focus();
			return false;
		}
		/**비밀번호 입력 검사 */
		if(!$("input[name='m_Pw']").val()){
			alert("비밀번호를 입력하세요.");
			$("input[name='m_Pw']").focus();
			return false;
		}
		if(!$("input[name='m_Name']").val()){
			alert("이름을 입력하세요.");
			$("input[name='m_Name']").focus();
			return false;
		}
		/**라디오버튼 선택여부 검사 */
		//!$("라디오버튼CSS셀렉터").is("checked") --> 체크일 경우 : true
		if(!$("input[name='m_Gender']").is(":checked")){
			alert("성별을 입력하세요.");
			$("input[name='m_Gender']:eq(0)").focus();
			return false;
		}
		/**이메일주소 입력여부 검사 */
		if(!$("input[name='m_Email']").val()){
			alert("이메일주소를 입력하세요.");
			$("input[name='m_Email']").focus();
			return false;
		}
		
		if(!$("input[name='m_Address1']").val()){
			alert("주소를 입력하세요.");
			$("input[name='m_Address1']").focus();
			return false;
		}
		
		if(!$("input[name='m_Address2']").val()){
			alert("상세주소를 입력하세요.");
			$("input[name='m_Address2']").focus();
			return false;
		}
		
		/**핸드폰번호 입력여부 검사 */
		if(!$("input[name='m_Phone']").val()){
			alert("핸드폰번호를 입력하세요.");
			$("input[name='m_Phone']").focus();
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
		}else{
			$(this).next().addClass("mustCheckoff");
			$(this).next().removeClass("mustCheckon");
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
		}
		$("#allConsent").prop("checked",is_check);
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

input[type=text], input[type=password], input[type=email],[type=tel] {
	display: inline-block;
	width: 100%;
	height: 50px;
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
	/* display: none; */
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
</style>
</head>
<body>
	<div id=joinContainer>
		<div id="header">
			<a href="joinResult.jsp"><img src="img/test.png"></a>
		</div>
		<div id="joinCategory">
			<ul class="joinCategory">
				<li class="on">
					<h2 class="tab01">
						<a href="#" class="tabBtn"><strong>개인회원가입</strong>만 15세 이상 가능
						</a>
					</h2>
				</li>
				<li class="">
					<h2 class="tab02">
						<a href="CompanyJoinForm.do" class="tabBtn"><strong>기업회원가입</strong></a>
					</h2>
				</li>
			</ul>
		</div>
		<form action="joinResult.do" name="joinForm" method="post" enctype="application/x-www-form-urlencoded">
			<div id="joinContent">
				<h3>
					<span>ID/PW</span>
				</h3>
				<input name="m_Id" id="m_Id" type="text" placeholder="아이디">
				<input name="m_Pw" id="m_Pw" type="password" placeholder="비밀번호">

				<h3>
					<span>이름</span>
				</h3>
				<input name="m_Name" id="m_Name" type="text" placeholder="이름">

				<h3>
					<span>성별</span>
				</h3>
				<label><input type="radio" name="m_Gender" value="남자">남자</label>
				<label><input type="radio" name="m_Gender" value="여자">여자</label>

				<h3>
					<span>집전화</span>
				</h3>
				<input name="m_Homenum" id="m_Homenum" type="tel" placeholder="집전화">

				<h3>
					<span>휴대전화</span>
				</h3>
				<input name="m_Phone" id="m_Phone" type="tel" placeholder="휴대전화">

				<h3>
					<span>생년월일</span>
				</h3>
				<input name="m_Birth" id="m_Birth" type="text" placeholder="YYYYMMDD">

				<h3>
					<span>이메일</span>
				</h3>
				<input name="m_Email" id="m_Email" type="email"
					placeholder="id@email">

				<h3>
					<span>주소</span>
				</h3>
				<input name="m_Address1" id="m_Address1" type="text"
					placeholder="주소지"> <input name="m_Address2" id="m_Address2"
					type="text" placeholder="상세주소지">

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
				<div class="joinDiv">
					<input class="joinBtn" type="submit" value="회원가입 완료">
				</div>
			</div>
		</form>
	</div>
</body>
</html>