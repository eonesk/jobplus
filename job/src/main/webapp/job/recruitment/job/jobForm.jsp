


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
body{
	width:800;
}
.rmj_container{
	background-color:#F2F2F2;
	font-family: "Malgun Gothic",gulim,dotum,sans-serif;
	letter-spacing: -1px;
	font-size:14px;
	width: 880px;
	/* height:698px; */
	margin:auto;
	line-height: 65px;
}

.rmj_header{
	padding:20px;
	letter-spacing: -3px;
	font-size:33px;
	text-align: center;
}

.rmj_line1{

}

.rmj_titleSpan{
	float:left;
	font-size: 21px;
	font-weight: bold;
	width:115px;
}
.rmj_job{
	width: 587px;
	height:50px;
}

.rmj_category{
	width:150px;
	height:52px;
	background: #424242;
	border-radius: 3px;
	border-color: gray;
	border:none;
	outline: none;
	color:white;
}

.rmj_category:hover{
	background: darkgray;
}

.rmj_careerUl{
	display:inline-block;
}
.rmj_careerLi{
	display:inline-block;
	font-size:16px;
	font-weight: bold;
}
.rmj_career{
	position:relative;
	top: 4px;
	width: 25px;
	height:25px;
}

.rmj_careerLabel{
	display:inline-block;
	width:120px;
	height:25px;
}

/** lineThree*/
.rmj_typeUl{
	float:left;
	width:80%;	
}

.rmj_typeLi{
	display:inline-block;
	font-size:16px;
	font-weight: bold;
	
}

.rmj_type{
	position:relative;
	top: 5px;
	width: 25px;
	height:25px;
	
}
.rmj_line3{
	/* width:100%;
	height:auto; */
}

.rmj_typeLabel{
	display:inline-block;
	width:120px;
	height:25px;
}

/** lineFour */
.rmj_detailMoveBtn{
	width: 300px;
	height:80px;
	background-color: #424242;
	color:white;
	font-size:15px;
	
}
.rmj_line1,.rmj_line2,.rmj_line3,.rmj_line4,.rmj_hideDiv{
	display:inline-block;
	width:100%;
}

.rmj_line4{
	text-align: center;
}
.rmj_detailMoveBtn:hover{
	background: darkgray;
	
}
.rmj_hideDiv{
	border:1px solid lightgray;
	background-color:white;
	height :80px;
	width:87%;
	float:right;
	padding-top: 10px;
}

.rmj_hideSelect{
	width:90px;
	height:40px;
	margin-left: 5px;
	margin-right: 5px;
}

.rmj_hideLabel{
	display:inline-block;
	width: 80px;
	font-size:15px;
	font-weight:bold;
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {
		
		$("#rmj_hideDiv").hide();
		$("input[name='rmj_career']").change(function() {
			if($(this).val() != "경력무관"){
				$("#rmj_career3").prop("checked", false);
			}else{
				$("#rmj_career1").prop("checked", false);
				$("#rmj_career2").prop("checked", false);
			}
			if($(this).val() == "경력"){
				$("#rmj_hideDiv").show();
			}else{
				$("#rmj_hideDiv").hide();
			}
		});
		
		$("input[name='rmj_type']").change(function() {
			if(($("input[name='rmj_type']:checked").length) > 3){
				alert("안되");
				$(this).prop("checked", false);
				return false;
			}
		});
	});
