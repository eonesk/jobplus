<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trophyWirte</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function() {
	var num = ${param.num};
	alert("num의 수 = " + num);
	var rst_Name = $("#rst_Name" + num, opener.document).val();
	var rst_Company = $("#rst_Company" + num, opener.document).val();
	var rst_Date = $("#rst_Date" + num, opener.document).val();
	var rst_Content = $("#rst_Content" + num, opener.document).val();
	alert(rst_Name + " // " + rst_Company+ " // " + rst_Date
			+ " // " + rst_Content);
	
	$("#save").click(function() {
		if(!$("#rst_UserTitle").val()) {
			alert("수상 제목을 입력해주세요");
			$("#rst_UserTitle").focus();
			return false;
		} /**else {
			$("form[name='internWrite']").submit();
		}	*/			
		var rst_UserTitle = $("#rst_UserTitle").val();
		
		$.ajax({
			type: 'POST',
			url: 'Write.do',
			dataType: 'text',
			data: {
				"rst_Name": rst_Name,
				"rst_Company": rst_Company,
				"rst_Date": rst_Date,
				"rst_Content": rst_Content,
				"rst_UserTitle": rst_UserTitle
			},
			success: function(data) {
				if(data > 0) {
					alert("성공");
					$("#rst__Seq"+num, opener.document).val(data);
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
<style type="text/css">
.title {
	font: 20px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: bold;
	color: #2A120A;
}
#save, #cancle {
	width:70px;
    background-color: #5882FA;
    border: none;
    color:#fff;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    margin: 4px;
    cursor: pointer;
}
#save:hover, #cancle:hover {
    background-color: #2E9AFE;
}
</style>
</head>
<body>
	<fieldset>		
		<p class="title">제목 저장하기</p>		
		<div>			
			<input type="text" id="rst_UserTitle" name="rst_UserTitle"  style="width:280px;height:30px;">
			<input type="button" value="저장하기" id="save">
			<input type="button" value="취소" id="cancle">			
		</div>		
	</fieldset>
</body>
</html>