<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#internWriteForm").bind("submit", function() {
			if(!$("#rsitCompany").val()){
				alert("회사,기관명을 입력하세요.");
				$("rsitCompany").focus();
				return false;
			}
			if(!$("#rsitStartdate").val()){
				alert("시작년월을 입력하세요.");
				$("rsitStartdate").focus();
				return false;
			}
			if(!$("#rsitEnddate").val()){
				alert("종료년월을 입력하세요.");
				$("rsitEnddate").focus();
				return false;
			}
			setTimeout(function() {
				alert("저장되었습니다.");
			}, 3000);			
			return false;
		});
	});
</script>
</head>
<body>
<form action="Write.do" method="post" id="internWriteForm">
	<fieldset>
		<legend>인턴-대외활동</legend> 
		<div>
			<select name="rsitType" id="rsitType">				
				<option>---활동구분---</option>
				<option value="인턴">인턴</option>
				<option value="아르바이트">아르바이트</option>
				<option value="동아리">동아리</option>
				<option value="자원봉사">자원봉사</option>
			</select>
			
			<input type="text" id="rsitCompany" name="rsitCompany" placeholder="회사/기관/단체명" size="48">
			<input type="text" id="rsitStartdate" name="rsitStartdate" placeholder="시작년월" size="7">
			<input type="text" id="rsitEnddate" name="rsitEnddate" placeholder="종료년월" size="7">
		</div>
		<div>			
			<textarea id="rsitContent" name="rsitContent" placeholder="활동내용" cols="70" rows="5"></textarea>
		</div>
		<div>
			<!-- <input type="submit" value="저장"> -->
			<input type="submit" value="저장">
			<input type="button" value="불러오기">
		</div>		
	</fieldset>
</form>
</body>
</html>