</script>
</head>
<body>
<div id="rmj_container" class="rmj_container">
	<p id="rmj_header" class="rmj_header">어떤 인재를 뽑을 계획이세요?</p>
	<div id="rmj_content" class="rmj_content">
		<div id="rmj_line1" class="rmj_line1">
			<span id="rmj_titleSpan1" class="rmj_titleSpan">직종/직무</span>
			<input type="text" id="rmj_job" name="rmj_job" class="rmj_job" placeholder="직종을 입력해 주세요">
			<button id="" class="rmj_category">전체 카테고리</button>
		</div>
		<div id="rmj_line2" class="rmj_line3">
			<span id="rmj_titleSpan2" class="rmj_titleSpan">경력여부</span>
			<ul id="rmj_careerUl" class="rmj_careerUl">
				<li id="rmj_careerLi1" class="rmj_careerLi"><label class="rmj_careerLabel"><input type="checkbox" value="신입"   id="rmj_career" name="rmj_career" class="rmj_career">신입</label></li>
				<li id="rmj_careerLi2" class="rmj_careerLi"><label class="rmj_careerLabel"><input type="checkbox" value="경력"    id="rmj_career2"name="rmj_career" class="rmj_career">경력</label></li>
				<li id="rmj_careerLi3" class="rmj_careerLi"><label class="rmj_careerLabel"><input type="checkbox" value="경력무관" id="rmj_career3"name="rmj_career" class="rmj_career">경력무관</label>
				</li>
			</ul>
		</div>
		<div id="rmj_hideDiv" class="rmj_hideDiv">
			<label id="rmj_hideLabel" class="rmj_hideLabel">경력</label> 
			<select id="rmj_carrerStart" name="rmj_carrerStart" class="rmj_hideSelect">
				<c:forEach var="i"  begin="1" end="19" step="1">
					<option>${i}년이상</option>
				</c:forEach>
			</select>~
			<select id="rmj_carrerEnd" name="rmj_carrerEnd" class="rmj_hideSelect">
				<c:forEach var="i"  begin="1" end="19" step="1">
					<option>${i}년이하</option>
				</c:forEach>
			</select>
		</div>
		<div id="rmj_line3" class="rmj_line3">
			<span id="rmj_titleSpan3" class="rmj_titleSpan">고용형태</span>
			<ul id="rmj_typeUl" class="rmj_typeUl">
				<li class="rmj_typeLi"><label class="rmj_typeLabel"><input id="rmj_type1"  name="rmj_type" type="checkbox" class="rmj_type">정규직</label></li>
				<li class="rmj_typeLi"><label class="rmj_typeLabel"><input id="rmj_type2"  name="rmj_type" type="checkbox" class="rmj_type">계약직</label></li>
				<li class="rmj_typeLi"><label class="rmj_typeLabel"><input id="rmj_type3"  name="rmj_type" type="checkbox" class="rmj_type">아르바이트</label></li>
				<li class="rmj_typeLi"><label class="rmj_typeLabel"><input id="rmj_type4"  name="rmj_type" type="checkbox" class="rmj_type">인턴직</label></li>
				<li class="rmj_typeLi"><label class="rmj_typeLabel"><input id="rmj_type5"  name="rmj_type" type="checkbox" class="rmj_type">프리랜서</label></li>
				<li class="rmj_typeLi"><label class="rmj_typeLabel"><input id="rmj_type6"  name="rmj_type" type="checkbox" class="rmj_type">파트</label></li>
				<li class="rmj_typeLi"><label class="rmj_typeLabel"><input id="rmj_type7"  name="rmj_type" type="checkbox" class="rmj_type">위촉직</label></li>
				<li class="rmj_typeLi"><label class="rmj_typeLabel"><input id="rmj_type8"  name="rmj_type" type="checkbox" class="rmj_type">파견직</label></li>
				<li class="rmj_typeLi"><label class="rmj_typeLabel"><input id="rmj_type9"  name="rmj_type" type="checkbox" class="rmj_type">전임</label></li>
				<li class="rmj_typeLi"><label class="rmj_typeLabel"><input id="rmj_type10" name="rmj_type" type="checkbox" class="rmj_type">병역특례</label></li>
				<li class="rmj_typeLi"><label class="rmj_typeLabel"><input id="rmj_type11" name="rmj_type" type="checkbox" class="rmj_type">교육생</label></li>
				<li class="rmj_typeLi"><label class="rmj_typeLabel"><input id="rmj_type12" name="rmj_type" type="checkbox" class="rmj_type">해외취업</label></li>
			</ul>
		</div>
		<div id="rmj_line4" class="rmj_line4">
			<input type="button" value="상세 내용 채우기로 이동 ▽" class="rmj_detailMoveBtn">
		</div>
	</div>
</div>
</body>
</html>
