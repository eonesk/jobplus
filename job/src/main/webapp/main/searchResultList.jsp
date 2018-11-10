<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var searchRegion = new Array();
		var searchRegionLength = ${searchRegionLength };
// 		alert(++searchRegionLength);
		for(var i = 0; i < searchRegionLength; i++) {
			searchRegion[i] = ${paramValues.searchRegion[i]};
			console.log(searchRegion[i]);
		}
	});
</script>
<style type="text/css">
	.listTitle {margin-right: 5px;}
	.listTitle:link {color: black; text-decoration: none;}
</style>
</head>
<body>
<%-- ${ listSize } --%>
<%-- ${searchRegionLength } --%>
<%-- ${jobSelect3Length }<br> --%>
<p style="font-weight: bold; float: left; font-size: 26px;">채용정보</p>
<div style="float: left; position: relative; top: 35px; left: 35px; font-size: 15px; color: #888;">총 ${ listSize } 건</div>
	<table style="clear: both; width: 900px;">
		<c:forEach var="mainSearchDTO" items="${ rm_list }">
		<tr style="text-align: left;">
			<td>
				<div style="padding: 10px;">
					<a href="#">${param.searchCompany}</a><br>
					<a href="#" class="listTitle">${ mainSearchDTO.rm_title }</a>
					<span style="font-size: 14px; color: #888;">~${ mainSearchDTO.rmt_endDate }까지</span>
					<div style="font-size: 14px; color: #888;">
						${ mainSearchDTO.rmj_career } || ${ mainSearchDTO.rma_studyLV } || ${ mainSearchDTO.rmj_type }
					</div>
				</div>
			</td>
		</tr>
		</c:forEach>
		<!-- paging -->
		<tr>
			<td colspan="5" align="center">
				<c:if test="${ startPage > 3 }">
					[<a href="../job/recruitment/mainSearch/searchR.do?pg=${ startPage - 1 }&searchRegion=${searchRegion}&searchCompany=${param.searchCompany}&jobSelect3=${jobSelect3}" class="paging">이전</a>]
				</c:if>
				<c:forEach var="i" begin="${ startPage }" end="${ endPage }" step="1">
					<c:if test="${ pg == i }">
						[${ i }]
					</c:if>
					<c:if test="${ pg != i }">
						[<a href="../job/recruitment/mainSearch/searchR.do?pg=${ i }&searchRegion=${searchRegion}&searchCompany=${param.searchCompany}&jobSelect3=${jobSelect3}" class="paging">${ i }</a>]
					</c:if>
				</c:forEach>
				<c:if test="${ endPage < totalP }">
					[<a href="/job/recruitment/mainSearch/searchR.do?pg=${ endPage + 1 }&searchRegion=${searchRegion}&searchCompany=${param.searchCompany}&jobSelect3=${jobSelect3}" class="paging">다음</a>]
				</c:if>
			</td>
		</tr>	
	</table>

</body>
</html>