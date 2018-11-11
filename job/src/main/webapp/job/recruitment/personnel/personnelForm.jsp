<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#rmp_selectEmail").change(function() { 
			if ($(this).val() == "직접입력") {
				$("#rmp_inputEmail2").val("");
			} else {
				$("#rmp_inputEmail2").val($(this).val());
			}
		});

	});
</script>
<style type="text/css">

.rmp_container div {
	border-collapse: collapse;
}

.rmp_container input {
	background-color: ghostwhite;
	border-radius: 3px;
	border: 1px solid lightgray;
	height: 40px;
}

.rmp_container {
/* 	width: 860px; */
	width: 740px;
	margin: 50px;
    position: relative;
    left: 8%;
}/*<-*/

.rmp_header {
	margin-bottom: 10px;
}

.rmp_lineOne {
	border-top: 1px solid black;
	padding-top: 10px;
	padding-bottom: 10px;
}

.rmp_lineOne div {
	display: inline-block;
}

.rmp_lineOne .rmp_lineOneTitle {
/* 	width: 207px; */
	width: 167px;
}

.rmp_lineOne .rmp_lineOneTitleLabel {
	padding-left: 10px;
}

.rmp_lineOne .rmp_lineOneContent label {
	padding-right: 8px;
	padding-left: 5px;
}

.rmp_lineOneTitleLabel {
	font-weight: bold;
	color: #ff5a00;
}

.rmp_name {
	width: 100px;
}

.rmp_lineOneContent {
	font-size: 14px;
}

.rmp_mustLabel {
	color: #ff5a00;
}

.rmp_lineTwo {
/* 	width: 860px; */
	width: 740px;
	height: 211px;
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	padding-top: 10px;
	padding-bottom: 5px;
}

.rmp_lineTwoTitle {
	padding-top: 10px;
	float: left;
/* 	width: 207px; */
	width: 170px;
	height: 100%;
}

.rmp_lineTwoTitleLabel {
	padding-left: 10px;
	margin-top: 10px;
	font-weight: bold;
	color: #ff5a00;
}

.rmp_lineTwoContent {
	height: 100%;
	float: left;
/* 	width: 653px; */
	width: 557px;
}

.rmp_lineTwoContentDiv {
	padding-bottom: 10px;
	padding-left: 10px;
	height: 20%;
	line-height: 20px;
}

.rmp_inputTel {
	width: 55px;
	margin-left: 5px;
	margin-right: 5px;
}

.rmp_inputEmail {
	width: 120px;
	margin-left: 5px;
	margin-right: 5px;
}

.rmp_inputLabel {
	display: inline-block;
	font-size: 14px;
	width: 60px;
}

.rmp_linTwoP {
	font-size: 13px;
	color: gray;
}

.rmp_selectEmail {
	display: inline-block;
	height: 45px;
	width: 120px;
	border-radius: 3px;
	border: 1px solid lightgray;
}
.rm_Title{
	height: 40px;
	width: 100%;
	margin-top: 10px;
	text-align: center;
	font-size: 18px;
}
</style>
</head>
<body>
<input type="hidden" id="rmp_name_hidden">
<input type="hidden" id="rmp_dept_hidden">
<input type="hidden" id="rmp_email_hidden">
<input type="hidden" id="rmp_phone1_hidden">
<input type="hidden" id="rmp_phone2_hidden">
	<div id="rmp_container" class="rmp_container">
		<div id="rmp_header" class="rmp_header">
			<h3>
				<strong>담당자 연락처</strong>
			</h3>
		</div>
		<div id="rmp_content" class="rmp_content">
			<div id="rmp_lineOne" class="rmp_lineOne">
				<div id="rmp_lineOneTitle" class="rmp_lineOneTitle">
					<label id="rmp_lineOneTitleLabel" class="rmp_lineOneTitleLabel">＊담당자</label>
				</div>
				<div id="rmp_lineOneContent" class="rmp_lineOneContent">
					<label for="rmp_name" id="rmp_nameLabel"
						class="rmp_mustLabel rmp_inputLabel rmp_nameLabel">이름</label> <input
						type="text" id="rmp_name" class="rmp_name" name="rmp_name">
					<label for="rmp_dept" id="rmp_deptLabel"
						class="rmp_inputLabel rmp_deptLabel">담당부서</label> <input
						type="text" id="rmp_dept" class="rmp_dept" name="rmp_dept">
				</div>
			</div>
			<div id="rmp_lineTwo" class="rmp_lineTwo">
				<div id="rmp_lineTwoTitle" class="rmp_lineTwoTitle">
					<label class="rmp_lineTwoTitleLabel">＊연락처</label>
				</div>
				<div id="rmp_lineTwoContent" class="rmp_lineTwoContent">
					<div id="" class="rmp_lineTwoContentDiv">
						<label class="rmp_mustLabel rmp_inputLabel">전화</label> <input
							type="text" class="rmp_tel1 rmp_inputTel" id="rmp_homeTel1"
							name="rmp_homeTel1">- <input type="text"
							class="rmp_tel2 rmp_inputTel" id="rmp_homeTel2"
							name="rmp_homeTel2">- <input type="text"
							class="rmp_tel2 rmp_inputTel" id="rmp_homeTel3"
							name="rmp_homeTel3"> <label class="rmp_inputLabel">내선번호</label>
						<input type="text" class="rmp_inputTel">
					</div>
					<div id="" class="rmp_lineTwoContentDiv">
						<label class="rmp_mustLabel rmp_inputLabel">휴대폰</label> <input
							type="text" class="rmp_tel1 rmp_inputTel" id="rmp_tel1"
							name="rmp_tel1">- <input type="text"
							class="rmp_tel2 rmp_inputTel" id="rmp_tel2" name="rmp_tel2">-
						<input type="text" class="rmp_tel2 rmp_inputTel" id="rmp_tel3"
							name="rmp_tel3">
					</div>
					<div id="" class="rmp_lineTwoContentDiv">
						<label class="rmp_mustLabel rmp_inputLabel">e메일</label> <input
							type="text" name="rmp_inputEmail1" id="rmp_inputEmail1"
							class="rmp_inputEmail">@ <input type="text"
							name="rmp_inputEmail2" id="rmp_inputEmail2"
							class="rmp_inputEmail"> <select id="rmp_selectEmail"
							class="rmp_selectEmail">
							<option value="직접입력">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="daum.net">daum.net</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="korea.com">korea.com</option>
						</select>
					</div>
					<div id="" class="rmp_lineTwoContentDiv rmp_linTwoP">
						※e메일을 통해 허위입사지원의 사례가 발생되고 있습니다. <br>사람인 온라인접수 선택 후 e메일을 비공개로
						등록해주시면 악용되는 경우가 방지됩니다.
					</div>
				</div>
			</div>
			<div>
					<input type="text" placeholder="채용공고 제목을 작성해주세요." id="rm_Title" class="rm_Title">
			</div>
		</div>
	</div>
</body>
</html>