<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>internWriteForm</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#internsave").click(function() {
		if($("#rsitType option:selected").val() == "활동구분"){
			alert("활동구분 선택하세요.");
			$("#rsitType").focus();	
		}else if(!$("#rsitCompany").val()){
			alert("회사,기관명을 입력하세요.");
			$("#rsitCompany").focus();	
		}else if(!$("#rsitStartdate").val()){
			alert("시작년월을 입력하세요.");
			$("#rsitStartdate").focus();
		}else if(!$("#rsitEnddate").val()){
			alert("종료년월을 입력하세요.");
			$("#rsitEnddate").focus();	
		}else if(!$("#rsitContent").val()){
			alert("활동내용을 입력하세요.");
			$("#rsitContent").focus();	
		}else {
			window.open("internWrite.jsp","", "width=500px height=500px");
			}
		});
		$("#internload").click(function() {
			window.open("internLoad.jsp", "", "width=500px height=500px");
		});
	});	
</script>
</head>
<body>
	<fieldset>
		<legend>인턴-대외활동</legend> 
		<div>
			<select name="rsitType" id="rsitType">				
				<option value="활동구분">---활동구분---</option>
				<option value="인턴">인턴</option>
				<option value="아르바이트">아르바이트</option>
				<option value="동아리">동아리</option>
				<option value="자원봉사">자원봉사</option>
			</select>
						
			<input type="text" id="rsitCompany" name="rsitCompany" placeholder="회사/기관/단체명" size="48">
			<input type="date" id="rsitStartdate" name="rsitStartdate" placeholder="시작년월" size="7">
			<input type="date" id="rsitEnddate" name="rsitEnddate" placeholder="종료년월" size="7">
		</div>
		<div>			
			<textarea id="rsitContent" name="rsitContent" placeholder="활동내용" cols="70" rows="5"></textarea>
		</div>		
		<div>
			<!-- <input type="submit" value="저장"> -->
			<input type="button" value="저장하기" id="internsave">
			<input type="button" value="불러오기" id="internload">
		</div>		
	</fieldset>
</body>
</html>