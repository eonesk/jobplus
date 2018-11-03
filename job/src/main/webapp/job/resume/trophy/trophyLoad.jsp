<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trophyLoad</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		//var count = ${param.count};
		alert("count = " + ${param.count});
		// 총 개수
		$.ajax({
			type: 'POST',
			url: 'LoadCount.do',
			dataType: 'text',
			cache: false,
			success: function(data) {
				$("#number").append(data);
				if(data == "0") {
					alert("수상이력 없음");
				} else {
					alert("수상이력");
					
					$.ajax({
						type: 'POST',
						url: 'Load.do',
						dataType: "json",
						cache: false,
						success: function(data) {
							alert("성공");
							var trTitle = $("<tr>").addClass("LoadListTr");
							var tdTitle = $("<td>").addClass("LoadListTd").html("제목");
							
							trTitle.append(tdTitle);
							$("#LoadList").append(trTitle);
							
							$.each(data.items, function(index, item) {
								var dto = item;
								var tr = $("<tr>").addClass("LoadListTr");
								var td = $("<td>").addClass("LoadListTd");
								var checkbox = $("<input>").attr({
									"id": "RST_UserTitleR",
									"type": "checkbox",
									"value": item.rst_Seq
								}).addClass("RST_UserTitleR");
								var a = $("<a>").attr({
									"id": "RST_UserTitle1",
									"href": "#"
								}).html(item.RST_UserTitle).bind('click', {param: dto}, add_event);								
								
								td.append(checkbox);
								td.append(a);
								tr.append(td);
								$("#LoadList").append(tr);	
							});
							
							var num = ${param.count};
							
							if(num == 3) {
								$(".RST_UserTitleR").attr("disabled", "true");
							} else if(num < 3 || num >= 0) {
								$(".RST_UserTitleR").on("change", function() {
									if($(this).is(":checked")){
										num++;
										if(num == 3) {
											$(".RST_UserTitleR").not($(".RST_UserTitleR")).attr("disabled", "true");
										}
									} else {
										num--;
										$(".RST_UserTitleR").removeAttr("disabled");
									}
								});
							}
							
							$("#load").click(function() {
								
								var accumSeq = "";
								
				                $(".RST_UserTitleR:checked").each(function() {
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
								var userTitle = $("<h3>").html("[ " + event.data.param.RST_UserTitle + " ]");
								var table = $("<table>").attr("border", "1");
								var indexTr = $("<tr>");
								var indexTd1 = $("<td>").html("수상명");
								var indexTd2 = $("<td>").html("수여기관");
								var indexTd3 = $("<td>").html("수상연도");
								var indexTd4 = $("<td>").html("수여내용");
								
								indexTr.append(indexTd1).append(indexTd2).append(indexTd3).append(indexTd4);
								table.append(indexTr);
								
								var contentTr = $("<tr>");
								var contentTd1 = $("<td>").html(event.data.param.rst_Name);
								var contentTd2 = $("<td>").html(event.data.param.rst_Company);								
								var contentTd3 = $("<td>").html(event.data.param.rst_Date);
								var contentTd4 = $("<td>").html(event.data.param.rst_Content);
								
								contentTr.append(contentTd1).append(contentTd2).append(contentTd3).append(contentTd4);
								table.append(contentTr);
								
								$("#loadView").append(userTitle);
								$("#loadView").append(table);
								
								/*
				                $("#load").click(function() {
				                	$("#rstSeq"+num, opener.document).val(event.data.param.rst_Seq);
				                	$("#rstName"+num, opener.document).val(event.data.param.rst_Name);
				                	$("#rstCompany"+num, opener.document).val(event.data.param.rst_Company);				                	
				                	$("#rstDate"+num, opener.document).val(event.data.param.rst_Date);
				                	$("#rstContent"+num, opener.document).val(event.data.param.rst_Content);
				                	$("#rstuserTitle"+num, opener.document).val(event.data.param.RST_UserTitle);
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
		<p class="title">수상내역 불러오기</p>
		내 수상내역 보관함 총&nbsp;<span id="number">&nbsp;</span>건
		<div>
			<table border="1" name="LoadList" id="LoadList">
			</table>
		</div>
		<div id="loadView" class="loadView">
		</div>
		<input type="button" value="불러오기" id="load" class="load">
		<input type="button" value="취소" id="cancle" class="cancle">	
	</fieldset>
</body>
</html>