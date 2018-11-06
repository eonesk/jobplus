<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집요강</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {	
		$("#Type_radio_o").on("click", function() {
			document.getElementById("Type").style.display = "inline";						
		});
		$("#Type_radio_x").on("click", function() {
			document.getElementById("Type").style.display = "none";						
		});
		
		$("#rmi_Official").on("click", function() {			
			window.open("/job/job/recruitment/introduction/introOfficial.jsp", "", 'width=650px, height=650px, left=450, top=30, toolbar=no');
		});
		
		$("#next").on("click", function() {
			if (!$("#rmi_Personnel").val()) {
				alert("모집인원을 입력하세요.");
				$("#rmi_Personnel").focus();
				return false;
			}
			if($("#Type_radio_o").is(":checked")) { 
				if (!$("#rmi_Type").val()) { 			
				alert("모집분야를 입력하세요.");
				$("#rmi_Type").focus();
				return false;
				}
			}				
			if (!$("#rmi_Work1").val()) {
				alert("담당업무를 입력하세요.");
				$("#rmi_Work1").focus();
				return false;
			}
			if (!$("#rmi_Work2").val()) {
				alert("담당업무를 입력하세요.");
				$("#rmi_Work2").focus();
				return false;
			}
			if (!$("#rmi_Work3").val()) {
				alert("담당업무를 입력하세요.");
				$("#rmi_Work3").focus();
				return false;
			}
			if (!$("#rmi_Department").val()) {
				alert("근무부서를 입력하세요.");
				$("#rmi_Department").focus();
				return false;
			}
			if (!$("#rmi_Official").val()) {
				alert("직급/직책을 입력하세요.");
				$("#rmi_Official").focus();
				return false;
			}
			window.open("/job/job/recruitment/introduction/introWrite.jsp", "", "width=500px height=500px");
		});
	});
</script>
<style type="text/css">
.write {
	position: absolute; 
    margin: -150px 0 0 -75px;
    top: 25%;
    left: 30%;
    overflow: scroll;
}
.p1 {
	text-align: center;
	font: 30px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: 500;
}
.p2 {
	text-align: left;
	font: 22px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: bold;
}
span {
	color: #FF8000;
}
hr {
	width: 800px;
}
.rmi_Personnel {
	margin-left: 92px;
	width:40px;
	height:30px;
	text-align: center;
	background-color: #e8ecef;
}
.rmi_Personnel:hover {
	background-color: white;
}
.Type_radio {
	margin-left: 70px;
	width:50px;
	height:20px;
	text-align: center;
	background-color: #e8ecef;
}
.rmi_Type {
	margin-left: 168px;
	width:400px;
	height:30px;
	background-color: #e8ecef;
}
.rmi_Type:hover {
	background-color: white;
}
.p3, .p5, .p6, .p7 {
	margin-left: 10px;
}
.p4 {
	margin-left: 170px;
	color: #A4A4A4;
}
.rmi_Work {
	margin-left: 98px;
	width:400px;
	height:30px;
	background-color: #e8ecef;
	margin: 5px;
}
.rmi_Work {
	margin-left: 157px;
}
#rmi_Work1 {
	margin-left: 88px;
}
.rmi_Work:hover {
	background-color: white;	
}
.rmi_Department {
	margin-left: 88px;
	width:400px;
	height:30px;
	background-color: #e8ecef;
}
.rmi_Department:hover {
	background-color: white;		
}
.rmi_Official {
	margin-left: 82px;
	width:400px;
	height:80px;
	background-color: white;
}
.next {
	margin-top: 10px;
	margin-left:580px;
	margin-bottom: 30px;
	width: 180px;
	height: 60px;
	font-size: 18px;
	font-weight: bold;
	background-color: #2E2E2E;
	color: white;
	border: 0;
}
.next:hover {
	background-color: black;
}
</style>
</head>
<body class="write">
	<input type="hidden" id="rmi_Seq" class="rmi_Seq">
	<div>
		<p class="p1">바쁘시더라도 필수는 꼭 입력하세요. (<span>&lowast;</span>표시)</p>	
		<p class="p2">모집요강</p>
		<hr>
	</div>
	<p><span>&lowast;모집인원</span>
		<input type="number" min="0" max="100" id="rmi_Personnel" class="rmi_Personnel"> 명</p>
		<hr>
	<p class="p3">모집분야	
		<input type="radio" id="Type_radio_x" class="Type_radio" name="Type_radio" value="0" checked> 미입력 
  		<input type="radio" id="Type_radio_o" class="Type_radio" name="Type_radio" value="1"> 입력  </p>
  	<div id="Type" class="Type" style="display: none;">  		
  		<input type="text" id="rmi_Type" class="rmi_Type">
  		<p class="p4">※모집분야는 지원자가 발생 시 <span>수정이 불가</span>하니, 신중히 작성해주세요.</p>
  	</div>
	<hr>
	<p class="p5">담당업무	
	<input type="text" id="rmi_Work1" class="rmi_Work" placeholder="예)홍보프로그램 운영 및 관리"><br> 
	<input type="text" id="rmi_Work2" class="rmi_Work" placeholder="예)입금 관리 및 정산"><br>
	<input type="text" id="rmi_Work3" class="rmi_Work" placeholder="예)구체적인 업무를 작성하시면, 허수지원자가 줄어듭니다."></p>
	<hr>
	<p class="p6">근무부서
	<input type="text" id="rmi_Department" class="rmi_Department" placeholder="근무부서명이 명확하면, 적합한 인재와의 만남이 빨라집니다."></p>
	<hr>
	<p class="p7">직급/직책
	<input type="text" id="rmi_Official" class="rmi_Official"> </p>
	<input type="button" id="next" class="next" value="다음">
</body>
</html>