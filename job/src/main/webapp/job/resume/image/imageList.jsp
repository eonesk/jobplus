<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {border-collapse: collapse;	margin: auto; }
#titleSize {width: 250px;}
#thumnail {width: 90px; height: 130px;}
#selectPhoto {border: 1px solid #83c5ff;}
/* #selectPhoto:hover {cursor: pointer;} */
tr:active {background-color: #dbeeff;}
tr:visited {border: 1px solid #000000;	background-color: #dbeeff;}
.bottom_btn {margin: auto;}
</style> 
</head>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

function profileImgSave(imgPath){
	alert("사진이 등록되었습니다.");
// 	window.opener.document.getElementById("fromInput").value=document.getElementById("imgValue").value
	var imgData = $('#imgValue').val(); 
	$(opener.document).find("#aaa").attr("src",imgData);
	window.close(); 
// 	$("#img_form_url").attr("src", imgurl);
//////////////////////////////////////////////////여기 다시봐줘
// 	window.colse();
}
$( document ).ready(function() {
// 	$('#selectPhoto').click(function() { 
// 		alert("11");
// 	    $('#selectPhoto').addClass("active");
// 	    $('#selectPhoto').removeClass("visited");
// 	});     
});

</script>

<script type="text/javascript">
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
// 	$('#selectPhoto').addClass("active");
	if($("#selectPhoto"+chk).css("background-color") == "rgb(219, 238, 255)"){
		$('#selectPhoto'+chk).css("background-color","");
	}else{  
		$('#selectPhoto'+chk).css("background-color","#dbeeff"); 
		$('#imgValue').val(imgPath);
	}  
//     $('#selectPhoto').removeClass("visited");
}
</script>

<body>
<h4>내 사진 목록</h4> 
<!-- <input type='hidden' id='imgValue2' name = 'imgValue2' value=''/> -->
<div> 
	<div>   
		<table>  	     
			<c:forEach var='imageDTO' items="${list }" varStatus="i">            
				<tr id="selectPhoto${i.index}" onclick="cscontrol('${i.index}','img/storage/${imageDTO.rsim_Name}');" style="border: 1px solid #000000;">    
<!-- 					<td>   -->
<%-- <%-- 						<a href="javascript:profileImgSave('img/storage/${imageDTO.rsim_Name}');"> --%> 
<%-- 							<input type="checkbox" class="radio" value="1" name="fooby[${i.index }][]" /> --%>
<!-- <!-- 						</a> --> 
<!-- 					</td>  -->
					<td>  
<%-- 						<a href="javascript:profileImgSave('img/storage/${imageDTO.rsim_Name}');"> --%>
							<img id="thumnail" src="img/storage/${imageDTO.rsim_Name}"/>
<!-- 						</a> -->
					</td>
						<input type='hidden' id='imgValue' name = 'imgValue' value='img/storage/${imageDTO.rsim_Name}'/>       
					<td id="titleSize" align="center">
						${imageDTO.rsim_Usertitle}
					</td> 
				</tr>
			</c:forEach> 		
			<tr>
				<td colspan="2" align="center">
				<c:if test="${startPage > 3}">
					<a href="imageList.do?pg=${startPage-1}">◀</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<c:if test="${pg==i}">
						<a id="" href="imageList.do?pg=${i}">${i}</a>
					</c:if>
					<c:if test="${pg !=i }">
					<a href="imageList.do?pg=${i}">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${endPage<totalP}">
					<a href="imageList.do?pg=${endPage+1}">▶</a>
				</c:if>
				</td>
			</tr>
		</table>	 
	</div>
	<div class="bottom_btn">
		<input type="button" value="등록"  onclick="javascript:profileImgSave('img/storage/${imageDTO.rsim_Name}');">
		<input type="button" value="취소" onclick="window.close();">
	</div>
</div>
</body>
</html>