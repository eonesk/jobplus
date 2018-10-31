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
<style type="text/css">
.write {
    background-color: #e8ecef;
}
body {
	height: 100%;
    width: 100%;
    font: 12px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
    color: #666;
    letter-spacing: -1px;
    padding: 0;
    margin: 0;
}
.title {
	font: 24px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: bold;
	color: #2A120A;
}
fieldset {
	background-color: #FFFFFF;
}
.content {
	padding-top: 5px;
}
#internsave, #internload {
	width:80px;
    background-color: #5882FA;
    border: none;
    color:#fff;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
}
#internsave:hover, #internload:hover {
    background-color: #2E9AFE;
}
</style>
</head>
<body class="write">
	<fieldset>
		<p class="title">인턴·대외활동</p> 
		<div>
			<select name="rsitType" id="rsitType" style="width:100px;height:35px;" >				
				<option value="활동구분">---활동구분---</option>
				<option value="인턴">인턴</option>
				<option value="아르바이트">아르바이트</option>
				<option value="동아리">동아리</option>
				<option value="자원봉사">자원봉사</option>
			</select>
						
			<input type="text" id="rsitCompany" name="rsitCompany" placeholder="회사/기관/단체명" style="width:200px;height:28px;">
			<input type="date" id="rsitStartdate" name="rsitStartdate" style="width: 120px;height: 30px;">
			<input type="date" id="rsitEnddate" name="rsitEnddate" style="width: 120px;height: 30px;">
		</div>
		<div class="content">			
			<textarea id="rsitContent" name="rsitContent" placeholder="활동내용" cols="85" rows="7"></textarea>
		</div>		
		<div>
			<!-- <input type="submit" value="저장"> -->
			<input type="button" value="저장하기" id="internsave">
			<input type="button" value="불러오기" id="internload">
		</div>		
	</fieldset>
</body>
</html>