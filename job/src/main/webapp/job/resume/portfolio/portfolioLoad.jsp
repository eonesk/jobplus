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

// function fileLoad(imgPath){
// 	alert("사진이 등록되었습니다.");
// // 	window.opener.document.getElementById("fromInput").value=document.getElementById("imgValue").value
// 	var imgData = $('#imgValue').val(); 
// 	$(opener.document).find("#aaa").attr("src",imgData);
// 	window.close(); 
// // 	$("#img_form_url").attr("src", imgurl);
// //////////////////////////////////////////////////여기 다시봐줘
// // 	window.colse();
// }
// $( document ).ready(function() {
// // 	$('#selectPhoto').click(function() { 
// // 		alert("11");
// // 	    $('#selectPhoto').addClass("active");
// // 	    $('#selectPhoto').removeClass("visited");
// // 	});     
// });


// $("input:checkbox").on('click', function() {
// 	var $box = $(this);
// 		if ($box.is(":checked")) {
// 			cscontrol(); 
// 			var group = "input:checkbox[name='" + $box.attr("name") + "']";
// 				$(group).prop("checked", false);
// 				$box.prop("checked", true);
// 		} else {
// 			$box.prop("checked", false);
// 		}
// 	});
 
// function cscontrol(chk,imgPath){ 
// // 	$('#selectPhoto').addClass("active");
// 	if($("#selectPhoto"+chk).css("background-color") == "rgb(219, 238, 255)"){
// 		$('#selectPhoto'+chk).css("background-color","");
// 	}else{  
// 		$('#selectPhoto'+chk).css("background-color","#dbeeff"); 
// 		$('#imgValue').val(imgPath);
// 	}  
// //     $('#selectPhoto').removeClass("visited");
// }
$(function() {
	$("#fileLoad").click(function() {
		alert("체크");
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
			
// 		$("#selectBtn").click(function(){ 
			
// 			var rowData = new Array();
// 			var tdArr = new Array();
// 			var checkbox = $("input[name=user_CheckBox]:checked");
			
// 			// 체크된 체크박스 값을 가져온다
// 			checkbox.each(function(i) {
	
// 				// checkbox.parent() : checkbox의 부모는 <td>이다.
// 				// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
// 				var tr = checkbox.parent().parent().eq(i);
// 				var td = tr.children();
				
// 				// 체크된 row의 모든 값을 배열에 담는다.
// 				rowData.push(tr.text());
				
// 				// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
// 				var no = td.eq(1).text()+", "
// 				var userid = td.eq(2).text()+", ";
// 				var name = td.eq(3).text()+", ";
// 				var email = td.eq(4).text()+", ";
				
// 				// 가져온 값을 배열에 담는다.
// 				tdArr.push(no);
// 				tdArr.push(userid);
// 				tdArr.push(name);
// 				tdArr.push(email);
				
// 				//console.log("no : " + no);
// 				//console.log("userid : " + userid);
// 				//console.log("name : " + name);
// 				//console.log("email : " + email);
// 			});
		
		
		
		
		checkbox.each(function(i) {
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			rowData.push(tr.text());

			//td.eq(0)은 체크박스 이므로 td.eq(1)의 값부터 가져옴
			seq = td.eq(1).val()+",";
			urlname = td.eq(2).val()+",";
			filename = td.eq(3).val()+",";
			type = td.eq(4).text()+",";
			uorf = td.eq(5).val()+",";
			title = td.eq(6).text()+",";
			
			tdArr.push(seq);
			tdArr.push(urlname);
			tdArr.push(filename);
			tdArr.push(type);
			tdArr.push(uorf);
			tdArr.push(title);
			
			
			
// 			$("#file_type").html(seq + " // " + urlname+ " // " +filename+ " // " +type+ " // " +uorf + " // " +title);
// 			$("#rsprTitle", opener.document).val(title);
		});
		
		opener.parent.test(rowData);
		self.close();
		

	});
});
// function fileLoad(type) {
// 	alert("등록되었습니다");
	
// }

// function cscontrol(chk,imgPath){ 
// 		$('#file_check'+chk).css("background-color","#dbeeff"); 
// 		$('#fileValue').val(imgPath);
// 	}  
// }


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
			${portfolioDTO.rspf_Seq } 
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