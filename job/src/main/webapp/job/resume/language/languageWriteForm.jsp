<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>languageWriteForm</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	/**
	$(function() {
		if("#rslgCategory option:selected").val() == "공인시험"){
			document.getElementById("test").style.display = "inline";
			document.getElementById("lv").style.display = "none";
		}
	});
	*/
	$(function() {
		$("#langsave").click(function() {
			if($("#rslgCategory option:selected").val() == "공인시험"){
				alert("어학명을 입력하세요.");
				$("#rslgName").focus();	
			}else if(!$("#rslgName").val()){
				alert("어학명을 입력하세요.");
				$("#rslgName").focus();	
			}else {
				window.open("langWrite.jsp","", "width=500px height=500px");
				}
			});
			$("#langload").click(function() {
			window.open("langLoad.jsp", "", "width=500px height=500px");
			});
		});
</script>
</head>
<body>
	<fieldset>
		<legend>어학</legend>
		<div>
			<select name="rslgCategory" id="rslgCategory">
				<option value="회화능력">회화능력</option>
				<option value="공인시험">공인시험</option>
			</select>
		</div>
		<div id="lv" style="display: inline;">			
			<input type="text" id="rslgName" name="rslgName" placeholder="외국어명">
			<input type="text" id="rslgLv" name="rslgLv" placeholder="회화능력">
		</div>
		<div id="test" style="display: none;">	
			<input type="text" id="rslgName" name="rslgName" placeholder="외국어명">
			<input type="text" id="rslgtest" name="rslgtest" placeholder="공인시험">
			<input type="text" id="rslgscore" name="rslgscore" placeholder="급수/점수">
			<input type="date" id="rslgdate" name="rslgdate" placeholder="취득년월">
		</div>
		<div>			
			<input type="button" value="저장하기" id="langsave">
			<input type="button" value="불러오기" id="langload">
		</div>	
	</fieldset>
</body>
</html>