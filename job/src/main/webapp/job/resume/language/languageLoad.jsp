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
	var num = ${param.num};
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
					success: function(data) {
						var trTitle = $("<tr>").addClass("LoadListTr");
						var tdTitle = $("<td>").addClass("LoadListTd").html("제목");
						
						trTitle.append(tdTitle);
						$("#LoadList").append(trTitle);
						
						$.each(data.items, function(index, item) {
							var dto = item;
							var tr = $("<tr>").addClass("LoadListTr");
							var td = $("<td>").addClass("LoadListTd");
							var a = $("<a>").attr({
								"id": "RSLG_UserTitle1",
								"href": "#"
							}).html(item.RSLG_UserTitle).bind('click', {param: dto}, add_event);								
							td.append(a);
							tr.append(td);
							$("#LoadList").append(tr);	
						});
						function add_event(event) { 			                
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
						}
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
			<table border="1" name="LoadList" id="LoadList" class="LoadList">				
			</table>			
		</div>
		<input type="button" value="불러오기" id="load" class="load">
		<input type="button" value="취소" id="cancle" class="cancle">	
	</fieldset>
</body>
</html>