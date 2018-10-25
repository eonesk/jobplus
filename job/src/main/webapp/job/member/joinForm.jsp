<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

#joinContainer {
	/**border: 1px solid gray;*/
	width: 500px;
	margin: auto;
	margin-bottom:100px;
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

input[type=text],input[type=password],input[type=email],[type=tel] {
	display: inline-block;
	width: 100%;
	height: 50px;
}

#joinContent h3 {
	font-size: 22px;
	margin-top: 30px;
	margin-bottom: 10px;
}
#join
</style>
</head>
<body>
	<div id=joinContainer>
		<div id="header">
			<a href="#"><img src="img/test.png"></a>
		</div>
		<div id="joinCategory">
			<ul class="joinCategory">
				<li class="on">
					<h2 class="tab01">
						<a href="#" class="tabBtn"> <strong>개인회원가입</strong>만 15세 이상 가능
						</a>
					</h2>
				</li>
				<li class="">
					<h2 class="tab02">
						<a href="#" class="tabBtn"> <strong>기업회원가입</strong></a>
					</h2>
				</li>
			</ul>
		</div>
		<div id="joinContent">
			<h3>
				<span>ID/PW</span>
			</h3>
			<input name="M_id" id="M_id" type="text" placeholder="아이디"> 
			<input name="M_pw" id="M_pw" type="password" placeholder="비밀번호">

			<h3>
				<span>이름</span>
			</h3>
			<input name="M_name" id="M_name" type="text" placeholder="이름"> 
		
			<h3>
				<span>성별</span>
			</h3>
			<label><input type="radio" name="M_gender" value="남자">남자</label>
			<label><input type="radio" name="M_gender" value="여자">여자</label>
			
			<h3>
				<span>집전화</span>
			</h3>
			<input name="M_homeNum" id="M_homeNum" type="tel" placeholder="집전화">
			
			<h3>
				<span>휴대전화</span>
			</h3>
			<input name="M_phone" id="M_phone" type="tel" placeholder="휴대전화"> 
			
			<h3>
				<span>생년월일</span>
			</h3>
			<input name="M_birth" id="M_birth" type="text" placeholder="YYMMDD">
			
			<h3>
				<span>이메일</span>
			</h3>
			<input name="M_email" id="M_email" type="email" placeholder="id@email">
			
			<h3>
				<span>주소</span>
			</h3>
			<input name="M_address1" id="M_address1" type="text" placeholder="주소지">
			<input name="M_address2" id="M_address2" type="text" placeholder="상세주소지">
		</div>
	</div>
</body>
</html>