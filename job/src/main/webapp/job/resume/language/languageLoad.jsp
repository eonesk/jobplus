<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>languageLoad</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function() {		
	alert("count = " + ${param.count});
	/* 총 개수 구함 */
	$.ajax({
		type: 'POST',
		url: 'LoadCount.do',
		dataType: 'text',
		cache: false,
		success: function(data) {
			$("#number").append(data);
			if(data == "0") {
				alert("어학이력 없음");
			} else {
				alert("어학이력");
				$.ajax({
					type: 'POST',
					url: 'Load.do',
					dataType: "json",
					success: function(data) {
						var trTitle = $("<tr>").addClass("LoadListTr");
						var tdTitle = $("<td>").addClass("LoadListTd").html("제목");
						
						trTitle.append(tdTitle);
						$("#RSLG_LoadList").append(trTitle);
						
						$.each(data.items, function(index, item) {
							var dto = item;
							var tr = $("<tr>").addClass("LoadListTr");
							var td = $("<td>").addClass("LoadListTd");
							var checkbox = $("<input>").attr({
								"id": "RSLG_UserTitle1",
								"type": "checkbox",
								"value": item.rslg_Seq
							}).addClass("RSLG_UserTitle1");
							var a = $("<a>").attr({
								"id": "RSLG_UserTitle2",
								"href": "#"
							}).html(item.RSLG_UserTitle).bind('click', {param: dto}, add_event);								
							
							td.append(checkbox);
							td.append(a);
							tr.append(td);
							$("#RSLG_LoadList").append(tr);	
						});
						
						var num = ${param.count};
						
						if(num == 3) {
							$(".RSLG_UserTitle1").attr("disabled", "true");
						} else if(num < 3 || num >= 0) {
							$(".RSLG_UserTitle1").on("change", function() {
								if($(this).is(":checked")){
									num++;
									if(num == 3) {
										$(".RSLG_UserTitle1").not($(".RSLG_UserTitle1")).attr("disabled", "true");
									}
								} else {
									num--;
									$(".RSLG_UserTitle1").removeAttr("disabled");
								}
							});
						}
						
						$("#RSLG_load").click(function() {
							
							var accumSeq = "";
							
			                $(".RSLG_UserTitle1:checked").each(function() {
			                	alert($(this).val());
			                	accumSeq += $(this).val() + "/";
			                });
			                
			                alert("accumSeq : " + accumSeq);
			                
			                if(accumSeq == "") {
			                	alert("체크해주세요.");
			                } else {
			                	alert("체크확인");
			                	if(confirm("불러오기를 진행하시겠습니까?")) {
			                		// 2개가 되야함. 확인해야할부분
			                		 alert("selected accumSeq : " + accumSeq);
			                		 alert("selected 보내기전 count : " + ${param.count});
			                		opener.parent.selected(accumSeq, ${param.count});
				                	self.close();
			                	}
			                	
			                }
						});
						
						function add_event(event) { 
							var userTitle = $("<h3>").html("[ " + event.data.param.RSLG_UserTitle + " ]");
							var table = $("<table>").attr("border", "1");
							var indexTr = $("<tr>");
							var indexTd1 = $("<td>").html("시험구분");
							var indexTd2 = $("<td>").html("외국어명");
							var indexTd3 = $("<td>").html("회화능력");
							var indexTd4 = $("<td>").html("시험명");
							var indexTd5 = $("<td>").html("급수/점수");
							var indexTd6 = $("<td>").html("취득연도");
							
							indexTr.append(indexTd1).append(indexTd2).append(indexTd3).append(indexTd4).append(indexTd5).append(indexTd6);
							table.append(indexTr);
							
							var contentTr = $("<tr>");
							var contentTd1 = $("<td>").html(event.data.param.rslg_Category);
							var contentTd2 = $("<td>").html(event.data.param.rslg_Name);								
							var contentTd3 = $("<td>").html(event.data.param.rslg_Lv);
							var contentTd4 = $("<td>").html(event.data.param.rslg_Test);
							var contentTd5 = $("<td>").html(event.data.param.rslg_Score);
							var contentTd6 = $("<td>").html(event.data.param.rslg_Date);
							
							contentTr.append(contentTd1).append(contentTd2).append(contentTd3).append(contentTd4).append(contentTd5).append(contentTd6);
							table.append(contentTr);
							
							$("#RSLG_loadView").append(userTitle);
							$("#RSLG_loadView").append(table);
							/*
			                $("#load").click(function() {
			                	$("#rslgSeq"+num, opener.document).val(event.data.param.rslg_Seq);
			                	$("#rslgCategory"+num, opener.document).val(event.data.param.rslg_Category);
			                	$("#rslgName"+num, opener.document).val(event.data.param.rslg_Name);
			                	$("#rslgLv"+num, opener.document).val(event.data.param.rslg_Lv);
			                	$("#rslgDate"+num, opener.document).val(event.data.param.rslg_Date);
			                	$("#rslgScore"+num, opener.document).val(event.data.param.rslg_Score);
			                	$("#rslgTest"+num, opener.document).val(event.data.param.rslg_Test);
			                	$("#rslgUserTitle"+num, opener.document).val(event.data.param.RSLG_UserTitle);
			                	
			                		alert("if진입전");
			        				if($("#rslgCategory" + num, opener.document).val() == "공인시험"){
			        					alert("if진입후");
			        					$("#test"+num, opener.document).css("display", "inline");
			        					$("#lv"+num, opener.document).css("display", "none");
			        				}else{
			        					$("#test"+num, opener.document).css("display", "none");
			        					$("#lv"+num, opener.document).css("display", "inline");
			        				}		
			        				                	
			                	self.close();
			                });	
							*/
						}
						alert("종료");
					},
					error : function(e) {
		                alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.: ' + e.status);
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
.title {
	font: 20px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: bold;
	color: #2A120A;
}
.load, .cancle {
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
.load:hover, .cancle:hover {
    background-color: #2E9AFE;
}
</style>
</head>
<body>
	<fieldset>
		<p class="title">어학이력 불러오기</p>
		내 어학이력 보관함 총&nbsp;<span id="number">&nbsp;</span>건
		<div>
			<table border="1" name="RSLG_LoadList" id="RSLG_LoadList" class="RSLG_LoadList">				
			</table>			
		</div>
		<div id="RSLG_loadView" class="RSLG_loadView">
		</div>
		<input type="button" value="불러오기" id="load" class="load">
		<input type="button" value="취소" id="cancle" class="cancle">	
	</fieldset>
</body>
</html>