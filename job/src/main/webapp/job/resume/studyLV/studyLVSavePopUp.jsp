<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studyLV저장팝업</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(function() {		
		// session값으로 넘어 올 id값 임의 지정
		var memId = "num1";

		var is_check = ${ param.is_check };
		var numbering = "${ param.numbering }";
		var rss_Type;
		var rss_Name;
		var rss_Startdate;
		var rss_Enddate;
		var rss_Ishighschool;
		var rss_Major;
		var rss_Score;
		var rss_Totscore;
		var rss_UserTitle;
		
		alert("[save] is_check : " + is_check);
		alert("[save] numbering : " + numbering);
		
		if(is_check) {
			alert("고등학교 미만 졸업");
			rss_Ishighschool = "Y";
		} else {
			alert("고등학교 이상 졸업");
			rss_Type = $("#rssTypeValue" + numbering, opener.document).val();
			rss_Name = $("#rssNameFirst" + numbering, opener.document).val();
			rss_Startdate = $("#rssStartDateValue" + numbering, opener.document).val();
			rss_Enddate = $("#rssEndDateValue" + numbering, opener.document).val();
			rss_Ishighschool = "N";
			rss_Major = $("#rssMajorFirst" + numbering, opener.document).val();
			rss_Score = $("#rssScoreFirst" + numbering, opener.document).val();
			rss_Totscore = $("#rssTotScoreValue" + numbering, opener.document).val();
			
			alert("[SavePopUp]" + rss_Type + " // " + rss_Name + " // " + rss_Startdate + " // " + rss_Enddate
					 + " // " + rss_Ishighschool + " // " + rss_Major + " // " + rss_Score + " // " + rss_Totscore);
		}
		
		$("#RSS_save_submit").click(function() {
			alert("서밋");
			rss_UserTitle = $("#rssUserTitle").val();
			if(rss_UserTitle == "") {
				alert("저장할 제목을 입력해주세요.");
				$("#rssUserTitle").focus()
			} else {
				alert("저장");
				$.ajax({
					type: 'POST',
					url: 'rssSave.do',
					dataType: 'text',
					data: {
						"rss_Type": rss_Type,
						"rss_Name": rss_Name,
						"rss_Startdate": rss_Startdate,
						"rss_Enddate": rss_Enddate,
						"rss_Ishighschool": rss_Ishighschool,
						"rss_Major": rss_Major,
						"rss_Score": rss_Score,
						"rss_Totscore": rss_Totscore,
						"rss_UserTitle": rss_UserTitle,
					},
					success: function(data) {
						if(data > 0) {
							alert("성공");
							$("#rss__Seq"+numbering, opener.document).val(data);
							window.close();
						} else {
							alert("실패");
						}
					}
				});
			}
		});
		
		$("#RSS_save_cancle").click(function() {
			window.close();
		});
	});
</script>
</head>
<body>
<div style="background: #f5f7fb; padding: 10px; padding-top: 2px;">
	<h3>학력 관리에 저장</h3>
	<p>저장하실 제목을 입력해주세요</p>
	<!-- <form action="rssSave.do" method="post" name="rssSaveForm"> -->
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" id="rssUserTitle" name="rssUserTitle"></td>
		</tr>
	</table>
	<input type="button" value="완료" id="RSS_save_submit">
	<input type="button" value="취소" id="RSS_save_cancle">
	<!-- </form> -->
</div>
</body>
</html>