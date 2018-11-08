<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>languageWrite</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var num = ${param.num};
		var rslgCategory = $("#rslg_Category" + num, opener.document).val();	
		if(rslgCategory == "공인시험"){
			var rslgName = $("#rslg_Name" + num, opener.document).val();			
			var rslgTest = $("#rslg_Test" + num, opener.document).val();
			var rslgScore = $("#rslg_Score" + num, opener.document).val();
			var rslgDate = $("#rslg_Date" + num, opener.document).val();
			var rslgLv = null;
		}else{
			var rslgName = $("#rslg_Name" + num, opener.document).val();
			var rslgLv = $("#rslgLv" + num, opener.document).val();
			var rslgTest = null;
			var rslgScore = null;
			var rslgDate = null;
		}
			
		$("#save").click(function() {
			if(!$("#rslgUserTitle").val()) {
				alert("이력서 제목을 입력해주세요");
				$("#rslgUserTitle").focus();
				return false;
			} /**else {
				$("form[name='internWrite']").submit();
			}	*/		
			
			var rslgUserTitle = $("#rslgUserTitle").val();
					
			$.ajax({
				type: 'POST',
				url: 'Write.do',
				dataType: 'text',
				data: {
					"rslgCategory": rslgCategory,
					"rslgName": rslgName,
					"rslgLv": rslgLv,
					"rslgTest": rslgTest,
					"rslgScore": rslgScore,
					"rslgDate": rslgDate,
					"rslgUserTitle": rslgUserTitle
				},
				success: function(data) {
					if(data > 0) {
						alert("성공");
						$("#rslg__Seq"+num, opener.document).val(data);
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
.save, .cancle {
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
.save:hover, .cancle:hover {
    background-color: #2E9AFE;
}
</style>
</head>
<body>
	<fieldset>		
		<p class="title">제목 저장하기</p>			
		<div>			
			<input type="text" id="rslgUserTitle" name="rslgUserTitle"  style="width:280px;height:30px;">				
			<input type="button" value="저장하기" id="save" class="save">
			<input type="button" value="취소" id="cancle" class="save">		
		</div>		
	</fieldset>
</body>
</html>