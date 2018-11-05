<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var headerOffset = $('.job_top_menu').offset();
	$(window).scroll(function() {
		if($(documnet).scrollTop() > headerOffset.top) {
			$('.job_top_menu').addClass('fixed');
		} else {
			$('jb_top_menu').removeClass('fixed');
		}
	});
});
</script>
</head>
<body>
<header>
	<div class="job_top_menu">
		<div class="user_info">
			<p class="company_user">
				<a href=""></a>
			</p>
		</div>
	</div>
	<div class="area_logo">
		<a></a>
		<a href="#">기업서비스</a>
	</div>
	<!-- 최상위 전체 공통네비게이션 -->
	<div class="head_inner">
		<nav class="gnb">
			<ul class="list_gnb_left">
				<li>공고등록</li>
				<li>공고/지원자관리</li>			
				<li>뭐하지메뉴</li>			
				<li>후에엥</li>			
			</ul>
			<ul class="list_gnb_right">
				<li>결제정보</li>
				<li>기타</li>
				<li>등등</li>
			</ul>
		</nav>
	</div>
	<div class="job_top_menu_shadow" style="border-bottom: 1px solid rgb(202, 202, 202);"></div>
</header>
<section>
	<nav>
	</nav>
	<br>m
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>m
</section>
<footer>
</footer>
</body>
</html>