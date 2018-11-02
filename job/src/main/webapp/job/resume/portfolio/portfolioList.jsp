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
			$(function() {
				alert("부모창");
				console.log(fileData);
				var fileList = fileData.split('%');
				console.log("공백날리기~" +fileList[0]);
				//한 줄씩 가져오기
				for (var i = 1; i < fileList.length; i++) {
					console.log('fileList[' +i+ '] = ' + fileList[i]);	
					var file_parts = fileList[i].split('/');					

					var type;
					var filename;
					var urlname;
					var title; 
					
					var type_li = $("<li>");					
					var type_p = $("<p>");
					type_p.addClass("file_item");					
					var type_span = $("<span>");
					type_span.attr("id","type"+i );
					var title_span = $("<span>");
					title_span.attr("id","title"+i );
					var type_a = $("<a>");
					type_a.attr("id","pf_name"+j);
					type_a.attr("href",)
					var type_btn = $("<button>");
					type_btn.attr("type","button");	
					type_btn.addClass("remove");
					type_btn.attr("id","delete_btn"+i);
					type_btn.html("삭제");
					
					//리스트 내용 하나씩 자르기
					for (var j = 1; j < file_parts.length; j++) {
						console.log('file_parts[' +j+ '] = ' + file_parts[j]);							

						
						switch (j) {
						case 4: 							
							type = file_parts[4];													
						case 6:
							title = file_parts[6];
						case 3:
							filename = file_parts[3];
// 							alert(filename);
						case 2:
							urlname = file_parts[2];
						default:
							break;
						}
					}					

					type_span.html(type);
					title_span.html(title);
					type_a.html(urlname);
					type_a.html(filename);																	
					type_p.append(type_span);
					type_p.append(title_span);
					type_p.append(type_a);
					type_p.append(type_btn);
					type_li.append(type_p);
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
		<button type="button" class="button" onclick="window.open('portfolioWriteForm.jsp','portfolioWriteForm','width=500, height=350, left=300, top=200')">등록</button>
		<button type="button" class="button" onclick="window.open('portfolioLoad.do','portfolioLoad','width=500, height=700, left=300, top=200')">내 파일함</button>
	</div>	
		<ul id="portfolio_list">
	<!-- 	동적요소 생성 -->
	
	<li file-num="4" class="file"> 
		<p class="comment_item"> 
			<span class="type">[구분]</span>  
			<span>타이틀</span>
			<a class="pf_name"> 파일이름 및 URL 주소 </a>			
			<button type="button" id="delete_btn">삭제</button>			
		</p>		
	</li>
		

		</ul>
	</div>
</div>
</form>

</body>
</html>