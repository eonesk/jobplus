<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자격증Load폼</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
	
		/* 자기소개서의 총 개수 구함 */
		$.ajax({
			type: 'POST',
			url: 'licenseLoadCount.do',
			dataType: 'text',
			cache: false,
			success: function(data) {
				$("#numberOfLicense").append(data);
				if(data == "0") {
					alert("자격증데이터 없음");
					$("<tr>").addClass("licenseLoadListLabelTr").appendTo("#licenseLoadListTable");
					$("<td>").addClass("licenseLoadListLabelTd").html("제목").appendTo("#licenseLoadListTable");
				} else {
					alert("자격증데이터 있음");
					/* Json 하는 거 어떻게 하지 ㅠㅠ */
					$.ajax({
						type: 'POST',
						url: 'licenseLoad.do',
						dataType: "json",
						cache: false,
						success: function(data) {
							alert(data.licenseUserTitleList);							
						},
						error : function(e) {
			                alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
			         	}
					});
					
					
					/** json으로 넘어 온 데이터를 $.each();를 통해 table에 구현해 줘야 함 : 위 ajax문 success에 들어가야 함 */
					// 임의로 rsprDTO값을 정해서 table에 구현..
	/* 					
					var rsprUserTitleList = [{ 
						    "rspr_Seq": 5,
						    "rspr_Title": "제목입니다1",
						    "rspr_Content": "내용입니다",
						    "m_Id": "num1",
						    "rspr_UserTitle": "usertitle입니다."
					},
					{
						    "rspr_Seq": 6,
						    "rspr_Title": "제목",
						    "rspr_Content": "내용",
						    "m_Id": "num1",
						    "rspr_UserTitle": "usertitle"
					}];
					
					// Table 첫번째 행
					$("<tr>").addClass("rsprLoadListLabelTr").appendTo("#rsprLoadListTable");
					$("<td>").addClass("rsprLoadListLabelTd").html("제목").appendTo("#rsprLoadListTable");
					
					// List Content
					
					$.each(rsprUserTitleList, function(index, item) {
						
						var listTr = $("<tr>");
						listTr.addClass("rsprLoadListContentTr");
						var listTd = $("<td>");
						listTd.addClass("rsprLoadListContentTd");
						var listA = $("<a>");
						listA.addClass("rsprLoadListContentA");
						listA.attr("href", "#");
						listA.html(rsprUserTitleList.rspr_UserTitle);
						
						listTd.append(listA);
						listTr.append(listTd);
						
						$("#rsprLoadListTable").append(listTr);
					});
					
					/* 
					
					// ex
					var listTr1 = $("<tr>");
					listTr.addClass("rsprLoadListContentTr");
					var listTd1 = $("<td>");
					listTd.addClass("rsprLoadListContentTd");
					var listA1 = $("<a>");
					listA1.addClass("rsprLoadListContentA");
					listA1.attr("href", "#");
					listA1.html(rsprUserTitleList1.rspr_UserTitle);
					
					listTd1.append(listA1);
					listTr1.append(listTd1);
					
					$("#rsprLoadListTable").append(listTr1);
					 */
					/** usertitle을 클릭했을 때  *//*
					$(".rsprLoadListContentA").click(function() {
						alert($(this).text());
					});
			 */		
					/* 
					
						$.each(data.memberlist, function(index, memberlist) { // 이치를 써서 모든 데이터들을 배열에 넣음					
	
						var items = [];
	
						items.push("<td>" + memberlist.id + "</td>"); // 여기에 id pw addr tel의 값을 배열에 넣은뒤
	
						items.push("<td>" + memberlist.pw + "</td>");
	
						items.push("<td>" + memberlist.addr + "</td>");
	
						items.push("<td>" + memberlist.tel + "</td>");
	
						$("<tr/>", {
	
							html : items // 티알에 붙임,
	
						}).appendTo("table"); // 그리고 그 tr을 테이블에 붙임
	
					});	 */				
				}
			},
			error : function(e) {
	            alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
	     	}
		});	
	});	
</script>
</head>
<body>
	<h3>자격증 불러오기</h3>
	<!-- float로 연결하든가.. 암튼 한 줄에 표현되어야 함 -->
	내 자격증 보관함 총&nbsp;<span id="numberOfLicense" style="color: orange;">&nbsp;</span>건
	<div style="width: 500px; height: 150px; overflow-y: scroll; overflow-x: hidden;">
		<table border="1" id="licenseLoadListTable" name="licenseLoadListTable">
		<!-- 자기소개서 List 들어갈 부분 -->
		</table>
	</div>
	<br>
	<div style="background: #f5f7fb; padding: 10px; padding-top: 2px; height: 250px;" id="licenseLoadView">
		<div style="text-align: center;" id="licenseLoadViewInit">
			<p style="font-size: 14px; margin: 80px;">
				위 목록에서 자기소개서를 선택하신 후,<br>
				<strong style="color: #566feb; font-weight: bold;">[자기소개서 불러오기]</strong> 버튼을 클릭하여 불러오기 하거나<br>
				또는 필요한 <strong style="color: #566feb; font-weight: bold;">부분</strong>을 복사하여<br>
				작성중인 <strong style="color: #566feb; font-weight: bold;">자기소개서에 붙여넣기</strong> 해주세요.</p>
		</div>	
	</div>
	<p style="font-size: 10px;">[자기소개서 불러오기]를 클릭하시면, 선택하신 자기소개서 내용과 양식(폼)이 불러오기 됩니다.</p>
	<div align="center">
		<span style="padding: 5px 10px 5px 10px; background-color: #566feb; color: white;"><a href="#" style="font-size: 12px; text-decoration: none; color: white;" id="licenseLoadSubmit">자격증 불러오기</a></span>
		<span style="width: 50px; padding:5px; border: 1px solid gray;"><a href="#" style="font-size: 12px; text-decoration: none;" id="licenseLoadCancel">취소</a></span>
	</div>
</body>
</html>