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
	/* 자기소개서의 총 개수 구함 */
	$.ajax({
		type: 'POST',
		url: 'rsvLoadCount.do',
		dataType: 'text',
		cache: false,
		success: function(data) {
			if(data == "0") {
				alert("우대데이터 "+ data +"건 검색");
				
			} else {
				alert("우대데이터"+ data +"건 검색");
				$.ajax({
					type: 'POST',
					url: 'rsvLoad.do',
					dataType: "json",
					cache: false,
					success: function(data) {
						alert("성공");				
						
						
						
						$.each(data.items, function(index, item) {
							var dto = item;
							var count = 1; 
							
							
							var li = $("<li>").addClass("list_li");
							
							var checkbox = $("<input>").attr({
								"id": "rsv_userTitleR"+count,
								"type": "checkbox",
								"value": item.rsv_seq
							}).addClass("rsv_userTitleR");
							
							var label = $("<label>").attr({
								"for" : "rsv_userTitleR"+count
							}).addClass("checkOff");
							
							var a = $("<a>").attr({
								"id": "rsv_userTitleA",
								"href": "#"
							}).html(item.rsv_userTitle).bind('click', {param: dto}, add_event);
							
							var div_checkbox = $("<div>").addClass("div_checkbox").append(checkbox).append(label);
							var div_a = $("<div>").addClass("div_a").append(a);
							li.append(div_checkbox);
							li.append(div_a);
							$("#rsvList_ul").append(li);
			                
							 
							count++;																		 
						});							

						
						
						$("#rsvLoadOk").click(function() {
							//var eduSeqList = new Array();
							
							var accumSeq = "";
							
			                //체크한값의 
							$(".rsv_userTitleR:checked").each(function() {
			                	alert($(this).val());
			                	//eduSeqList.push($(this).val());
			                	accumSeq += $(this).val() + "/";
			                });
			                
			                alert(accumSeq);
			                
			                if(accumSeq == "") {
			                	alert("체크해주세요");
			                } else {
			                	alert("체크됨");
			                	if(confirm("불러오기를 진행하시겠습니까?")) {
			                		opener.parent.selected(accumSeq);
				                	self.close();
			                	}
			                	
			                }
						});
						
											
						function add_event(event) {
						alert(event.data.param.rsv_userTitle + " // " + event.data.param.m_id);
						
						$("#rsvLoadSelectList").html("");

						var userTitle = $("<legend>").html(event.data.param.rsv_userTitle);
						
						/* var table = $("<table>").attr("border", "1"); */
						var ul = $("<ul>").addClass("selectListUl");
						
						var span1 = $("<span>").html(event.data.param.rsv_isMedal);
						var span2 = $("<span>").html(event.data.param.rsv_isProtect);
						var span3 = $("<span>").html(event.data.param.rsv_isMoney);
						var span4 = $("<span>").html(event.data.param.rsv_isDisable);
						var span5 = $("<span>").html(event.data.param.rsv_military);
						var span6 = $("<span>").html(event.data.param.rsv_startDate);
						var span7 = $("<span>").html(event.data.param.rsv_endDate);
						var span8 = $("<span>").html(event.data.param.rsv_position);
						
						var li1 = $("<li>").html("보훈대상 : ").append(span1);
						var li2 = $("<li>").html("취업보호대상: ").append(span2);
						var li3 = $("<li>").html("고용지원금대상 : ").append(span3);
						var li4 = $("<li>").html("장애여부 : ").append(span4);
						var li5 = $("<li>").html("병역여부 : ").append(span5);
						var li6 = $("<li>").html("입대일 : ").append(span6);
						var li7 = $("<li>").html("전역일 : ").append(span7);
						var li8 = $("<li>").html("군별/제대계급 : ").append(span8);
						
						ul.append(li1).append(li2).append(li3).append(li4).append(li5).append(li6)
						.append(li7).append(li8);
						$("#rsvLoadSelectList").append(userTitle);
						$("#rsvLoadSelectList").append(ul);
						$("#rsvLoadSelectList").show();
						}				
					},
					error : function(e) {
		                alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
		         	}
				});			
			}
		},
	
		error : function(e) {
            alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
     	}
	});	
});
$(function() {
	$("input[type=checkbox]").change(function() {
		var is_check = $(this).is(":checked");
		if(is_check){
			$(this).next().addClass("checkOn");
			$(this).next().removeClass("checkOff");
		}else{
			$(this).next().addClass("checkOff");
			$(this).next().removeClass("checkOn");
		}
	});
	$("#rsvLoadCancle").click(function() {
		window.close();
	});
});
</script>

