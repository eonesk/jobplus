<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		var rsf_Name = 		$("#rsf_Name", opener.document).val();
		var rsf_Startdate = $("#rsf_Startdate", opener.document).val();
		var rsf_Enddate = 	$("#rsf_Enddate", opener.document).val();
		var rsf_Content =	$("#rsf_Content", opener.document).val();
		alert(rsf_Name +"//"+ rsf_Startdate +"//"+ rsf_Enddate+"//"+ rsf_Content);
		
		$("#save").click(function() {
			if(!$("#rsf_Usertitle").val()) {
				alert("제목을 입력해주세요");
				$("#rsf_Usertitle").focus();
				return false;
			}
			/*  else {
				$("form[name='rsprSaveForm']").submit();
			} */		 
			var rsf_Usertitle = $("#rsf_Usertitle").val();
			
			$.ajax({
				type: 'POST',
				url: 'foreignWrite.do',
				dataType: 'text',
				data: {
					"rsf_Name": rsf_Name,
					"rsf_Startdate": rsf_Startdate,
					"rsf_Enddate": rsf_Enddate,
					"rsf_Content": rsf_Content,
					"rsf_Usertitle": rsf_Usertitle
				},
				success: function(data) {
					if(data > 0) {
						alert("성공");
						window.close();
					} else {
						alert("실패");
					}
				}
			});
		});
		
		$("#cancle").click(function() {
			window.close();
		});
	});
</script>

</head>
<body>
<input type="text" id="rsf_Usertitle" name="rsf_Usertitle" 
		placeholder="저장하실 해외경험의 제목을 입력해주세요" size="40">
		
<input type="button" value="완료" id="save">
<input type="button" value="취소" id="cancle">
</body>
</html>