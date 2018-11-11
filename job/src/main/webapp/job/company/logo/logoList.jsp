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

function logoSave(imgPath){
	alert("사진이 등록되었습니다.");
// 	window.opener.document.getElementById("fromInput").value=document.getElementById("imgValue").value
	var imgData = $('#imgValue').val(); 
/* 	$(opener.document).find("#cpl_Seq").attr("src",imgData);
	$(opener.document).find("#cpl__Seq").attr("value",$("#cpl_Seq").val()); */
	document.logoWriteForm.submit();
	window.close(); 
}
$( document ).ready(function() { 
  
});

$("input:checkbox").on('click', function() {
	var $box = $(this);
		if ($box.is(":checked")) {
			cscontrol(); 
			var group = "input:checkbox[name='" + $box.attr("name") + "']";
				$(group).prop("checked", false);
				$box.prop("checked", true);
		} else {
			$box.prop("checked", false);
		}
	});
 
function cscontrol(chk,imgPath){ 
	if($("#selectPhoto"+chk).css("background-color") == "rgb(219, 238, 255)"){
		$('#selectPhoto'+chk).css("background-color","");
	}else{  
		$('#selectPhoto'+chk).css("background-color","#dbeeff"); 
		$('#imgValue').val(imgPath);
	}  
}

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
	height: 100px; 
}
#selectPhoto:hover {
	cursor: pointer;
	border-color: red;
}

#tumbnail {
	width: 120px;
	height: 70px;
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
<form action="logoWrite.do" id='logoWriteForm' name="logoWriteForm"  enctype="multipart/form-data" method="post">
<input type="file" name="img" id="logo_upload" style="display:none" value=''>
<p class="subtitle">로고 목록</p>
		<table>
		 	<tr class="sss">     
				<c:forEach var='logoDTO' items="${list }" varStatus="i">            
				<td id="selectPhoto${i.index}" onclick="cscontrol('${i.index}','/job/job/company/logo/img/storage/${logoDTO.cpl_Name}');" style="border: 1px solid #e6e6e6;"> 
					<div class="imgsize"><img id="tumbnail" src="/job/job/company/logo/img/storage/${logoDTO.cpl_Name}"/></div>  
					<input type="hidden" id="cpl_Seq" value="${logoDTO.cpl_Seq }">
					<input type='hidden' id='imgValue' name = 'imgValue' value='/job/job/company/logo/img/storage/${logoDTO.cpl_Name}'/>   
					<div align="center"><input type="checkbox" name="image_check" id="image_check" class="image_check"></div>
					<img src="">
				</td>
				</c:forEach>
			</tr>
				
			<tr>
				<td colspan="3" align="center" class="page">
				<c:if test="${startPage > 3}">
					<a href="logoList.do?pg=${startPage-1}">◀</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<c:if test="${pg==i}">
						<a class="current_pg" href="logoList.do?pg=${i}">${i}</a>
					</c:if>
					<c:if test="${pg !=i }">
					<a href="logoList.do?pg=${i}">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${endPage<totalP}">
					<a href="logoList.do?pg=${endPage+1}">▶</a>
				</c:if>
				</td>
			</tr>
		</table>	 
	<div class="bottom_btn" align="center">    
		<button type="button" id="imgload" onclick="javascript:logoSave('/job/job/company/logo/img/storage/${logoDTO.cpl_Name}');">등록</button>
		<button type="button"  onclick="window.close();">취소</button>
	</div>
</form>
</body>
</html>