<style type="text/css">
::-webkit-scrollbar {
	display: none;
}

ul{
	margin: 0;
	padding: 0;
}

#loadContainer {
	width: 400px;
}

#rsvLoadHeader, #rsvLoadSection, #rsvLoadFooter {
	
}

#rsvLoadHeader {
	height: 40px;
	background-color: #3C53AF;
	text-align: center;
	color: white;
	font-weight: bold;
	font-size: 20px;
	padding-top: 15px;
}

#rsvLoadSection {
	margin-bottom: 20px;
	text-align: center;
	height: auto;
}

#rsvLoadSection p {
	color: lightgray;
}

#rsvLoadSection input {
	
}

.rsvLoadList {
	width: 80%;
	height: 250px;
	overflow:hidden;
	margin-left: 30px;
	-ms-overflow-style: none; /* IE에서 스크롤바 감춤 */
	text-align: left;
}

.rsvLoadList .list_ul{
	list-style: none;
	height:100%;
	overflow: auto;
	-ms-overflow-style: none; /* IE에서 스크롤바 감춤 */
	line-height: 50px;
}

.rsvList_li{
	list-style: none; 
	text-align: center;
	width: 100%;
	
}
.div_checkbox{
	display:inline-block;
	width: 20%;
}

.checkOff {
	background: url('//www.saraminimage.co.kr/ui/join/bg_check_bullet.png')
		no-repeat 0 0px;
}

.checkOn {
	background: url('//www.saraminimage.co.kr/ui/join/bg_check_bullet.png')
		no-repeat 0 -30px;
}

.div_checkbox label {
	cursor: pointer;
	width: 30px;
	height: 30px;
}

.div_a{
	display:inline-block;
	width: 70%;
}

.div_a a{
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
}

.rsvLoadList legend {
	font-weight: bold;
}

.rsvLoadSelectList{
	width: 80%;
	margin-left: 30px;
	overflow: auto;
	-ms-overflow-style: none; /* IE에서 스크롤바 감춤 */
	text-align: center;
	font-weight: bold;
	display: none;
}



.rsvListDiv{
	border-bottom: 1px solid lightgray;
	font-size: 20px;
	font-weight: bold;
	width: 100%;
}

.rsvListTitle1{
	display:inline-block;
	text-align: center;
	width:30%;
}

.rsvListTitle2{
	display:inline-block;
	text-align: center;
	width:60%;
}
#rsvLoadFooter {
	height: 80px;
	text-align: center;
}
#rsvLoadOk {
	color: #607CEA;
	/* border-color : #607CEA; */
}
#rsvLoadFooter button {
	width: 180px;
	height: 50px;
	background-color: white;
	border: 1px solid lightgray;
	border-radius: 1.0em;
}


</style>





</head>
<body>
	<div id="rsvLoadContainer">
		<div id="rsvLoadHeader">불러오기</div>
		<div id="rsvLoadSection">
			<h3>불러오기 하는 방법</h3>
			<p>불러올 아이템들을 선택후 확인버튼을 클릭하세요</p>
			<fieldset class="rsvLoadList">
				<legend>목록</legend>
				<div class="rsvListDiv">
					<div class="rsvListTitle1">선택</div>
					<div class="rsvListTitle2">제목</div>
				</div>
				<ul id="rsvList_ul" class="rsvList_ul">
					
				</ul>
			</fieldset>
			<fieldset class="rsvLoadSelectList" id="rsvLoadSelectList">
			
			</fieldset>
		</div>
		<div id="rsvLoadFooter">
			<button type="button" id="rsvLoadCancle">취소</button>
			<button type="button" id="rsvLoadOk">확인</button>
		</div>
	</div>
</body>
</html>