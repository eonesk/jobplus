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
	alert("addCount : " + ${param.addCount});
	/* 자기소개서의 총 개수 구함 */
	$.ajax({
		type: 'POST',
		url: 'rswLoadCount.do',
		dataType: 'text',
		cache: false,
		success: function(data) {
			if(data == "0") {
				alert("경력데이터 "+ data +"건 검색");
				
			} else {
				alert("경력데이터"+data +"건 검색");
				$.ajax({
					type: 'POST',
					url: 'rswLoad.do',
					dataType: "json",
					cache: false,
					success: function(data) {
						alert("성공");				
						
						/* var trTitle = $("<tr>").addClass("eduLoadListLabelTr");
						var tdTitle = $("<td>").addClass("eduLoadListLabelTd").html("제목");
						
						trTitle.append(tdTitle);
						$("#eduLoadListTable").append(trTitle); */
						
						$.each(data.items, function(index, item) {
							var dto = item;
							var count = 1; 
							
							
							var li = $("<li>").addClass("list_li");
							
							var checkbox = $("<input>").attr({
								"id": "rsw_userTitleR"+count,
								"type": "checkbox",
								"value": item.rsw_seq
							}).addClass("rsw_userTitleR");
							
							var label = $("<label>").attr({
								"for" : "rsw_userTitleR"+count
							}).addClass("checkOff");
							
							var a = $("<a>").attr({
								"id": "rsw_userTitleA",
								"href": "#"
							}).html(item.rsw_userTitle).bind('click', {param: dto}, add_event);
							
							var div_checkbox = $("<div>").addClass("div_checkbox").append(checkbox).append(label);
							var div_a = $("<div>").addClass("div_a").append(a);
							li.append(div_checkbox);
							li.append(div_a);
							$("#rswList_ul").append(li);
			                /*$("#eduLoadListTable").append(tr); */	
							 
							count++;																		 
						});							

						/** 부모창 입력폼의 최대값을 맞춰주기 위해서 {부모창+checkbox선택값 <=3}이 되도록 해주는... */
						// {부모창+checkbox선택값 >3}이 되면 checkbox값이 disabled됨.
						
						var isOverflow = ${param.addCount};
						
						
						if(isOverflow == 3) {
							$(".rsw_userTitleR").attr("disabled", "true");
						} else if(isOverflow < 3 || isOverflow >= 0) {
							$(".rsw_userTitleR").on("change", function() {
								if($(this).is(":checked")){
									isOverflow++;
									/* alert("isOverflow[rsw_UserTitleR change] : " + isOverflow); */
									if(isOverflow == 3) {
										$(".rsw_userTitleR").attr("disabled", "true");
									}
								} else {
									isOverflow--;
									/* alert("isOverflow[rsw_UserTitleR change] : " + isOverflow); */
								}
							});
						}
						
						$("#rswLoadOk").click(function() {
							//var eduSeqList = new Array();
							
							var accumSeq = "";
							
			                //체크한값의 
							$(".rsw_userTitleR:checked").each(function() {
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
			                		opener.parent.selected(accumSeq, ${param.addCount});
				                	self.close();
			                	}
			                	
			                }
						});
						
											
						function add_event(event) {
						alert(event.data.param.rsw_userTitle + " // " + event.data.param.m_id);
						
						$("#rswLoadSelectList").html("");

						var userTitle = $("<legend>").html(event.data.param.rsw_userTitle);
						
						/* var table = $("<table>").attr("border", "1"); */
						var ul = $("<ul>").addClass("selectListUl");
						
						var span1 = $("<span>").html(event.data.param.rsw_company);
						var span2 = $("<span>").html(event.data.param.rsw_dept);
						var span3 = $("<span>").html(event.data.param.rsw_startDate);
						var span4 = $("<span>").html(event.data.param.rsw_endDate);
						var span5 = $("<span>").html(event.data.param.rsw_position);
						var span6 = $("<span>").html(event.data.param.rsw_job);
						var span7 = $("<span>").html(event.data.param.rsw_pay);
						var span8 = $("<span>").html(event.data.param.rsw_part);
						
						var li1 = $("<li>").html("회사명 : ").append(span1);
						var li2 = $("<li>").html("부서명 : ").append(span2);
						var li3 = $("<li>").html("입사년월 : ").append(span3);
						var li4 = $("<li>").html("퇴사년월 : ").append(span4);
						var li5 = $("<li>").html("직급/직책 : ").append(span5);
						var li6 = $("<li>").html("직무 : ").append(span6);
						var li7 = $("<li>").html("연봉 : ").append(span7);
						var li8 = $("<li>").html("담당업무 : ").append(span8);
						
						ul.append(li1).append(li2).append(li3).append(li4).append(li5).append(li6)
						.append(li7).append(li8);
						$("#rswLoadSelectList").append(userTitle);
						$("#rswLoadSelectList").append(ul);
						$("#rswLoadSelectList").show();
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
	$("#loadCancle").click(function() {
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

#rswLoadContainer {
	width: 400px;
}

#rswLoadHeader, #rswLoadSection, #rswLoadFooter {
	
}

#rswLoadHeader {
	height: 40px;
	background-color: #3C53AF;
	text-align: center;
	color: white;
	font-weight: bold;
	font-size: 20px;
	padding-top: 15px;
}

#rswLoadSection {
	margin-bottom: 20px;
	text-align: center;
	height: auto;
}

#rswLoadSection p {
	color: lightgray;
}

#rswLoadSection input {
	
}

.rswLoadList {
	width: 80%;
	height: 250px;
	overflow:hidden;
	margin-left: 30px;
	-ms-overflow-style: none; /* IE에서 스크롤바 감춤 */
	text-align: left;
}

.rswLoadList .list_ul{
	list-style: none;
	height:100%;
	overflow: auto;
	-ms-overflow-style: none; /* IE에서 스크롤바 감춤 */
	line-height: 50px;
}

.rswList_li{
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

.rswLoadList legend {
	font-weight: bold;
}

.rswLoadSelectList{
	width: 80%;
	margin-left: 30px;
	overflow: auto;
	-ms-overflow-style: none; /* IE에서 스크롤바 감춤 */
	text-align: center;
	font-weight: bold;
	display: none;
}



.rswListDiv{
	border-bottom: 1px solid lightgray;
	font-size: 20px;
	font-weight: bold;
	width: 100%;
}

.rswListTitle1{
	display:inline-block;
	text-align: center;
	width:30%;
}

.rswListTitle2{
	display:inline-block;
	text-align: center;
	width:60%;
}
#rswLoadFooter {
	height: 80px;
	text-align: center;
}
#rswLoadOk {
	color: #607CEA;
	/* border-color : #607CEA; */
}
#rswLoadFooter button {
	width: 180px;
	height: 50px;
	background-color: white;
	border: 1px solid lightgray;
	border-radius: 1.0em;
}


</style>





</head>
<body>
	<div id="rswLoadContainer">
		<div id="rswLoadHeader">불러오기</div>
		<div id="rswLoadSection">
			<h3>불러오기 하는 방법</h3>
			<p>불러올 아이템들을 선택후 확인버튼을 클릭하세요</p>
			<fieldset class="rswLoadList">
				<legend>목록</legend>
				<div class="rswListDiv">
					<div class="rswListTitle1">선택</div>
					<div class="rswListTitle2">제목</div>
				</div>
				<ul id="rswList_ul" class="list_ul">
					
				</ul>
			</fieldset>
			<fieldset class="rswLoadSelectList" id="rswLoadSelectList">
			
			</fieldset>
		</div>
		<div id="rswLoadFooter">
			<button type="button" id="rswLoadCancle">취소</button>
			<button type="button" id="rswLoadOk">확인</button>
		</div>
	</div>
</body>
</html>