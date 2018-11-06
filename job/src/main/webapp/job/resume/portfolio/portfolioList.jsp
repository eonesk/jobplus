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
function load_list(fileData) {
	var listcount = 0;
	$(function() {
// 		alert("부모창");
		var fileList = fileData.split('%');
		console.log("공백날리기~" +fileList[0]);
		//한 줄씩 가져오기
		for (var i = 1; i < fileList.length; i++) {
			console.log('fileList[' +i+ '] = ' + fileList[i]);	
			var file_parts = fileList[i].split('&');					

			var type, filename, urlname, title;					
			listcount++;
			var numbering = "_" + listcount;
// 			alert(listcount); 
// 			var findul = $( '#portfolio_list > li' ).length;
// 			alert("findul :: " + findul); 

			//리스트 내용 하나씩 자르기
			for (var j = 1; j < file_parts.length; j++) {
				console.log('file_parts[' +j+ '] = ' + file_parts[j]);							
		
				switch (j) {
				case 2:
					urlname = file_parts[2];
				case 3:
					filename = file_parts[3];
				case 4: 							
					type = file_parts[4];	
				case 6:
					title = file_parts[6];			
				default:
					break;
				}
			}
			
			var type_li = $("<li>");
			type_li.attr("id", "list_num" + numbering);
			var type_p = $("<p>");
			type_p.addClass("file_item");					
			var type_span = $("<span>");
			type_span.attr("id","type");
			var title_span = $("<span>");
			title_span.attr("id","title");
			var type_a = $("<a>");
			type_a.attr("id","pf_name");
			type_a.attr("href", filename);
			var type_aa = $("<a>");
			type_aa.attr("id","url_name");
			type_aa.attr("href","#");
			type_aa.attr("onclick","window.open('"+urlname+"')");
			var type_btn = $("<button>");
			type_btn.attr("type","button");	
			type_btn.addClass("remove");
			type_btn.attr("id","delete_btn"+i);
			type_btn.html("삭제");
			
			type_span.html(type);
			title_span.html(title);
			type_a.html(filename);
			type_aa.html(urlname);
			type_p.append(type_span);
			type_p.append(title_span);
			type_p.append(type_aa);
			type_p.append(type_a);
			type_p.append(type_btn);
			type_li.append(type_p);
			
// 			if(findul > 2){ 
// 				alert("3개가 넘어요");
// 				return false;
// 			}
			$("#portfolio_list").append(type_li);
		}
		$(".remove").click(function() {
			$(this).parents('li').remove();
		});
	});
}

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
button[class] {
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
button[class]:hover {
    background-color: #2E9AFE;
}
li.file {
    background-color: #f7f7f7;
    border: 1px solid #d9d3ff;
    width: 700px;
    list-style: none;
}
span.type {
    position: relative;
    left: 50px;
}
a.pf_name {
    position: relative;
    left: 130px;
}
#delete_btn {
    position: relative;
    left: 340px;
}
</style>
</head>
<body>
<form id="portfolioList">
<div>

	
<div id="portfolio_area">
	<p class="subtitle">포트폴리오 및 기타문서</p>
	<div>
		<button type="button" class="button" onclick="window.open('portfolioLoad.do','portfolioLoad','width=500, height=700, left=300, top=200')">내 파일함</button>
		<button type="button" class="button" onclick="window.open('portfolioWriteForm.jsp','portfolioWriteForm','width=460, height=300, left=300, top=200')">등록</button>		
	</div>	
		<ul id="portfolio_list">
	<!-- 	동적요소 생성 --> 
<!-- 			<li> -->
<!-- 				<p class="file_item"> -->
<!-- 					<span id="type">[샘플입니당]</span> -->
<!-- 					<span id="title" >애폴</span> -->
<!-- 					<a id="pf_name" href="#">apple.png</a> -->
<!-- 					<button type="button" class="remove" id="delete_btn1">삭제</button> -->
<!-- 				</p> -->
<!-- 			</li> -->
		</ul>
	</div>
</div>
</form>

</body>
</html>