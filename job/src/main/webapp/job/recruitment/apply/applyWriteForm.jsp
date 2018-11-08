<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>모집요강</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {	
		$("#ap_Type_radio_o").on("click", function() {
			document.getElementById("ap_Type").style.display = "inline";	
		});
		$("#ap_Type_radio_x").on("click", function() {
			document.getElementById("ap_Type").style.display = "none";							
		});		
		$("#rma_Age_Btn_o").on("click", function() {
			document.getElementById("ap_display").style.display = "inline";	
		});
		$("#rma_Age_Btn_x").on("click", function() {
			document.getElementById("ap_display").style.display = "none";							
		});
		
		$("#rma_Major").on("click", function() {			
			window.open("/job/job/recruitment/apply/applyMajor.jsp", "", 'width=1000px, height=650px, left=450, top=100');
		});
		$("#rma_Vip").on("click", function() {			
			window.open("/job/job/recruitment/apply/applyVip.jsp", "", 'width=1000px, height=450px, left=450, top=100');
		});
		$("#rma_Foreign").on("click", function() {			
			window.open("/job/job/recruitment/apply/applyForeign.jsp", "", 'width=550px, height=600px, left=600, top=100');
		});			 
		
		/* 연령 제한 함수 손봐야함 */
		$("#rma_Age2").on("change", function changeVal() {
			var Age1 = $("#rma_Age option:selected").val();
			var Age2 = $("#rma_Age2 option:selected").val();
			if(Age1 < Age2){
				alert("연령제한 설정이 잘못되었습니다.");	
				$("#rma_Age2").focus();				
			}	
		});
		
		$("#ap_next").on("click", function() {								
			if (!$("#rma_Major").val()) {
				alert("전공/학과를 선택하세요.");
				$("#rma_Major").focus();
				return false;
			}
			if (!$("#rma_Vip").val()) {
				alert("우대조건을 선택하세요.");
				$("#rma_Vip").focus();
				return false;
			}
			if (!$("#rma_Foreign").val()) {
				alert("어학사항을 선택하세요.");
				$("#rma_Foreign").focus();
				return false;
			}
			if (!$("#rma_License").val()) {
				alert("자격증사항을 입력하세요.");
				$("#rma_License").focus();
				return false;
			}
			if($("#rma_Age_Btn_o").is(":checked")) { 
				if (!$("#rma_Age").val()) {
					alert("연령제한을 설정하세요.");
					$("#rma_Age").focus();
					return false;
				}
				if (!$("#rma_Age2").val()) {
					alert("연령제한을 설정하세요.");
					$("#rma_Age2").focus();
					return false;
				}	
			}
			/** 히든인 rma_Gender값에 체크된 값을 넣어주는것  */
			var Gender = $('input:radio[class="rma_Gender"]:checked').val();
			$("#rma_Gender").val(Gender);			
			window.open("/job/job/recruitment/apply/applyWrite.jsp", "", "width=500px height=500px");
		});
	});
