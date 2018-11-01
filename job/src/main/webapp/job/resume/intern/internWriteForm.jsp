<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>internWriteForm</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">	
var count = 0;
/* 	$(function() {
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
			window.open("internWrite.jsp", "", "width=500px height=500px");
			}
		});
		$("#internload").click(function() {
			window.open("internLoad.jsp", "", "width=500px height=500px");
		});		
	});	 */	
	$(function() {
		$("#internsave").click(function() {
		if($("#rsitType").val() == "활동구분"){
			alert("활동구분 선택하세요.");
			$("#rsitType").focus();	
			return false;
		}
		if(!$("#rsitCompany").val()){
			alert("회사,기관명을 입력하세요.");
			$("#rsitCompany").focus();	
			return false;
		}
		if(!$("#rsitStartdate").val()){
			alert("시작년월을 입력하세요.");
			$("#rsitStartdate").focus();
			return false;
		}
		if(!$("#rsitEnddate").val()){
			alert("종료년월을 입력하세요.");
			$("#rsitEnddate").focus();	
			return false;
		}
		if(!$("#rsitContent").val()){
			alert("활동내용을 입력하세요.");
			$("#rsitContent").focus();	
			return false;
		}
		window.open("internWrite.jsp", "", "width=500px height=500px");
		});
	});
	$(function() {
		$("#internload").click(function() {
			window.open("internLoad.jsp", "", "width=500px height=500px");
		});
	});		
		
	$(function() {		
		$("#internplus").click(function() {
			count++;
			alert("추가"+count);
			if(count >= 3){
				alert("항목추가는 최대 3개까지만 추가가능합니다.")
				return false;
			}
			var clone = $("#t").clone(true);
			clone.find('*[id]').each(function () {					
				$(this).attr("id",$(this).attr("id") + count);
			});
			clone.insertAfter("#t");
		});
		/**
		$("#internplus").on("click", function(e) {			
			/*  
			clone() :DOM요소를 카피해 새롭게 작성.
			clone(true) : DOM요소를, 그 요소가 가지는 이벤트도 포함해 카피한다. 			
			/*var c = $("#t").clone(true);
			$("#t").append(c);					
			
			if(count >= 3){
				alert("항목추가는 최대 3개까지만 추가가능합니다.")
				return false;
			}
			$("#t").clone().insertAfter("#t").attr("id", "t"+count);
			count++;
		}); */
		$(function() {
			$(".interndelete").on("click", function() {	
				alert("삭제"+conut);
				$(".interndelete").parents(".t").remove();				
				alert("삭제됨?"+conut);
				count--;
			});
		});	
	});			
</script>
<style type="text/css">
.write {
	height: 100%;
    width: 100%;
    background-color: #e8ecef;
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
.internsave, .internload {
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
.internsave:hover, .internload:hover {
    background-color: #2E9AFE;
}
.internplus, .interndelete {
	width: 100%;
	height: 50px;
	background-color: #fff;
    border: 1px solid #5882FA;
    color: #5882FA;
    text-align: center;
    text-decoration: none;
    font-size: 15px;
    display: inline-block;
    cursor: pointer;
}
.rsitType {
	width:100px;
	height:35px;
}
.rsitCompany {
	width:200px;
	height:28px;
}
.rsitStartdate {
	width: 120px;
	height: 30px;
}
.rsitEnddate {
	width: 120px;
	height: 30px;
}
</style>
</head>
<body class="write">
	<fieldset>
		<p class="title">인턴&middot;대외활동</p>
		<div id="t" class="t">
			<br>
			<select name="rsitType" id="rsitType" class="rsitType" >				
				<option value="활동구분">---활동구분---</option>
				<option value="인턴">인턴</option>
				<option value="아르바이트">아르바이트</option>
				<option value="동아리">동아리</option>
				<option value="자원봉사">자원봉사</option>
			</select>
			<input type="hidden" id="#rsitSeq">			
			<input type="text" id="rsitCompany" name="rsitCompany" class="rsitCompany" placeholder="회사/기관/단체명">
			<input type="date" id="rsitStartdate" name="rsitStartdate" class="rsitStartdate">
			<input type="date" id="rsitEnddate" name="rsitEnddate" class="rsitEnddate">
			<div class="content">			
				<textarea id="rsitContent" name="rsitContent" placeholder="활동내용" cols="85" rows="7"></textarea>
			</div>		
			<div>
				<!-- <input type="submit" value="저장"> -->
				<input type="button" value="저장하기" id="internsave" class="internsave">
				<input type="button" value="불러오기" id="internload" class="internload">
			</div>				
			<input type="button" value="삭제" id="interndelete" class="interndelete">	
		</div>
	</fieldset>
	<input type="button" value="추가" id="internplus" class="internplus">	
</body>
</html>