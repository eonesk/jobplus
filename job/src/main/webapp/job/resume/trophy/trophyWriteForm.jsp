<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trophyWriteForm</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var count = 0;		
		$("#t").hide();
		
		$("#trophyplus").click(function() {		
			count++;
			var num = count;	
			if (count >= 4) {	
				alert("항목추가는 최대 3개까지만 추가가능합니다.")
				count--;
				return false;
			}
			var clone = $("#t").clone().attr('id', 't' + count);
			clone.find('*[id]').each(function() {
				$(this).attr("id", $(this).attr("id") + count);
			});
			clone.insertBefore("#t");
			$("#t" + count).show();
			
		$("#trophydelete" + num).on("click", function() {
			/*$("#t" + count).remove();*/
			$(this).parent().remove();
			alert("삭제버튼 누르고 감산 전"+count);
			count--;
			alert("삭제버튼 누르고 감산 후"+count);
		});
		
		$("#trophysave" + num).on("click", function() {
				if (!$("#rstName" + num).val()) {
					alert("수상명을 입력하세요.");
					$("#rstName" + num).focus();
					return false;
				}
				if (!$("#rstCompany" + num).val()) {
					alert("수여기관을 입력하세요.");
					$("#rstCompany" + num).focus();
					return false;
				}
				if (!$("#rstDate" + num).val()) {
					alert("수상연도을 입력하세요.");
					$("#rstDate" + num).focus();
					return false;
				}
				if (!$("#rstContent" + num).val()) {
					alert("수여내용을 입력하세요.");
					$("#rstContent" + num).focus();
					return false;
				} 
				window.open("trophyWrite.jsp?num=" + num, "","width=500px height=500px");
		});
		$("#trophyload" + num).click(function() {
			window.open("trophyLoad.jsp?num=" + num, "", "width=500px height=500px");
		});
	});
});
</script>
<style type="text/css">
.write {
	height: 100%;
    width: 100%;
    background-color: #e8ecef;
    font: 12px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
    color: #666;
    letter-spacing: -1px;
    padding: 0;
    margin: 0;
    overflow: auto;
}
.title {
	font: 24px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: bold;
	color: #2A120A;
}
fieldset {
	background-color: #FFFFFF;
}
.content {
	padding-top: 5px;
}
.trophysave, .trophyload {
	width:80px;
    background-color: #5882FA;
    border: none;
    color:#fff;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 5px;
    margin-left : 0;
    cursor: pointer;
}
.trophysave:hover, .trophyload:hover {
    background-color: #2E9AFE;
}
.trophyplus, .trophydelete {
	width: 100%;
	height: 50px;
	background-color: #fff;
    border: 1px solid #5882FA;
    color: #5882FA;
    text-align: center;
    text-decoration: none;
    font-size: 15px;
    display: inline-block;
    cursor: pointer;
}
.rstName, .rstCompany {
	width:200px;
	height:28px;
}
.rstDate {
	width: 120px;
	height: 30px;
}
</style>
</head>
<body class="write">
<fieldset>
	<p class="title">수상내역</p>
	<div id="t" class="t">
		<br>	
		<div>
			<input type="hidden" id="rstSeq" name="rstSeq" class="rstSeq">		
			<input type="text" id="rstName" name="rstName" class="rstName" placeholder="수상명" size="30">
			<input type="text" id="rstCompany" name="rstCompany" class="rstCompany" placeholder="수여기관" size="30">
			<input type="date" id="rstDate" name="rstDate" class="rstDate" placeholder="수상연도" size="7">
		</div>
		<div class="content">			
			<textarea id="rstContent" name="rstContent" class="rstContent" placeholder="수여내용" cols="81" rows="8"></textarea>
		</div>		
		<div>
			<input type="button" value="저장하기" id="trophysave" class="trophysave">
			<input type="button" value="불러오기" id="trophyload" class="trophyload">
		</div>
		<input type="button" value="삭제" id="trophydelete" class="trophydelete">	
	</div>	
</fieldset>
<input type="button" value="추가" id="trophyplus" class="trophyplus">	
</body>
</html>