</script>
<style type="text/css">
.ap_write {
	position: absolute; 
    margin: -150px 0 0 -75px;
    top: 25%;
    left: 30%;
    overflow: scroll;
}
.ap_p2 {
	text-align: left;
	font: 22px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: bold;
}
.ap_span {
	color: #FF8000;
}
.rma_Studylv {
	margin-left: 135px;
	margin-top: 10px;
	width:170px;
	height:40px;
	text-align: center;	
}
.rma_Studylv:hover {
	border: 1px solid;
}
.rma_Isfinish {
	width: 30px;
	height: 30px;
	margin-top: 10px;
	top: 40px;
}
.ap_Type_radio {
	margin-top: 0px;
	margin-left: 70px;
	width:55px;
	height:20px;
	text-align: center;
	background-color: #e8ecef;
}
.rma_Major {
	margin-left: 50px;
	width:400px;
	height:65px;
}
.rma_Vip {
	margin-left: 48px;
	width:400px;
	height:100px;
}
.rma_Foreign {
	margin-left: 74px;
	width:400px;
	height:65px;
}
.rma_License {
	margin-left: 145px;
	width:400px;
	height:65px;
}
.rma_Gender {
	margin-left: 70px;
	width:55px;
	height:20px;
	text-align: left;
}
.rma_Age_Btn {
	margin-left: 70px;
	width:55px;
	height:20px;
	text-align: center;
}
.ap_display {
	margin-left: 130px;
}
.rma_AgeSelect {
	margin-left: 10px;
	width:120px;
	height:40px;
}
.ap_p3, .ap_p5, .ap_p6, .ap_p7, .ap_p8, .ap_p9 {
	margin-left: 10px;
}
.ap_p4 {
	margin-left: 170px;
	color: #A4A4A4;
}
.rmi_Work {
	margin-left: 98px;
	width:400px;
	height:30px;
	background-color: #e8ecef;
	margin: 5px;
}
.ap_next {
	margin-top: 10px;
	margin-left:580px;
	margin-bottom: 30px;
	width: 180px;
	height: 60px;
	font-size: 18px;
	font-weight: bold;
	background-color: #2E2E2E;
	color: white;
	border: 0;
}
.ap_next:hover {
	background-color: black;
}
</style>
</head>
<body class="ap_write">
	<input type="hidden" id="rm_Seq" class="rm_Seq">
	<!-- 여기서부터 앞페이지에서 정보넘어온값 -->
	<input type="hidden" id="rmi_Seq" class="rmi_Seq">
	<input type="hidden" id="rmi_Personnel" class="rmi_Personnel">
	<input type="hidden" id="rmi_Type" class="rmi_Type">
	<input type="hidden" id="rmi_Work1" class="rmi_Work1">
	<input type="hidden" id="rmi_Work2" class="rmi_Work2">
	<input type="hidden" id="rmi_Work3" class="rmi_Work3">
	<input type="hidden" id="rmi_Department" class="rmi_Department">
	<input type="hidden" id="rmi_Official" class="rmi_Official">
	<div>
		<p class="ap_p2">자격요건 및 우대조건</p>
		<hr>
	</div>
	<p><span class="ap_span">&lowast;학력</span>
		<input type="radio" id="ap_Type_radio_x" class="ap_Type_radio" name="ap_Type_radio" value="학력무관" checked> 학력무관 
  		<input type="radio" id="ap_Type_radio_o" class="ap_Type_radio" name="ap_Type_radio" value="제한"> 제한</p>
  		<div id="ap_Type" class="ap_Type" style="display: none;">
  		<select id="rma_Studylv" class="rma_Studylv" name="rma_Studylv">
  			<option value="고등학교졸업이상">고등학교졸업이상</option>
  			<option value="대학졸업(2,3년)이상">대학졸업(2,3년)이상</option>
  			<option value="대학졸업(4년)이상">대학졸업(4년)이상</option>
  			<option value="석사졸업이상">석사졸업이상</option>
  			<option value="박사졸업">박사졸업</option>
  		</select>
  		<input type="checkbox" id="rma_Isfinish" class="rma_Isfinish" value="졸업예정자 가능">졸업예정자 가능
  		</div>
		<hr>
	<p class="ap_p3">전공/학과 (최대3개)	
  		<input type="text" id="rma_Major" class="rma_Major" name="rma_Major" placeholder="전공/학과를 선택하세요."></p>  	
	<hr>
	<p class="ap_p5">우대조건 	(최대10개)
		<input type="text" id="rma_Vip" class="rma_Vip" placeholder="우대조건을 선택하세요."></p>
	<hr>
	<p class="ap_p6">외국어 (최대3개)
		<input type="text" id="rma_Foreign" class="rma_Foreign" placeholder="어학사항을 선택하세요."></p>
	<hr>
	<p class="ap_p7">자격증
		<input type="text" id="rma_License" class="rma_License" placeholder="자격증명을 작성하세요."></p>
	<hr>
	<p class="ap_p8">성별  
		<input type="radio" id="rma_Gender1" class="rma_Gender" name="rma_Gender" value="성별무관" checked> 성별무관 
  		<input type="radio" id="rma_Gender2" class="rma_Gender" name="rma_Gender" value="남자"> 남자
  		<input type="radio" id="rma_Gender3" class="rma_Gender" name="rma_Gender" value="여자"> 여자</p>  		
  		<input type="hidden" id="rma_Gender">
	<hr>
	<p class="ap_p9">연령 
		<input type="radio" id="rma_Age_Btn_x" class="rma_Age_Btn" name="rma_Age_Btn" value="연령무관" checked> 연령무관
		<input type="radio" id="rma_Age_Btn_o" class="rma_Age_Btn" name="rma_Age_Btn" value="제한"> 제한</p>
		<div id="ap_display" class="ap_display" style="display: none;">
		<select id="rma_Age" class="rma_AgeSelect" name="rma_AgeSelect">
  			<option value="">전체</option>
  			<option value="2001">18세(2001)년생</option>
  			<option value="2000">19세(2000)년생</option>
  			<option value="1999">20세(1999)년생</option>
  			<option value="1998">21세(1998)년생</option>
  			<option value="1997">22세(1997)년생</option>
  			<option value="1996">23세(1996)년생</option>
  			<option value="1995">24세(1995)년생</option>
  			<option value="1994">25세(1994)년생</option>
  			<option value="1993">26세(1993)년생</option>
  			<option value="1992">27세(1992)년생</option>
  			<option value="1991">28세(1991)년생</option>
  			<option value="1990">29세(1990)년생</option>
  			<option value="1989">30세(1989)년생</option>
  			<option value="1988">31세(1988)년생</option>
  			<option value="1987">32세(1987)년생</option>
  			<option value="1986">33세(1986)년생</option>
  			<option value="1985">34세(1985)년생</option>
  			<option value="1984">35세(1984)년생</option>
  			<option value="1983">36세(1983)년생</option>
  			<option value="1982">37세(1982)년생</option>
  			<option value="1981">38세(1981)년생</option>
  			<option value="1980">39세(1980)년생</option>
  			<option value="1979">40세(1979)년생</option>
  			<option value="1978">41세(1978)년생</option>
  			<option value="1977">42세(1977)년생</option>
  			<option value="1976">43세(1976)년생</option>
  			<option value="1975">44세(1975)년생</option>
  			<option value="1974">45세(1974)년생</option>
  			<option value="1973">46세(1973)년생</option>
  			<option value="1972">47세(1972)년생</option>
  			<option value="1971">48세(1971)년생</option>
  			<option value="1970">49세(1970)년생</option>
  			<option value="1969">50세(1969)년생</option>
  			<option value="1968">51세(1968)년생</option>
  			<option value="1967">52세(1967)년생</option>
  			<option value="1966">53세(1966)년생</option>
  			<option value="1965">54세(1965)년생</option>
  			<option value="1964">55세(1964)년생</option>
  			<option value="1963">56세(1963)년생</option>
  			<option value="1962">57세(1962)년생</option>
  			<option value="1961">58세(1961)년생</option>
  			<option value="1960">59세(1960)년생</option>
  			<option value="1959">60세(1959)년생</option>
  			<option value="1958">61세(1958)년생</option>
  			<option value="1957">62세(1957)년생</option>
  			<option value="1956">63세(1956)년생</option>
  			<option value="1955">64세(1955)년생</option>
  			<option value="1954">65세(1954)년생</option>
  			<option value="1953">66세(1953)년생</option>
  			<option value="1952">67세(1952)년생</option>
  			<option value="1951">68세(1951)년생</option>
  			<option value="1950">69세(1950)년생</option>
  			<option value="1949">70세(1949)년생</option>
  		</select>
  		&nbsp;~
  		<select id="rma_Age2" class="rma_AgeSelect" name="rma_AgeSelect">
  			<option value="">전체</option>
  			<option value="2001">18세(2001)년생</option>
  			<option value="2000">19세(2000)년생</option>
  			<option value="1999">20세(1999)년생</option>
  			<option value="1998">21세(1998)년생</option>
  			<option value="1997">22세(1997)년생</option>
  			<option value="1996">23세(1996)년생</option>
  			<option value="1995">24세(1995)년생</option>
  			<option value="1994">25세(1994)년생</option>
  			<option value="1993">26세(1993)년생</option>
  			<option value="1992">27세(1992)년생</option>
  			<option value="1991">28세(1991)년생</option>
  			<option value="1990">29세(1990)년생</option>
  			<option value="1989">30세(1989)년생</option>
  			<option value="1988">31세(1988)년생</option>
  			<option value="1987">32세(1987)년생</option>
  			<option value="1986">33세(1986)년생</option>
  			<option value="1985">34세(1985)년생</option>
  			<option value="1984">35세(1984)년생</option>
  			<option value="1983">36세(1983)년생</option>
  			<option value="1982">37세(1982)년생</option>
  			<option value="1981">38세(1981)년생</option>
  			<option value="1980">39세(1980)년생</option>
  			<option value="1979">40세(1979)년생</option>
  			<option value="1978">41세(1978)년생</option>
  			<option value="1977">42세(1977)년생</option>
  			<option value="1976">43세(1976)년생</option>
  			<option value="1975">44세(1975)년생</option>
  			<option value="1974">45세(1974)년생</option>
  			<option value="1973">46세(1973)년생</option>
  			<option value="1972">47세(1972)년생</option>
  			<option value="1971">48세(1971)년생</option>
  			<option value="1970">49세(1970)년생</option>
  			<option value="1969">50세(1969)년생</option>
  			<option value="1968">51세(1968)년생</option>
  			<option value="1967">52세(1967)년생</option>
  			<option value="1966">53세(1966)년생</option>
  			<option value="1965">54세(1965)년생</option>
  			<option value="1964">55세(1964)년생</option>
  			<option value="1963">56세(1963)년생</option>
  			<option value="1962">57세(1962)년생</option>
  			<option value="1961">58세(1961)년생</option>
  			<option value="1960">59세(1960)년생</option>
  			<option value="1959">60세(1959)년생</option>
  			<option value="1958">61세(1958)년생</option>
  			<option value="1957">62세(1957)년생</option>
  			<option value="1956">63세(1956)년생</option>
  			<option value="1955">64세(1955)년생</option>
  			<option value="1954">65세(1954)년생</option>
  			<option value="1953">66세(1953)년생</option>
  			<option value="1952">67세(1952)년생</option>
  			<option value="1951">68세(1951)년생</option>
  			<option value="1950">69세(1950)년생</option>
  			<option value="1949">70세(1949)년생</option>
  		</select>
  		</div>
	<hr>
	<input type="button" id="ap_next" class="ap_next" value="다음">
</body>
</html>