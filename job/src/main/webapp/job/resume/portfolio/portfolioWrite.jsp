<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 작성</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

window.onload=function() {
	if(${su > 0}) {
		alert("작성하신 글을 저장하였습니다.");
		self.close();
	} else {
		alert("작성하신 글을 저장하지 못하였습니다.");
		location.href="portfolioList.jsp";
	}
}
// 	$(function() {
// 		$("#save").click(function() {
// 			if(!$("#rs_pfUsertitle").val()) {
// 				alert("제목을 입력해주세요");
// 				$("#rs_pfUsertitle").focus();
// 				return false;
// 			}
// 			var rs_pfUsertitle = $("#rs_pfUsertitle").val();
// 	 		var rs_pfType = 	$("#rs_pfType option:selected").val();
// 	 		var rs_pfFileorurl =$("#rs_pfFileorurl").val();
// 	 		var rs_pfUrl = 		$("#rs_pfUrl").val();
// 	 		var rs_pfFile = 	$("#rs_pfFile").val();
// 	 		alert(rs_pfType +"//"+ rs_pfFileorurl +"//"+ rs_pfUrl+"//"+ rs_pfFile +"//"+rs_pfUsertitle);
			
// 			$.ajax({
// 				type: 'POST',
// 				url: 'portfolioWrite.do',
// 				dataType: 'text',
// 				data: {
// 					"rs_pfUrl": rs_pfUrl,
// 					"rs_pfFile": rs_pfFile,
// 					"rs_pfType": rs_pfType,
// 					"rs_pfFileorurl": rs_pfFileorurl,
// 					"rs_pfUsertitle": rs_pfUsertitle
// 				},
// 				success: function(data) {
// 					if(data > 0) {
// 						alert("성공");
// 						window.close();
// 					} else {
// 						alert("실패");
// 					}
// 				}
// 			});
// 		});
		
// 		$("#cancle").click(function() {
// 			window.close();
// 		});
// 	});
</script> 
</head>
<body>
<!-- <input type="text" id="rs_pfUsertitle" name="rs_pfUsertitle"  -->
<!-- 		placeholder="저장하실 포트폴리오의 이름을 입력해주세요" size="40"> -->
		
<!-- <input type="button" value="완료" id="save"> -->
<!-- <input type="button" value="취소" id="cancle"> -->
</body>
</html>