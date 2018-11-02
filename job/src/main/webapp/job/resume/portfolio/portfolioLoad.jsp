<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#fileLoad").click(function() {
		alert("파일을 불러옵니다.");
		//선택박스 클릭시 체크된 ROW값을 가져옴
		var checkbox = $("input[name=file_check]:checked");
		var rowData = new Array();
		var tdArr = new Array();
		var seq;
		var urlname;
		var filename;
		var type;
		var uorf;
		var title;		
		var fileData;
					
		checkbox.each(function(i) {
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			rowData.push(tr.text());

			//td.eq(0)은 체크박스 이므로 td.eq(1)의 값부터 가져옴
			seq = 		"/"+ td.eq(1).val();   
			urlname = 	"/"+ td.eq(2).val();   
			filename = 	"/"+ td.eq(3).val();   
			type = 		"/"+ td.eq(4).text();  
			uorf = 		"/"+ td.eq(5).val();   
			title = 	"/"+ td.eq(6).text();  
			
			tdArr.push(seq);
			tdArr.push(urlname);
			tdArr.push(filename);
			tdArr.push(type);
			tdArr.push(uorf);
			tdArr.push(title);
			
			fileData += seq + urlname + filename + type + uorf + title;
			alert("fileData111::" + fileData);
// 			$("#file_type").html(fileData);
// 			$("#file_type").html(seq + " // " + urlname+ " // " +filename+ " // " +type+ " // " +uorf + " // " +title);
// 			$("#rsprTitle", opener.document).val(title);
		});
		opener.parent.load_list(fileData);
		self.close();
	});	
});



</script>
<style type="text/css">
input, button {
    font-family: "Malgun Gothic", "맑은 고딕", Dotum, 돋움, AppleGothic, sans-serif;
    font-size: 16px;
    display: inline-block;
}
.subtitle {
	font: 20px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: bold;
	color: #2A120A;
	letter-spacing: -1px;
}
button {
	width:100px;
    background-color: #5882FA;
    border: none;
    color:#fff;
    padding: 10px 0;
    text-align: center;
    display: inline-block;
    font-size: 13px;
    cursor: pointer;
    position: relative;
    top: 28px;
}
button:hover {
    background-color: #2E9AFE;
}
table {
	table-layout:fixed;
	border-collapse: collapse;
	margin: auto;
	width: 420px;
	height: 220px;
}
#selectPhoto:hover {
	cursor: pointer;
	border-color: red;
}

#tumbnail {
	max-width: 120px;
	height: 170px;
	margin: 7px 0px 0px 10px;
}
#user_title {
    font-size: 14px;
    color: #888;
    text-align: center;
    position: relative;
    left: 1px;
    padding: inherit;
    width: 120px;
    margin: auto;
}
a {
    display: inline-block;
    margin-right: 1px;
    padding-top: 5px;
    width: 30px;
    height: 25px;
    border: 1px solid #dfdfdf;
    color: #888;
    font-family: "Malgun Gothic","맑은 고딕", dotum,"돋움",sans-serif;
    font-size: 14px;
    text-decoration: none;
    vertical-align: middle;
    background: #fff;
    position: relative;
    top: 13px;
}
.page .current_pg a:hover {
    border: 1px solid #444;
    color: #444;
}
</style> 
<body>
<p class="subtitle">내 포트폴리오 목록</p>	
	<div id="file_type"></div>
		<table>
			<c:forEach var='portfolioDTO' items="${list }" varStatus="i">  
			<tr class="pf_table">
				<td><input type="checkbox" name="file_check" id="file_check" class="file_check"></td>
				<input type="hidden" id="seq" name="seq" value="${portfolioDTO.rspf_Seq }">
				<input type="hidden" id="urlname" name="urlname" value="${portfolioDTO.rspf_Url }">
				<input type="hidden" id="filename" name="filename" value="${portfolioDTO.rspf_File }">
				<td>[${portfolioDTO.rspf_Type}]</td>
				<input type="hidden" id="uorf" name="uorf" value="${portfolioDTO.rspf_Fileorurl }">
				<td>${portfolioDTO.rspf_Usertitle }</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="3" align="center" class="page">
				<c:if test="${startPage > 3}">
					<a href="portfolioLoad.do?pg=${startPage-1}">◀</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<c:if test="${pg==i}">
						<a class="current_pg" href="portfolioLoad.do?pg=${i}">${i}</a>
					</c:if>
					<c:if test="${pg !=i }">
					<a href="portfolioLoad.do?pg=${i}">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${endPage<totalP}">
					<a href="portfolioLoad.do?pg=${endPage+1}">▶</a>
				</c:if>
				</td>
			</tr>
		</table>
<%-- 		onclick="javascript:fileLoad('${imageDTO.rspf_Type}');	  --%>
	<div class="bottom_btn" align="center">


		<button type="button" id="fileLoad">등록</button>
		<button type="button"  onclick="window.close();">취소</button>
		
		
	</div>
</body>
</html>