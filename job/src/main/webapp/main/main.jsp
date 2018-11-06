<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
#user_corp_popup {
    height: 250px;
    border: 1px solid #757575;
    position: absolute;
    left: 100px;
    top: 100px;
    background: #fff;
}
#user_corp_popup button{
  cursor:pointer;
}
.user_corp_name {
    padding-top: 33px;
}
.area_corp_logo {
    margin-top: 18px;
    margin-bottom: 13px;
}
.area_corp_logo .corp_thum {
    padding: 5px;
    width: 130px;
    max-width: 130px;
    height: 70px;
    max-height: 70px;
    border: 1px solid #e0e0e0;
    vertical-align: middle;
    margin-left: 75px;
    margin-bottom: 4px;
}
.area_corp_logo a.logo_modify {
    margin-top: 13px;
    border: 1px dotted red;
    font-size: 13px;
    line-height: 10px;
    height: 14px;
    margin-left: 120px;
}
#user_corp_popup .area_bottom {
    position: relative;
    padding: 13px 60px;
    height: 58px;
    box-sizing: border-box;
    letter-spacing: -1px;
    text-align: right;
    background: #f1f1f1;
}
.area_bottom a {
    padding: 5px 10px 7px 10px;
    height: 100%;
    border: 1px solid #b8b8b8;
    border-radius: 2px;
    box-sizing: border-box;
    vertical-align: top;
    color: #303030;
    background: #fff;
    line-height: 26px;
    font-size: 14px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#user_corp_popup").hide();
	$("#user_info > a").click(function() {
		$("#user_info > a").blur();
		$("#user_corp_popup").show();
		$("#user_corp_popup a").focus();
	    return false;
	});
	$(document).mouseup(function(e) {
		var container = $("#user_corp_popup");
		if(container.has(e.target).length =='0')
			container.hide();
	});	
});

</script>
</head>
<body>
	<div id=user_info>
		<a href="#user_corp_popup">팝업창 열기</a>
		
	  	<div id="user_corp_popup" class="user_corp_popup">
	  		<div class="user_corp_name" align="center">
	  			<a>기업이름</a>
	  		</div>
	  		<div class="user_corp_info">
	  			<div class="area_corp_logo">
	  				<div class="corp_thum"><img src="g"></div>
	  				<a class="logo_modify" href="#"><span>로고변경</span></a>
	  			</div>
	  		</div>
	  	<div class="area_bottom">
	  		<a>기업정보관리</a>
	  		<a>로그아웃</a>
	  	</div>
	  </div>
	</div>
</body>
</html>