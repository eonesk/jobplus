<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 관리</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url: "resumeListJson.do",
			type: "post",
			dateType: "json",
			success: function(data) {
				if(data.total == "0"){
					var tr = $("<tr>", {align: "center"});
					var td = $("<td>").attr("colspan", "2").css("height","30px").html("등록된 이력서가 없습니다. 새롭게 이력서를 추가해보세요!");
					tr.append(td);
					$("#resumeListT").append(tr);
				}else{
					$.each(data.items, function(index, item) {
						var tr = $("<tr>")
						var td1 = $("<td>").css({
							"border-right": "1px solid gray",
							"height": "30px"
						}).append(item.rs_Title).append(
							$("<input>", {
								click: function() {
									resumeDelteCk = confirm("["+ item.rs_Title +"] 이력서를 삭제하시겠습니까?");
									if(resumeDelteCk){
										var dataSeq = {
												"rs_Seq": item.rs_Seq
										};
										$.ajax({
											url:"resumeDelete.do",
											type: 'post',
											data: dataSeq,
											dataType: 'text',
											timeout: 30000,
											cache: false,
											success: function(data) {
												if(data > 0){
													alert("삭제되었습니다.");
													location.href='resumeAdminBody.jsp';
												}else{
													alert("네트워크 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
												}
											},
											errer: function() {
												alert("네트워크 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
											}
										});
									}
								}
							}).attr("type", "button").attr("value", "삭제").attr("class", "resumeEditBtn")).append(
								$("<input>",{
									click: function() {
										alert("미구현된 기능입니다.");
									}
								}).attr("type", "button").attr("value","수정").attr("class","resumeEditBtn"));
						var td2 = $("<td>").css("text-align", "center").html(item.rs_Logdate);
						
						tr.append(td1).append(td2);
						$("#resumeListT").append(tr);
					});
				}
			},
			error: function() {
				alert("서버접속에 오류가 생겼습니다. 잠시후 다시 시도해주세요.");
			}
		});
	});
</script>
<style type="text/css">
body {
	margin: 35px;
	width: 900px;
	height: 922px;
	vertical-align: center;
	outline: 0;
	border: 1px solid black;
}

.button{
	background-color: #5882FA;
	color: white;
	width: 100px;
	border: none;
	padding: 10px;
}
.button:hover{
	background-color: #2E9AFE;
}
.resumeEditBtn{
	background-color: #5882FA;
	color: white;
	width: 34px;
	border: none;
	padding: 2px;
	margin-left: 5px;
	float: right;
}
.resumeEditBtn:hover{
	background-color: #2E9AFE;
}
#rs_editBtn{
	background-color: #5882FA;
	color: white;
	width: 30px;
	border: none;
	padding: 10px;
}
#rs_editBtn:hover{
	background-color: #2E9AFE;
}
.status{
	color: #444;
	padding-bottom: 30px;
}
.status .statusTitle{
	font-size: 36px;
	font-weight: bold;
}

.status ul li{
	color: #222;
}

.list{
	position: relative;
	color: #444;
}

.list .header .resumeWrite{
	position: absolute;
	right: 0px;
	top: 18px;
} 
.list .content{
	position: relative;
	top: 60px;
}
.list .content .edit{
	position: absolute;
	right: 0px;
}
.resumeList{
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	border-collapse: collapse;
	margin: 20px auto 20px auto;
}
.resumeList th{
	background-color: #F2F2F2;
}
.resumeList .resumeTitleTh{
	width: 600px;
	border-right: 1px solid gray;
}
.resumeList .resumeEditTh{
	width: 200px;
}

</style>
</head>
<body>
	<div class="status">
		<p class="statusTitle">이력서 현황</p>
		<ul>
			<li>이력서는 <strong>최대 5개</strong>까지 작성하여 등록가능합니다.
			</li>
			<li>지원하고자 하는 회사마다 이력서 내용을 다르게 하여 지원 가능합니다.<br> (입사지원을 한 후
				이력서의 내용을 수정해도 이전에 지원한 이력서의 내용은 변경되지 않습니다.)
			</li>
			<li>인재정보는 <strong>1개의 이력서만 공개 가능</strong>합니다.
			</li>
			<li>컨설팅은 사람인 회원이라면 누구나 연 1회, 인재정보 공개 시 신청 가능합니다.</li>
		</ul>
	</div>
	<div class="listHeader">
		<div class="header">
			<font style="font-size: 24px; font-weight: bold; margin-left: 50px;">이력서 리스트</font>
			<input class="button resumeWrite" type="button" value="이력서 등록" style="margin-left: 544px;" onclick="location.href='resumeWriteForm.do'">
		</div>
		<div class="content">
			<table id="resumeList" class="resumeList">
				<tr>
					<th class="resumeTitleTh">이력서 제목</th>
					<th class="resumeEditTh">이력서 수정 날짜</th>
				</tr>
				<tbody id="resumeListT">
				
				</tbody>
			</table>
		</div>
	</div>
	<div class="listContent">
		
	</div>
</body>
</html>