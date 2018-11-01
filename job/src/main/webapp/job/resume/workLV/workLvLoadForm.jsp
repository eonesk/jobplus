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
							
							var li = $("<li>").addClass("list_li");
							
							
							var checkbox = $("<input>").attr({
								"id": "rsw_UserTitleR",
								"type": "checkbox",
								"value": item.rsw_seq
							}).addClass("rsw_UserTitleR");
							
							var a = $("<a>").attr({
								"id": "rsw_UserTitleA",
								"href": "#"
							}).html(item.rsw_userTitle);
							
							li.append(checkbox);
							li.append(a);
							$("#list_ul").append(li);
			                /*$("#eduLoadListTable").append(tr); */	
							 
																		 
						});							

						/** 부모창 입력폼의 최대값을 맞춰주기 위해서 {부모창+checkbox선택값 <=3}이 되도록 해주는... */
						// {부모창+checkbox선택값 >3}이 되면 checkbox값이 disabled됨.
						
						var isOverflow = ${param.addCount};
						
						
						if(isOverflow == 3) {
							$(".rsw_UserTitleR").attr("disabled", "true");
						} else if(isOverflow < 3 || isOverflow >= 0) {
							$(".rsw_UserTitleR").on("change", function() {
								if($(this).is(":checked")){
									isOverflow++;
									/* alert("isOverflow[rsw_UserTitleR change] : " + isOverflow); */
									if(isOverflow == 3) {
										$(".rsw_UserTitleR").attr("disabled", "true");
									}
								} else {
									isOverflow--;
									/* alert("isOverflow[rsw_UserTitleR change] : " + isOverflow); */
								}
							});
						}
						
						$("#loadOk").click(function() {
							//var eduSeqList = new Array();
							
							var accumSeq = "";
							
			                $(".rsw_UserTitleR:checked").each(function() {
			                	alert($(this).val());
			                	//eduSeqList.push($(this).val());
			                	accumSeq += $(this).val() + "/";
			                });
			                
			                alert(accumSeq);
			                
			                if(accumSeq == "") {
			                	alert("체크해주셍ㅂ");
			                } else {
			                	alert("체크됨");
			                	if(confirm("불러오기를 진행하시겠습니까?")) {
			                		opener.parent.selected(accumSeq, ${param.eduPlusButtonCnt});
				                	self.close();
			                	}
			                	
			                }
						});
						
						/* function add_event(event) {
							alert(event.data.param.rse_UserTitle + " // " + event.data.param.m_Id);
							$("#eduLoadViewInit").hide();
							$("#eduLoadView").html("");

							var userTitle = $("<h3>").html("[ " + event.data.param.rse_UserTitle + " ]");
							var table = $("<table>").attr("border", "1");
							var indexTr = $("<tr>");
							var indexTd1 = $("<td>").html("교육명");
							var indexTd2 = $("<td>").html("교육기관");
							var indexTd3 = $("<td>").html("시작년월");
							var indexTd4 = $("<td>").html("종료년월");
							var indexTd5 = $("<td>").html("교육내용");
							
							indexTr.append(indexTd1).append(indexTd2).append(indexTd3).append(indexTd4).append(indexTd5);
							table.append(indexTr);
							
							var contentTr = $("<tr>");
							var contentTd1 = $("<td>").html(event.data.param.rse_Name);
							var contentTd2 = $("<td>").html(event.data.param.rse_Company);								
							var contentTd3 = $("<td>").html(event.data.param.rse_Startdate);
							var contentTd4 = $("<td>").html(event.data.param.rse_Enddate);
							var contentTd5 = $("<td>").html(event.data.param.rse_Content);
							
							contentTr.append(contentTd1).append(contentTd2).append(contentTd3).append(contentTd4).append(contentTd5);
							table.append(contentTr);
							
							$("#eduLoadView").append(userTitle);
							$("#eduLoadView").append(table);
						} */
						/* alert("종료"); */					
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
		$("#cancle").click(function() {
			window.close();
		});
	});
</script>

<style type="text/css">
::-webkit-scrollbar {
	display: none;
}

#loadContainer {
	width: 400px;
}

#loadHeader, #loadSection, #loadFooter {
	
}

#loadHeader {
	height: 40px;
	background-color: #3C53AF;
	text-align: center;
	color: white;
	font-weight: bold;
	font-size: 20px;
	padding-top: 15px;
}

#loadSection {
	margin-bottom: 20px;
	text-align: center;
	height: 350px;
}

#loadSection p {
	color: lightgray;
}

#loadSection input {
	width: 60%;
	height: 40px;
}

.loadList {
	width: 80%;
	height: 250px;
	margin-left: 30px;
	overflow: auto;
	-ms-overflow-style: none; /* IE에서 스크롤바 감춤 */
	text-align: left;
}

.loadList legend {
	
}

.listDiv{
	border-bottom: 1px solid lightgray;
	
}

.listTitle{
	font-size: 20px;
	font-weight: bold;
}
.listTitle:nth-child(1){
	padding-left: 20px;
}

.listTitle:nth-child(2){
	padding-left: 100px;
}
#loadFooter {
	height: 80px;
	text-align: center;
}
#loadOk {
	color: #607CEA;
	/* border-color : #607CEA; */
}
#loadFooter button {
	width: 180px;
	height: 50px;
	background-color: white;
	border: 1px solid lightgray;
	border-radius: 1.0em;
}

.list_li{
	width:200px;
	height:20px;
	list-style: none; 
	
	border:1px solid gray;
}
.list_li a{
	font-size: 20px;
	font-weight: bold;
	text-decoration: none;
	color:black;
}
</style>





</head>
<body>
	<div id="loadContainer">
		<div id="loadHeader">불러오기</div>
		<div id="loadSection">
			<h3>불러오기 하는 방법</h3>
			<p>불러올 아이템들을 선택후 확인버튼을 클릭하세요</p>
			<fieldset class="loadList">
				<legend>목록</legend>
				<div class="listDiv">
					<span class="listTitle">선택</span>
					<span class="listTitle">제목</span><br>
				</div>
				<ul id="list_ul" class="list_ul">
					
				</ul>
			</fieldset>
		</div>
		<div id="loadFooter">
			<button type="button" id="loadCancle">취소</button>
			<button type="button" id="loadOk">확인</button>
		</div>
	</div>
</body>
</html>