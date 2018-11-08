<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 통합검색</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url: "mainSearchResultJson.do",
			type: 'post',
			data: {'pg' : '${pg}'},
			dataType: 'json',
			success: function(data) {
				$.each(data.items, function(index, item) {
					var li = $("<li>");
					var h3 = $("<h3>").html($("<a>"), function() {
						id: "cpi_CompanyName",
						href: "#",
						click: function() {
							location.href="#";
						},
						text: item.cpi_CompanyName
					});
					var p1 = $("<p>").append(
							$("<span>").html(item.rm_Title)).append(
							$("<span>").html(item.rmt_Startdate + "~" + item.rmt_Enddate));
					var p2 = $("<p>").append(
							$("<span>").html(item.rmj_Career + "&nbps;&nbps;").append(
							$("<span>").html(item.rmj_Job + "&nbps;&nbps;")).append(
							$("<span>").html(item.rmj_Type + "&nbps;&nbps;")).append(
							$("<span>").html(item.rmc_Salary + "&nbps;&nbps;")).append(
							$("<span>").html(item.rmc_Workspace)));
							
					li.append(h3).append(p1).append(p2);
					$("ul#mainSearchList").append(li);
				});
			},
			error: function() {
				alert("통신에 장애가 발생했습니다! 다시 시도해주세요");
				location.href('javascript:history.back();');
			}
		});
	});
</script>
</head>
<body>
	<div class="searchResult">
		<div class="searchResultHeader">
			<h2>채용정보</h2><span class="searchNum">총 건</span>
		</div>
		<div class="searchResultContent">
			<ul id="mainSearchList">
			</ul>
		</div>
		<div class="searchResultFooter">
			<c:if test="${startPage > 5}">
				<input type="button" value="<이전" id="prevBtn" onclick="location.href='mainSearchResultForm.do?pg=${startPage-1}'">
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
				<c:if test="${i == pg }">
					<input type="button" value="${i }" id="currentPaging" onclick="location.href='mainSearchResultForm.do?pg=${i}'">
				</c:if>
				<c:if test="${i != pg }">
					<input type="button" value="${i }" id="paging" onclick="location.href='mainSearchResultForm.do?pg=${i}'">
				</c:if>
			</c:forEach>
			
			<c:if test="${endPage < totalP}">
				<input type="button" value="다음>" id="nextBtn" onclick="location.href='mainSearchResultForm.do?pg=${endPage+1}'">
			</c:if>
		</div>
	</div>
</body>
</html>