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
		$("#mybtn").click(function() {
		if($("#rsit_Type option:selected").val() == "활동구분"){
			alert("활동구분 선택하세요.");
			$("#rsit_Type").focus();		
			return false;
		}
		if(!$("#rsit_Company").val()){
			alert("회사,기관명을 입력하세요.");
			$("#rsit_Company").focus();	
			return false;
		}
		if(!$("#rsit_Startdate").val()){
			alert("시작년월을 입력하세요.");
			$("#rsit_Startdate").focus();
			return false;
		}
		if(!$("#rsit_Enddate").val()){
			alert("종료년월을 입력하세요.");
			$("#rsit_Enddate").focus();	
			return false;
		}
		if(!$("#rsit_Content").val()){
			alert("활동내용을 입력하세요.");
			$("#rsit_Content").focus();		
			return false;
		}		
		window.open('internWrite.jsp','_blank', 'width=700, height=400, status=1, scrollbars=1, location=1');
		});			
	});	
</script>
</head>
<body>
<form action="Write.do" method="post" name="internWriteForm" id="internWriteForm">
	<fieldset>
		<legend>인턴-대외활동</legend> 
		<div>
			<select name="rsit_Type" id="rsit_Type">				
				<option value="활동구분">---활동구분---</option>
				<option value="인턴">인턴</option>
				<option value="아르바이트">아르바이트</option>
				<option value="동아리">동아리</option>
				<option value="자원봉사">자원봉사</option>
			</select>
						
			<input type="text" id="rsit_Company" name="rsit_Company" placeholder="회사/기관/단체명" size="48">
			<input type="date" id="rsit_Startdate" name="rsit_Startdate" placeholder="시작년월" size="7">
			<input type="date" id="rsit_Enddate" name="rsit_Enddate" placeholder="종료년월" size="7">
		</div>
		<div>			
			<textarea id="rsit_Content" name="rsit_Content" placeholder="활동내용" cols="70" rows="5"></textarea>
		</div>		
		<div>
			<!-- <input type="submit" value="저장"> -->
			<input type="button" value="저장하기" id="mybtn">
			<input type="button" value="불러오기">
			<!-- 			
			<script type="text/javascript" src="script/internScript.js"></script>
			<input type="button" value="새창" onclick="window.open('', '이력서 저장', 'width=700, height=400')">		
			<input type="button" value="저장하기" onclick="checkWrite()">
			 -->
		</div>		
	</fieldset>
</form>
</body>
</html>