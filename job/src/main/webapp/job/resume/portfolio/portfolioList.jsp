<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
</script>

</head>
<body>
<form id="portfolioList">
<div>
<h4>포트폴리오 및 기타문서</h4>
<ul class="area_pf">
	<li class="list_pf">
		<div class="box_pf">
			<div class="check">
				<label class="check_onoff">
					<input type="checkbox">
					<span id="aaa">파일구분 </span>
				</label>
			</div>
			<div class="info_pf">
				<span>제목 </span>
				<a href="#" class="link">filename</a>
			</div>		
		</div>
	</li>
</ul>
	<a href="#" onclick="window.open('portfolioWriteForm.jsp','portfolioWriteForm','width=500, height=350, left=300, top=200')">불러오기</a>
</div>
</form>
</body>
</html>