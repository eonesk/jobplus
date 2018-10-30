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
	$(function() {
		
		/* 자기소개서의 총 개수 구함 */
		$.ajax({
			type: 'POST',
			url: 'foreignLoadCount.do',
			dataType: 'text',
			cache: false,
			success: function(data) {
				$("#numberOfPf").append(data);
				if(data == "0") {
					alert("해외경험 등록 글 없음");
					$("<td>").addClass("rsprLoadListLabelTd").html("제목").appendTo($("<tr>")).addClass("rsprLoadListLabelTr").appendTo("#rsprLoadListTable");
					//$("<td>").addClass("rsprLoadListLabelTd").html("제목").appendTo("#rsprLoadListTable");
				} else {
				
					alert("자기소개서 있을 때");
					/* Json 하는 거 어떻게 하지 ㅠㅠ */
					$.ajax({
						type: 'POST',
						url: 'foreignLoadlist.do',
						dataType: "json",
						success: function(data) {//rsprLoadListTable  item.rspr_UserTitle
							alert("성공");
							
							var trTitle = $("<tr>").addClass("rsprLoadListLabelTr");
							var tdTitle = $("<td>").addClass("rsprLoadListLabelTd").html("제목");
							
							trTitle.append(tdTitle);
							$("#rsprLoadListTable").append(trTitle);
							
							$.each(data.items, function(index, item) {
								var tr = $("<tr>").addClass("rsprLoadListLabelTr");
								var td = $("<td>").addClass("rsprLoadListLabelTd");
								var a = $("<a>").attr({
									"id": "rspr_UserTitleA",
									"href": "#"
								}).html(item.rspr_UserTitle);
								
								td.append(a);
								tr.append(td);
								$("#rsprLoadListTable").append(tr);							
								
								/* 
								$("#rspr_UserTitleA").click(function() {
									alert(item.rspr_UserTitle);
								});
								 */								 
							});
							
							
							
							alert("종료");
							
							
							
						},
						error : function(e) {
			                alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.: ' + e.status);
			         	}
					});				
				}
			},
			error : function(e) {
	            alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
	     	}
		});		
	});

// 	function check(cb) {
// 		for (i = 0; i < 4; i++) {
// 		if (eval("document.foreignList.ckbox[" + i + "].checked") == true) {
// 			document.foreignList.ckbox[i].checked = false;
// 		if (i == cb) {
// 			document.foreignList.ckbox[i].checked = true;
// 	         }
// 	      }
// 	   }
// 	}
</script>
</head>
<body>
<form name="foreignList">
<h4>내 저장 목록</h4>
	<table border="1">
		<tr>
			<td>check</td>
			<td>foreign title</td>
		</tr>  
		<c:forEach var="foreignDTO" items="${list}">
		<tr>
			<td><input type="checkbox" name="ckbox" onclick=""></td>
			<td id="foreignValue">${foreignDTO.rsf_Usertitle}</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="2" align="center">
			<c:if test="${startPage > 3}">
					<a href="foreignList.do?pg=${startPage-1}">◀</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<c:if test="${pg==i}">
						<a id="" href="foreignList.do?pg=${i}">${i}</a>
					</c:if>
					<c:if test="${pg !=i }">
					<a href="foreignList.do?pg=${i}">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${endPage<totalP}">
					<a href="foreignList.do?pg=${endPage+1}">▶</a>
				</c:if>
			</td>
		</tr>
	</table>
	<input type="button" value="불러오기" onclick="">
	<input type="button" value="닫기">
</form>
</body>
</html>