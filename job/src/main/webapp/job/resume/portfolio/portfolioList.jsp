<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
// $( document ).ready(function() {
	
// });

	/**
	type: 파일구분
	tilte: 제목
	filename: 파일이름
	*/
	
	$(function() {
		
	});
	
	function test(rowData) {
		alert("부모창 ");
		alert("rowData : " + rowData);
	}
	
	
	function addList(type, tilte, filename) {
		var a = $('#파일구분').val();
		var b = $('#파일 라디오박스').val();
		var c = $('#파일 이름').val();
		//새로 리스트 작성되는 li태그 객체
		var new_li = $("<li>");
		new_li.attr("file_num", num);
		new_li.addClass("file");
		//<p>태그 
		var type_p = $("<p>");
		type_p.addClass("file_item");
		//<span>태그 - 파일구분  2
		var type_span = $("<span>");
		type_span.addClass("type");
		type_span.html("[" + type + "]");
		//<span>태그 - 포트폴리오 타이틀  3
		var title_span = $("<span>");
		title_span.html(title);
		//삭제버튼  4
		var del_input = $("<input>");
		del_input.attr({
			"type" : "button",
			"value" : "삭제"
		});
		del_input.addClass("delete_btn");
		//
		var filename_a = $("<a>");
		filename_a.html(filename); 
		
		//조립하기
		type_p.append(type_span).append(title_span).append(del_input);
		new_li.append(type_p).append(filename_a);
		$("ul#portfolio_list").append(new_li);
	}
	/**내용넣기*/
	
</script>
<style type="text/css">
.subtitle {
	font: 20px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: bold;
	color: #2A120A;
	letter-spacing: -1px;
}
/* #portfolio_area { */
/*     position: relative; */
/*     margin-bottom: 40px; */
/*     min-height: 80px; */
/*     background: #fff; */
/*     box-sizing: border-box; */
/*     box-shadow: 1px 1px 2px 1px rgba(0,0,0,0.1); */
/*     font-size: 0; */
/* } */
.button {
	width:100px;
    background-color: #5882FA;
    border: none;
    color:#fff;
    padding: 10px 0;
    text-align: center;
    display: inline-block;
    font-size: 13px;
    margin: 20px 0px 0px 0px;
    cursor: pointer;
}
.button:hover {
    background-color: #2E9AFE;
}
</style>
</head>
<body>
<form id="portfolioList">
<div>

	
<div id="portfolio_area">
	<p class="subtitle">포트폴리오 및 기타문서</p>
	<div>
		<button type="button" class="button" onclick="window.open('portfolioWriteForm.jsp','portfolioWriteForm','width=500, height=350, left=300, top=200')">등록</button>
		<button type="button" class="button" onclick="window.open('portfolioLoad.do','portfolioLoad','width=500, height=700, left=300, top=200')">내 파일함</button>
	</div>	
		<ul id="portfolio_list">
	<!-- 	동적요소 생성 -->
	<table border="1">
		<tr>
			<td>타이틀</td>
			<td>파일구분</td>
			<td>파일이름 a및 URL</td>
		</tr>
		<tr>
			<td id="rsprTitle">
			</td>
		</tr>
		
	</table>
	
	
<%-- 			<c:forEach var ='ls' items="${list }"> --%>
<!-- 			<li file-num="4" class="file">  -->
<!-- 				<p class="comment_item">  -->
<!-- 					<span class="type">[이력서 구분]</span>   -->
<%-- 					<span>${ls.rspf_Usertitle}</span> --%>
<!-- 					<input type="button" value="삭제하기" class="delete_btn"> -->
<!-- 				</p> -->
<!-- 				<a> 파일이름 및 URL 주소 </a> -->
<!-- 			</li>  -->
<%-- 			</c:forEach> --%>
<!-- 			<div diplay:none> -->
<!-- 				<input type='text' id='파일구분' value = '' /> -->
<!-- 				<input type='text' id='파일 라디오박스' value = '' /> -->
<!-- 				<input type='text' id='파일이름' value = '' /> -->
<!-- 				<button onclick="addList();">버튼입네당</button> -->
<!-- 			</div> -->
		</ul>
	</div>
</div>
</form>

</body>
</html>