<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>languageWriteForm</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">	
	$(function() {
		$("#rslgCategory").change(function() {
			if($("#rslgCategory option:selected").val() == "공인시험"){
				document.getElementById("test").style.display = "inline";
				document.getElementById("lv").style.display = "none";
			}else{
				document.getElementById("test").style.display = "none";
				document.getElementById("lv").style.display = "inline";
			}			
		});		
	});
	$(function() {
		$("#langsave").click(function() {
			if($("#rslgCategory option:selected").val() == "공인시험"){
				if($("#rslgName option:selected").val() == "외국어명"){
					alert("외국어명을 입력하세요.");
					$("#rslgName").focus();	
				}else if(!$("#rslgTest").val()){
					alert("공인시험을 입력하세요.");
					$("#rslgTest").focus();
				}else if(!$("#rslgScore").val()){
					alert("급수/점수를 입력하세요.");
					$("#rslgScore").focus();	
				}else if(!$("#rslgDate").val()){
					alert("취득년월을 입력하세요.");
					$("#rslgDate").focus();	
				}else {
					window.open("languageWrite.jsp","", "width=500px height=500px");
				}								
			}else {
				if($("#rslgName option:selected").val() == "외국어명"){
					alert("외국어명을 입력하세요.");
					$("#rslgName").focus();	
				}else if($("#rslgLv option:selected").val() == "회화능력"){
					alert("회화능력을 입력하세요.");
					$("#rslgLv").focus();
				}else {
					window.open("languageWrite.jsp","", "width=500px height=500px");
				}
			}
		});
		$("#langload").click(function() {
			window.open("languageLoad.jsp", "", "width=500px height=500px");
		});
	});
</script>
</head>
<body>
	<fieldset>
		<legend>어학</legend>
		<div id="select">
			<select name="rslgCategory" id="rslgCategory">
				<option value="회화능력">회화능력</option>
				<option value="공인시험">공인시험</option>
			</select>
		</div>
		<select id="rslgName" name="rslgName">
			<option value="외국어명">---외국어명---</option>
			<option value="영어">영어</option>
			<option value="일본어">일본어</option>
			<option value="중국어">중국어</option>
			<option value="독일어">독일어</option>
			<option value="프랑스어">프랑스어</option>
			<option value="스페인어">스페인어</option>
			<option value="러시아어">러시아어</option>
			<option value="이탈리아어">이탈리아어</option>
			<option value="아랍어">아랍어</option>
			<option value="태국어">태국어</option>
			<option value="마인어">마인어</option>
			<option value="그리스어">그리스어</option>
			<option value="포르투갈어">포르투갈어</option>
			<option value="베트남어">베트남어</option>
			<option value="네덜란드어">네덜란드어</option>
			<option value="힌디어어">힌디어어</option>
			<option value="노르웨이어">노르웨이어</option>
			<option value="유고어">유고어</option>
			<option value="히브리어">히브리어</option>
			<option value="이란">이란</option>
			<option value="터키어">터키어</option>
			<option value="체코어">체코어</option>
			<option value="루마니아어">루마니아어</option>
			<option value="몽골어">몽골어</option>
			<option value="스웨덴어">스웨덴어</option>
			<option value="헝가리어">헝가리어</option>
			<option value="폴란드어">폴란드어</option>
			<option value="미얀마어">미얀마어</option>
			<option value="슬로바키아어">슬로바키아어</option>
			<option value="세르비아어">세르비아어</option>
			<option value="한국어">한국어</option>
		</select>
		<div id="lv" style="display: inline;">			
			<select id="rslgLv" name="rslgLv">							
				<option value="회화능력">---회화능력---</option>			
				<option value="일상회화 가능">일상회화 가능</option>
				<option value="비즈니스 회화가능">비즈니스 회화가능</option>
				<option value="원어민 수준">원어민 수준</option>
			</select>
		</div>
		<div id="test" style="display: none;">				
			<input type="text" id="rslgTest" name="rslgTest" placeholder="공인시험">
			<input type="text" id="rslgScore" name="rslgScore" placeholder="급수/점수">
			<input type="date" id="rslgDate" name="rslgDate" placeholder="취득년월">
		</div>
		<div>			
			<input type="button" value="저장하기" id="langsave">
			<input type="button" value="불러오기" id="langload">
		</div>	
	</fieldset>
</body>
</html>