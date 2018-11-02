<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>internLoad</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {		
		var count = ${param.count};
		/* 총 개수 구함 */
		$.ajax({
			type: 'POST',
			url: 'LoadCount.do',
			dataType: 'text',
			cache: false,
			success: function(data) {
				$("#number").append(data);
				if(data == "0") {
					alert("인턴이력 없음");
				} else {
					alert("인턴이력");
					$.ajax({
						type: 'POST',
						url: 'Load.do',
						dataType: "json",
						cache: false,
						success: function(data) {
							var trTitle = $("<tr>").addClass("LoadListTr");
							var tdTitle = $("<td>").addClass("LoadListTd").html("제목");
							
							trTitle.append(tdTitle);
							$("#LoadList").append(trTitle);
							
							$.each(data.items, function(index, item) {
								var dto = item;
								var tr = $("<tr>").addClass("LoadListTr");
								var td = $("<td>").addClass("LoadListTd");
								var checkbox = $("<input>").attr({
									"id": "rsit_UserTitleA",
									"type": "checkbox",
									"value": item.rsit_Seq
								}).addClass("rsit_UserTitleA");
								var a = $("<a>").attr({
									"id": "rsit_UserTitle1",
									"href": "#"
								}).html(item.rsit_UserTitle).bind('click', {param: dto}, add_event);								
								td.append(checkbox);
								td.append(a);
								tr.append(td);
								$("#LoadList").append(tr);	
							});
							
							//var count = num;							
							if(count == 3) {
								$(".rsit_UserTitleA").attr("disabled", "true");
							} else if(count < 3 || count >= 0) {
								$(".rsit_UserTitleA").on("change", function() {
									if($(this).is(":checked")){
										count++;
										if(count == 3) {
											$(".rsit_UserTitleA").not($(".rsit_UserTitleA:checked")).attr("disabled", "true");
										}
									} else {
										count--;
										$(".rsit_UserTitleA").removeAttr("disabled");
									}
								});
							}
							$("#load").click(function() {									
								var accumSeq = "";								
				                $(".rsit_UserTitleA:checked").each(function() {
				                	accumSeq += $(this).val() + "/";
				                });				                
				                alert("accumSeq : " + accumSeq);				                
				                if(accumSeq == "") {
				                	alert("체크해주세요");
				                } else {
				                	alert("체크됨");
				                	if(confirm("불러오기를 진행하시겠습니까?")) {
				                		opener.parent.selected(accumSeq, count);
					                	self.close();
				                	}				                	
				                }
							});
							
							function add_event(event) { 
								var userTitle = $("<h3>").html("[ " + event.data.param.rsit_UserTitle + " ]");
								var table = $("<table>").attr("border", "1");
								var indexTr = $("<tr>");
								var indexTd1 = $("<td>").html("활동구분");
								var indexTd2 = $("<td>").html("회사/기관/단체명");
								var indexTd3 = $("<td>").html("시작년월");
								var indexTd4 = $("<td>").html("종료년월");
								var indexTd5 = $("<td>").html("활동내용");
								
								indexTr.append(indexTd1).append(indexTd2).append(indexTd3).append(indexTd4).append(indexTd5);
								table.append(indexTr);
								
								var contentTr = $("<tr>");
								var contentTd1 = $("<td>").html(event.data.param.rsit_Type);
								var contentTd2 = $("<td>").html(event.data.param.rsit_Company);								
								var contentTd3 = $("<td>").html(event.data.param.rsit_Startdate);
								var contentTd4 = $("<td>").html(event.data.param.rsit_Enddate);
								var contentTd5 = $("<td>").html(event.data.param.rsit_Content);
								
								contentTr.append(contentTd1).append(contentTd2).append(contentTd3).append(contentTd4).append(contentTd5);
								table.append(contentTr);
								
								$("#LoadView").append(userTitle);
								$("#LoadView").append(table);
								
								/* $("#load").click(function() {
				                	$("#rsitSeq"+num, opener.document).val(event.data.param.rsit_Seq);
				                	$("#rsitType"+num, opener.document).val(event.data.param.rsit_Type);
				                	$("#rsitCompany"+num, opener.document).val(event.data.param.rsit_Company);				                
				   					$("#rsitStartdate"+num, opener.document).val(event.data.param.rsit_Startdate);
				                	$("#rsitEnddate"+num, opener.document).val(event.data.param.rsit_Enddate);
				                	$("#rsitContent"+num, opener.document).val(event.data.param.rsit_Content);
				                	$("#rsitUserTitle"+num, opener.document).val(event.data.param.rsit_UserTitle);
				                	self.close();
				                });	*/			                
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
		<p class="title">인턴이력 불러오기</p>
		내 인턴이력 보관함 총&nbsp;<span id="number">&nbsp;</span>건
		<div>
			<table border="1" name="LoadList" id="LoadList">				
			</table>			
		</div>
		<div style="background: #f5f7fb; padding: 10px; padding-top: 2px; height: 250px;" id="LoadView">
		</div>
		<input type="button" value="불러오기" id="load" class="load">
		<input type="button" value="취소" id="cancle" class="cancle">	
	</fieldset>
</body>
</html>