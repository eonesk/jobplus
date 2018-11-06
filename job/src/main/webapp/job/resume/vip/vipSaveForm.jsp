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
			
		
		
		var rsv_isMedal = "n";  
		var rsv_isProtect ="n"; 
		var rsv_isMoney ="n";  
		var rsv_isDisable="n";
		
		
		if($("#rsv_isMedal", opener.document).html() == "대상"){
			rsv_isMedal="y";
		}
		if($("#rsv_isProtect", opener.document).html() == "대상"){
			rsv_isProtect="y"; 
		}
		if($("#rsv_isMoney", opener.document).html() == "대상"){
			rsv_isMoney="y";
		}
		if($("#rsv_isDisable", opener.document).html() == "대상"){
			rsv_isDisable="y";
		}
		
		var rsv_military = $("#rsv_military", opener.document).html();
		var rsv_startDate = $("#rsv_startDate", opener.document).val();
		var rsv_endDate = $("#rsv_endDate", opener.document).val();
		var rsv_position = $("#rsv_position", opener.document).html();
		
		
		
		
		
		alert(rsv_isMedal + " // " + rsv_isProtect + " // " + rsv_isMoney + " // "
				+ rsv_isDisable + " // " + rsv_military + " // " + rsv_startDate 
				+ " // " + rsv_endDate + " // " + rsv_position); 
		
		
		$("#saveOk").click(function() {
			if(!$("#saveName").val()) {
				alert("자기소개서 제목을 입력해주세요");
				$("#saveName").focus();
				return false;
			}
			
			var rsv_userTitle = $("#saveName").val();
			
			$.ajax({
				type: 'POST',
				url: 'rsvSave.do',
				dataType: 'text',
				data: {
					"rsv_isMedal": rsv_isMedal,
					"rsv_isProtect": rsv_isProtect,
					"rsv_isMoney": rsv_isMoney,
					"rsv_isDisable": rsv_isDisable,
					"rsv_military": rsv_military,
					"rsv_startDate": rsv_startDate,
					"rsv_endDate": rsv_endDate,
					"rsv_position": rsv_position,
					"rsv_userTitle": rsv_userTitle
				},
				success: function(data) {
					if(data > 0) {
						alert("성공");
						$("#rsv__Seq", opener.document).val(data);
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