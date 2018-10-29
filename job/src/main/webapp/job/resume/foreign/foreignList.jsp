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