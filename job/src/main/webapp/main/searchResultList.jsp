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
		<c:forEach items="${searchRegion}" var="item">
		searchRegion.push("${item}");
		</c:forEach>
		for (var i = 0; i < searchRegion.length; i++) {
		    console.log("searchRegion[" + i + "]" + searchRegion[i]);
		    var inputRegion = $("<input>");
		    inputRegion.attr({
		    	"type": "hidden",
		    	"value": searchRegion[i],
			   	"name": "searchRegion"
		    });
		    $("#insertKeyword").append(inputRegion);
		}
		
		var jobSelect3 = new Array();
		<c:forEach items="${jobSelect3}" var="item">
		jobSelect3.push("${item}");
		</c:forEach>
		for (var i = 0; i < jobSelect3.length; i++) {
		    console.log("jobSelect3[" + i + "]" + jobSelect3[i]);
		    var inputJobSelect = $("<input>");
		    inputJobSelect.attr({
		    	"type": "hidden",
		    	"value": jobSelect3[i],
			   	"name": "jobSelect3"
		    });
		    $("#insertKeyword").append(inputJobSelect);
		}
//		$('input[type="hidden"][data-value="userValue"]');
		console.log("p" + $("input[type='hidden'][name='jobSelect3']").attr('value'));
		
		var searchCompany = '${param.searchCompany}';
		console.log("searchCompany" + searchCompany);
		var inputsearchCompany = $("<input>");
		inputsearchCompany.attr({
		   	"type": "hidden",
		   	"value": searchCompany,
		   	"name": "searchCompany"
		});
		$("#insertKeyword").append(inputsearchCompany);
		
		var jobSelect3Info = $("input[name='jobSelect3']").attr('value');
		console.log("input[name='jobSelect3'] : " + jobSelect3Info);
		
		var searchCompanyInfo = $("input[name='searchCompany']").attr('value');
		console.log("input[name='searchCompany'] : " + searchCompanyInfo);
		
		
		$(".test").click(function() {
			var pg_click= $(this).attr('value');
			console.log(pg_click);
			var inputPg = $("<input>");
			inputPg.attr({
			   	"type": "hidden",
			   	"value": pg_click,
			   	"name": "pg"
			});
			$("#insertKeyword").append(inputPg);
			console.log("pg : " + $("input[type='hidden'][name='pg']").attr('value'));
			
			$("#testButton").submit();
		});
		
		
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
<form id="testButton" action="../mainSearch/search.do" name="searchInfo1">
	<div id="insertKeyword">
	
	</div>
</form>
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
					[<a class="test" value="${ startPage - 1 }" href="<%-- ../job/recruitment/mainSearch/searchR.do?pg=${ startPage - 1 }&searchRegion=${searchRegion}&searchCompany=${param.searchCompany}&jobSelect3=${jobSelect3} --%>">이전</a>]
				</c:if>
				<c:forEach var="i" begin="${ startPage }" end="${ endPage }" step="1">
					<c:if test="${ pg == i }">
						[${ i }]
					</c:if>
					<c:if test="${ pg != i }">
						[<a class="test" value="${ i }" href="<%-- ../job/recruitment/mainSearch/searchR.do?pg=${ i }&searchRegion=${searchRegion}&searchCompany=${param.searchCompany}&jobSelect3=${jobSelect3} --%>">${ i }</a>]
					</c:if>
				</c:forEach>
				<c:if test="${ endPage < totalP }">
					[<a class="test" value="${ endPage + 1 }" href="<%-- /job/recruitment/mainSearch/searchR.do?pg=${ endPage + 1 }&searchRegion=${searchRegion}&searchCompany=${param.searchCompany}&jobSelect3=${jobSelect3} --%>">다음</a>]
				</c:if>
			</td>
		</tr>	
	</table>
</body>
</html>