<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
	#saveContainer{
		width:400px;
	}
	#saveHeader,#saveSection,#saveFooter{
		
	}
	
	#saveHeader{
		height:40px;
		background-color:  #3C53AF;
		text-align: center;
		color:white;
		font-weight: bold;
		font-size:20px;
		padding-top:15px;
	}
	
	#saveSection{
		height:180px;
		text-align: center;
	}
	#saveSection p{
		color:lightgray;
	}
	
	#saveSection input{
		width:60%;
		height:40px;
	}
	
	#saveFooter{
		height:80px;
		text-align: center;
	}
	
	#saveFooter button{
		width:180px;
		height:50px;
		background-color: white;
		border:1px solid lightgray;
		border-radius:1.0em;
	}
	
	#saveOk{
		color:#607CEA;
		border:#607CEA;
	}
</style>
<script type="text/javascript">
	$(function(){
	
		var rsw_company = $("#rsw_company" +"${param.numberRing}", opener.document).val();
		var rsw_dept = $("#rsw_dept" +"${param.numberRing}", opener.document).val();
		var rsw_startDate = $("#rsw_startDate" +"${param.numberRing}", opener.document).val();
		var rsw_endDate = $("#rsw_endDate" +"${param.numberRing}", opener.document).val();
		var rsw_position = $("#rsw_position"+"${param.numberRing}", opener.document).val();
		var rsw_job = $("#rsw_job"+"${param.numberRing}", opener.document).val();
		var rsw_pay = $("#rsw_pay"+"${param.numberRing}", opener.document).val();
		var rsw_part = $("#rsw_part"+"${param.numberRing}", opener.document).val();
		var rsw_isNow = $("#rsw_isNow"+"${param.numberRing}",opener.document).val();
		var rsw_career = $("#rsw_career", opener.document).val();
		
		
		
		$("#saveOk").click(function() {
			if(!$("#saveName").val()) {
				alert("자기소개서 제목을 입력해주세요");
				$("#saveName").focus();
				return false;
			}
			
			var rsw_userTitle = $("#saveName").val();
			
			$.ajax({
				type: 'POST',
				url: 'rswSave.do',
				dataType: 'text',
				data: {
					"rsw_company": rsw_company,
					"rsw_dept": rsw_dept,
					"rsw_startDate": rsw_startDate,
					"rsw_endDate": rsw_endDate,
					"rsw_job": rsw_job,
					"rsw_position": rsw_position,
					"rsw_pay": rsw_pay,
					"rsw_part": rsw_part,
					"rsw_isNow": rsw_isNow,
					"rsw_career": rsw_career,
					"rsw_userTitle": rsw_userTitle
				},
				success: function(data) {
					if(data > 0) {
						alert("성공");
						$("#rsw__Seq"+"${param.numberRing}", opener.document).val(data);
						window.close();
					} else {
						alert("실패");
					}
				}
			});
		});
		
		$("#saveCancle").click(function() {
			window.close();
		});
	});
	
</script>
</head>
<body>
<div id="saveContainer">
	<div id="saveHeader">
		저장하기
	</div>
	<div id="saveSection">
		<h3>저장 하는 방법</h3>
		<p>저장 할 이름을 입력후 아래 저장 버튼을 누르세요</p>
		<input type="text" id="saveName" name="saveName">
	</div>
	<div id="saveFooter">
		<button type="button" id="saveCancle">취소</button>
		<button type="button" id="saveOk">확인</button>
	</div>
</div>
</body>
</html>