<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
a {color:#000;text-decoration:none}
.blind, .hidden, caption, legend {visibility:hidden;overflow:hidden;position:absolute;margin-left:-1px;width:1px;height:1px}
select, option, input, button, textarea {font-family:"Malgun Gothic",gulim, dotum,sans-serif  !important}/* : cdn에 있는 css가 이 부분을 지우길래 !important 처리합니다. */
button, label {border:0;background-color:transparent;cursor:pointer !important}/* : cdn에 있는 css가 이 부분을 지우길래 !important 처리합니다. */
button,input {*overflow:visible !important}/* : cdn에 있는 css가 이 부분을 지우길래 !important 처리합니다. */
button {display:inline-block;*display:inline;overflow:visible;*zoom:1}
p {margin:0}
input:-ms-input-placeholder {color:#a9a9a9}
textarea:-ms-input-placeholder {color:#a9a9a9}
body {min-width:1260px}
#service {overflow:visible !important}
#container {position:relative;padding-top:86px;text-align:center;background-color: #e8e8e8;}
#header {position:fixed;top:0;left:0;z-index:100;width:100%;height:85px;text-align:left;background-color:#fff}
#header.header_position {position:absolute}
.box_withshadow {position:absolute;top:0;left:0;z-index:10;width:100%;height:100%;border-bottom:1px solid #cacaca;box-shadow:0 1px 3px rgba(0,0,0,.1)}
.header_dimmed {display:none;position:fixed;left:0;top:0;z-index:95;width:100%;height:100%;background:url(//www.saraminimage.co.kr/ui/layout/mypage_2016/bg_dimmed_20per.png) 0 0 repeat}
#header a,#header button {font-family:"Malgun Gothic",gulim,dotum,sans-serif}
#header .inner {position:relative;z-index:20;margin:0 auto;padding:0 0 0 0;width:100%;height:inherit;background-color:#fff}
#header .area_logo {position:absolute;top:0;left:50%;z-index:20;margin-left:-630px;max-width:226px;height:inherit}
#header .area_logo .title_logo {margin:46px 0 0 0;font-size:100%;font-weight:normal}
#header .area_logo .title_logo a.logo_cm_service {margin-left:5px}

#header .user_info {margin:0 auto 7px auto;padding:19px 0 2px 0;width:1260px;height:15px;font-size:12px;text-align:right;letter-spacing:-1px}
#header .user_info .no_user span {display:inline-block;padding-left:5px;width:9px;height:15px;font-size:0;text-indent:-9999px;vertical-align:top;background:url(//www.saraminimage.co.kr/ui/layout/mypage_2016/sp_icon_gnb_50x50.png) no-repeat 5px -144px}
#header .user_info .no_user a:hover {color:#000}
#header .user_info .company_user span {display:inline-block;padding-left:5px;width:9px;height:15px;font-size:0;text-indent:-9999px;vertical-align:top;background:url(//www.saraminimage.co.kr/ui/layout/mypage_2016//sp_icon_gnb_50x50.png) no-repeat 5px -144px}
#header .user_info .company_user a:hover {color:#000}
#header .user_info .company_user a .text_apo {display:inline-block;overflow:hidden;padding-bottom:3px;width:200px;text-decoration:none;text-align:right;vertical-align:top;white-space:nowrap;text-overflow:ellipsis}
#header .user_info .company_user.opened span {background-position-x:-25px}
#header .user_info .personal_user a {margin-left:14px;text-decoration:underline}
#header .user_info .personal_user a:hover {color:#000}
#header .user_info .personal_user a:first-child {text-decoration:none}
#header .user_info .personal_user a .text_apo {display:inline-block;overflow:hidden;padding-bottom:3px;width:130px;text-align:right;vertical-align:top;white-space:nowrap;text-overflow:ellipsis}
#header .user_info .personal_user a.btn_logout {display:inline-block;padding-right:18px;vertical-align:top;background:url(//www.saraminimage.co.kr/ui/layout/mypage_2016/sp_icon_gnb_50x50.png) no-repeat right -247px}
#header .user_info .personal_user a.btn_logout:hover {background-position-y:-263px}
#header .user_info .personal_user a img {margin-right:5px;vertical-align:middle}

#header .gnb {display:block;margin:0 auto;width:1260px}
#header .gnb:after {display:table;table-layout:fixed;clear:both;content:""}
#header .gnb .list_gnb {float:left;padding-left:225px}
#header .gnb .list_gnb:after {display:table;table-layout:fixed;clear:both;content:""}
#header .gnb .list_gnb li {float:left;padding-left:6px}
#header .gnb .list_gnb li:first-child {padding-left:0}
#header .gnb .list_gnb li > a {display:block;overflow:hidden;position:relative;margin:0 10px -1px 0;padding:10px 5px 0 5px;height:42px;box-sizing:border-box;color:#0d0d0d;font-size:15px;letter-spacing:-2px;word-spacing:-1px;line-height:1;background:url(//www.saraminimage.co.kr/ui/layout/mypage_2016/sp_icon_cml.png) 0 100px no-repeat}
#header .gnb .list_gnb li > a:before {position:absolute;bottom:0;bottom:-4px\9;left:0;width:100%;height:4px;background-color:#5582db;transform:translate3d(0, 4px, 0);transition:transform .3s ease-out;content:""}
#header .gnb .list_gnb li > a em {font-family:Arial;letter-spacing:-1px}
_:-ms-lang(x), #header .gnb .list_gnb li > a:before {bottom:0}
#header .gnb .list_gnb li > a:hover {color:#5582db;text-decoration:none;font-weight:bold}
#header .gnb .list_gnb li > a:hover:before,
#header .gnb .list_gnb li.on a:before {bottom:0\9;transform:translate3d(0, 0, 0)}
#header .gnb .list_gnb li.opened > a:hover:before,
#header .gnb .list_gnb li.opened > a:focus:before {transform:translate3d(0, 4px, 0)}
#header .gnb .list_gnb li.on > a {color:#5582db;font-weight:bold}
#header .gnb .list_gnb li a.list_gnb_ico {background:url(//www.saraminimage.co.kr/ui/layout/mypage_2016/sp_icon_gnb_50x50.png) no-repeat}
#header .gnb .list_gnb li a.list_gnb_ico.ico_1x1 {padding-left:23px;font-weight:bold;background-position:5px 11px}
#header .gnb .list_gnb li a.list_gnb_ico.ico_1x2 {padding-left:21px;font-weight:bold;background-position:5px -39px}
#header .gnb .list_gnb li a.list_gnb_ico.ico_1x3 {margin-right:9px;padding-right:19px;background-position:64px -88px}
#header .gnb .list_gnb li a span.list_gnb_ico.ico_1x3_depth2 {display:inline-block;padding-left:5px;width:13px;height:15px;font-size:0;text-indent:-9999px;vertical-align:top;background:url(//www.saraminimage.co.kr/ui/layout/mypage_2016/sp_icon_gnb_50x50.png) no-repeat 5px -97px}
#header .gnb .list_gnb li .list_gnb_depth2 {display:none;position:absolute;left:0;top:86px;padding-top:25px;width:100%;background:#f7f7f7}
#header .gnb .list_gnb li .list_gnb_depth2 .depth2_inner {position:relative;margin:0 auto;padding-bottom:33px;width:1260px}
#header .gnb .list_gnb li .list_gnb_depth2 .depth2_inner .depth2_btn {margin:0}
#header .gnb .list_gnb li .list_gnb_depth2 .depth2_inner .depth2_btn a {display:inline-block;margin-bottom:12px;padding:6px 25px 8px 16px;border-radius:2px;color:#fff;letter-spacing:-1px;background:#5582db url(//www.saraminimage.co.kr/ui/layout/mypage_2016/sp_icon_gnb_50x50.png) no-repeat 96px -290px}
#header .gnb .list_gnb li .list_gnb_depth2 .depth2_inner ul {margin:0;padding:0}
#header .gnb .list_gnb li .list_gnb_depth2 .depth2_inner ul li {display:inline-block;float:none;margin:0;padding:2px 0 0 0;width:100%}
#header .gnb .list_gnb li .list_gnb_depth2 .depth2_inner ul li > a {margin:0;padding:0;height:16px;color:#666;font-size:13px;font-weight:normal;letter-spacing:-1px}
#header .gnb .list_gnb li .list_gnb_depth2 .depth2_inner ul li > a:before {background:inherit}
#header .gnb .list_gnb li .list_gnb_depth2 .depth2_inner ul li > a:hover {text-decoration:underline}
#header .gnb .list_gnb li .list_gnb_depth2 .depth2_inner ul li.bottom_line {margin-bottom:5px;padding-bottom:5px;border-bottom:1px solid #e5e5e5}
#header .gnb .list_gnb li .list_gnb_depth2 .depth2_inner ul li ul {margin-top:4px}
#header .gnb .list_gnb li .list_gnb_depth2 .depth2_inner ul li ul li {padding:0}
#header .gnb .list_gnb li.gnb_recruit_manage .list_gnb_depth2 .depth2_inner ul {width:120px}
#header .gnb .list_gnb li.gnb_talent_manage .list_gnb_depth2 .depth2_inner ul {width:135px}
#header .gnb .list_gnb li.gnb_exam_list .list_gnb_depth2 .depth2_inner ul {width:135px}
#header .gnb .list_gnb li.gnb_interview_manage .list_gnb_depth2 .depth2_inner ul {width:135px}
#header .gnb .list_gnb li.gnb_payment_history .list_gnb_depth2 .depth2_inner ul {width:135px}
#header .gnb .list_gnb li.gnb_service_guide .list_gnb_depth2 .depth2_inner ul {width:125px}
#header .gnb .list_gnb li.gnb_recruit_manage .list_gnb_depth2 .depth2_inner {padding-left:323px;width:937px;background:url(//www.saraminimage.co.kr/ui/layout/mypage_2016/pos_2th_img_201809.png) no-repeat right top}
#header .gnb .list_gnb li.gnb_recruit_manage .list_gnb_depth2 .depth2_inner .txt_desc {position:absolute;right:222px;bottom:35px}
#header .gnb .list_gnb li.gnb_talent_manage .list_gnb_depth2 .depth2_inner {padding-left:538px;width:722px;background:url(//www.saraminimage.co.kr/ui/layout/mypage_2016/pos_4th_img_201809.png) no-repeat right top}
#header .gnb .list_gnb li.gnb_talent_manage .list_gnb_depth2 .depth2_inner .txt_desc {position:absolute;right:163px;bottom:35px}
#header .gnb .list_gnb li.gnb_exam_list .list_gnb_depth2 .depth2_inner {padding-left:616px;width:644px;background:url(//www.saraminimage.co.kr/ui/layout/mypage_2016/pos_5th_img_201809.png) no-repeat right top}
#header .gnb .list_gnb li.gnb_exam_list .list_gnb_depth2 .depth2_inner .txt_desc {position:absolute;left:953px;bottom:35px}
#header .gnb .list_gnb li.gnb_interview_manage .list_gnb_depth2 .depth2_inner {padding-left:707px;width:553px;background:url(//www.saraminimage.co.kr/ui/layout/mypage_2016/pos_6th_img_201809.png) no-repeat right top}
#header .gnb .list_gnb li.gnb_interview_manage .list_gnb_depth2 .depth2_inner .txt_desc {position:absolute;right:154px;bottom:35px}
#header .gnb .list_gnb li.gnb_payment_history .list_gnb_depth2 .depth2_inner {padding-left:1109px;width:151px;text-align:left;background:url(//www.saraminimage.co.kr/ui/layout/mypage_2016/pos_9th_img_201809.png) no-repeat 696px top}
#header .gnb .list_gnb li.gnb_payment_history .list_gnb_depth2 .depth2_inner .txt_desc {position:absolute;left:870px;bottom:35px}
#header .gnb .list_gnb li.gnb_service_guide .list_gnb_depth2 .depth2_inner {overflow:hidden;padding-left:910px;width:350px;text-align:left;background:url(//www.saraminimage.co.kr/sri/company/layout/gnb_bg_hrmagazine.png) no-repeat left top}
#header .gnb .list_gnb li.gnb_service_guide .list_gnb_depth2 .depth2_inner ul {float:left;margin-left:30px}
#header .gnb .list_gnb li.gnb_service_guide .list_gnb_depth2 .depth2_inner .txt_desc {position:absolute;left:0;bottom:0;font-size:0;text-indent:-9999px}
#header .gnb .list_gnb.pos_right {float:right;padding-left:0}
#header .gnb .list_gnb.pos_right li {padding:0 2px 0 12px;background:url(//www.saraminimage.co.kr/ui/layout/mypage_2016/sp_icon_gnb_50x50.png) no-repeat 0 -188px}
#header .gnb .list_gnb.pos_right li:first-child {background:none}
#header .gnb .list_gnb.pos_right li > a {padding:10px 0 0 0;padding-right:1px\9;text-align:right}
#header .gnb .list_gnb.pos_right li:last-child > a {margin-right:0;padding-right:1px}
#header .gnb .list_gnb.pos_right li ul li {background:none}
#header .gnb .list_gnb.pos_right li ul li >  a {text-align:left}
#header .gnb .list_gnb li.gnb_recruit_add {position:relative}
#header .gnb .list_gnb li.gnb_recruit_manage {}
#header .gnb .list_gnb li.gnb_talent_search {}
#header .gnb .list_gnb li.gnb_talent_manage {}
#header .gnb .list_gnb li.gnb_exam_list {}
#header .gnb .list_gnb li.gnb_interview_manage {}
#header .gnb .list_gnb li.gnb_hr_magazine {}
#header .gnb .list_gnb li.gnb_payment_history {}
#header .gnb .list_gnb li.gnb_service_guide {padding-right:0}
#header .gnb .list_gnb li.ico_talent{position:relative}
#header .gnb .list_gnb li.ico_talent:after {display:block;position:absolute;top:-21px;left:5px;width:83px;height:28px;background:url(//www.saraminimage.co.kr/ui/layout/mypage_2016/ico_gnb_talent.png) no-repeat center center;content:""}
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
<div id="container">
<header id="header" class="">
        <div class="inner">
    <div class="user_info">
                    <p class="company_user act_stop">
                <a href="#layer_corp_info" id="btn_corp_name" onmousedown="try{n_trackEvent('gnbmenu', 'button' , 'company-manage', '');}catch(e){};">
                    <em class="text_apo">삼겹파티</em><span>바로가기</span>
                </a>
            </p>
            </div>
    <div class="area_logo">
        <div class="title_logo">
            <a href="/" class="logo_saramin" title="saramin" onmousedown="try{n_trackEvent('gnbmenu', 'button' , 'saraminlogo', '');}catch(e){};"><img src="//www.saraminimage.co.kr/ui/layout/mypage_2016/logo_cm_saramin_201808.png" alt="Saramin"></a>
            <a href="/zf_user/memcom/index/main" class="logo_cm_service" title="기업서비스" onmousedown="try{n_trackEvent('gnbmenu', 'button' , 'companyservice', '');}catch(e){};"><img src="//www.saraminimage.co.kr/ui/layout/mypage_2016/logo_cm_service_170213.png" alt="기업서비스"></a>
        </div>
        <div class="all_menu">
            <button type="button" id="layer_all_menu_toggle_btn" class="btn_menu">메뉴 전체보기</button>
        </div>
        <div id="layer_all_menu" class="layer_all_menu" style="display: none;">
            <div class="layer_all_menu_inner">
                <div class="all_menu_box">
                    <div class="title_allmenu">공고·지원자관리</div>
                    <div class="btn_allmenu"><a href="/zf_user/memcom/recruit/add" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'recruit-manage', 'add');}catch(e){};">공고 등록하기</a></div>
                    <ul>
                        <li class="bottom_line"><a href="/zf_user/company/recruit-manage/mode/entire" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'recruit-manage', 'entire');}catch(e){};">전체공고</a>
                            <ul>
                                <li><a href="/zf_user/company/recruit-manage" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'recruit-manage', 'ing');}catch(e){};">- 진행중 공고</a></li>
                                <li><a href="/zf_user/company/recruit-manage/mode/standby" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'recruit-manage', 'standby');}catch(e){};">- 대기중 공고</a></li>
                                <li><a href="/zf_user/company/recruit-manage/mode/end" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'recruit-manage', 'end');}catch(e){};">- 마감된 공고</a></li>
                                <li><a href="/zf_user/company/recruit-manage/mode/incomplete" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'recruit-manage', 'incomplete');}catch(e){};">- 미완성 공고</a></li>
                            </ul>
                        </li>
                        <li><a href="/zf_user/memcom/recruit-service-manage" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'service-manage', 'recruit-service-manage');}catch(e){};">공고 유료적용 관리</a></li>
                        <li><a href="/zf_user/memcom/service-manage/saving-package-history" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'service-manage', 'saving-package-history');}catch(e){};">실속팩 상품 관리</a></li>
                        <li><a href="/zf_user/memcom/service-manage/package-use-history" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'service-manage', 'package-use-history');}catch(e){};">충전팩 사용 내역</a></li>
                        <li><a href="/zf_user/memcom/service-manage/keyword-service-history" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'service-manage', 'keyword-service-history');}catch(e){};">검색키워드 상품 관리</a></li>
                        <li><a href="/zf_user/memcom/talent-manage/send-sms-email-history?top_menu_cd=recruit-manage" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'service-manage', 'send-sms-email-history');}catch(e){};">문자·이메일 발송 내역</a></li>
                    </ul>
                </div>
                <div class="all_menu_box">
                    <div class="title_allmenu">인재관리</div>
                    <div class="btn_allmenu"><a href="/zf_user/talent/search" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'talent-manage', 'talent-search');}catch(e){};">인재 검색하기</a></div>
                    <ul>
                        <li><a href="/zf_user/memcom/talent-manage/scrap-talent" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'talent-manage', 'scrap-talent');}catch(e){};">관심 인재</a></li>
                        <li><a href="/zf_user/memcom/talent-manage/today-talent" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'talent-manage', 'today-talent');}catch(e){};">오늘 본 인재</a></li>
                        <li><a href="/zf_user/memcom/talent-manage/serv-talent" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'talent-manage', 'serv-talent');}catch(e){};">연락처확인 인재</a></li>
                        <li><a href="/zf_user/applicant/manage/recruit-recommend-redirect" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'talent-manage', 'pandora');}catch(e){};">공고 기반 추천 인재</a></li>
                                                <li><a href="/zf_user/memcom/service-manage/talent-service-history" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'talent-manage', 'talent-service-history');}catch(e){};">인재정보 상품 사용 내역</a></li>
                        <li><a href="/zf_user/memcom/talent-manage/send-sms-email-history" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'talent-manage', 'send-sms-email-history');}catch(e){};">문자·이메일 발송 내역</a></li>
                    </ul>
                </div>
                <div class="all_menu_box">
                    <div class="title_allmenu">인적성검사</div>
                    <div class="btn_allmenu"><a href="/zf_user/memcom/siat?add_exam_immediately=y" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'siat-manage', 'add-exam');}catch(e){};">검사 신청하기</a></div>
                    <ul>
                        <li><a href="/zf_user/memcom/siat/exam-list" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'siat-manage', 'exam-list');}catch(e){};">인적성검사 신청/관리</a></li>
                        <li><a href="/zf_user/memcom/service-manage/siat-use-history" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'siat-manage', 'siat-use-history');}catch(e){};">인적성검사 사용내역</a></li>
                        <li><a href="/zf_user/memcom/service-guide/siat" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'goods', 'siat-description');}catch(e){};">인적성검사 상품안내</a></li>
                        <li><a href="/zf_user/memcom/service-guide/siat?type=needs#needs" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'goods', 'siat-description-needs');}catch(e){};">인적성검사 필요성</a></li>
                        <li><a href="/zf_user/memcom/service-guide/siat?type=kind#kind" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'goods', 'siat-description-kind');}catch(e){};">인적성검사 종류와 구성</a></li>
                        <li><a href="/zf_user/memcom/service-guide/siat?type=utilize#utilize" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'goods', 'siat-description-utilize');}catch(e){};">인적성검사 활용법</a></li>
                        <li><a href="/zf_user/memcom/service-guide/siat?type=process#process" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'goods', 'siat-description-process');}catch(e){};">인적성검사 이용절차</a></li>
                    </ul>
                </div>
                <div class="all_menu_box">
                    <div class="title_allmenu">면접관리</div>
                    <div class="btn_allmenu"><a href="/zf_user/memcom/interview/write" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'interview-manage', 'add');}catch(e){};">면접 등록하기</a></div>
                    <ul>
                        <li><a href="/zf_user/memcom/interview/main" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'interview-manage', 'calendar');}catch(e){};">면접 캘린더</a></li>
                        <li><a href="/zf_user/memcom/interview/interview-list" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'interview-manage', 'interviewee');}catch(e){};">면접 대상자</a></li>
                        <li><a href="/zf_user/memcom/interview/interview-setting" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'interview-manage', 'setting');}catch(e){};">면접 관리설정</a></li>
                    </ul>
                </div>
                <div class="all_menu_box">
                    <div class="title_allmenu">채용 상품 안내</div>
                    <ul>
                        <li><a href="/zf_user/service/company/order?part_id=package">실속! S-Pack</a></li>
                        <li><a href="/zf_user/service/company/order?part_id=recruit_ads">채용광고</a></li>
                        <li><a href="/zf_user/service/company/order?part_id=talent_search">인재열람</a></li>
                        <li><a href="/zf_user/service/company/order?part_id=mcom_humanism_test">SIAT인적성검사</a></li>
                        <li><a href="/zf_user/service/company/order?part_id=recruit_banner_ads">로고/배너광고</a></li>
                    </ul>
                </div>
                <div class="all_menu_box">
                    <div class="title_allmenu">결제내역</div>
                    <ul>
                        <li><a href="/zf_user/memcom/service-manage/payment-history" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'service-manage', 'payment-history');}catch(e){};">결제내역 조회</a></li>
                        <li><a href="/zf_user/memcom/service-manage/tax-history" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'service-manage', 'tax-history');}catch(e){};">전자세금계산서 조회</a></li>
                        <li><a href="/zf_user/memcom/service-manage/coupon-history" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'service-manage', 'coupon-history');}catch(e){};">쿠폰 사용 내역</a></li>
                        <li><a href="/zf_user/memcom/service-manage/point-history" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'service-manage', 'point-history');}catch(e){};">S-포인트 사용 내역</a></li>
                        <li><a href="/zf_user/memcom/sms/sms-service-history-detail" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'service-manage', 'sms-service-history');}catch(e){};">문자(SMS)사용 내역</a></li>
                        <li><a href="/zf_user/payment/manage/oneclick" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'service-manage', 'oneclick');}catch(e){};">원클릭 결제 관리</a></li>
                        <li><a href="/zf_user/memcom/service-guide/point-coupon" onmousedown="try{n_trackEvent('entiremenu', 'layer' , 'service-guide', 's-point');}catch(e){};">S-포인트 안내</a></li>
                    </ul>
                </div>
                <div class="all_menu_box">
                    <div class="title_allmenu">HR매거진</div>
                    <ul>
                        <li><a href="/zf_user/hr-magazine/list" onmousedown="try{n_trackEvent('gnbmenu', 'layer', 'HR-magazine', 'list');}catch(e){};">HR매거진</a></li>
                        <li><a href="/zf_user/hr-magazine/series-list" onmousedown="try{n_trackEvent('gnbmenu', 'layer', 'HR-magazine', 'series-list');}catch(e){};">HR시리즈</a></li>
                        <li><a href="/zf_user/hr-magazine/news-list?category=news&amp;subject_type=manage" onmousedown="try{n_trackEvent('entiremenu', 'layer', 'HR-magazine', 'news');}catch(e){};">뉴스</a></li>
                        <li><a href="/zf_user/hr-magazine/video-list" onmousedown="try{n_trackEvent('gnbmenu', 'layer', 'HR-magazine', 'video');}catch(e){};">HR동영상</a></li>
                        <li><a href="/zf_user/hr-magazine/plus-list?category=card" onmousedown="try{n_trackEvent('gnbmenu', 'layer', 'HR-magazine', 'card');}catch(e){};">카드뉴스</a></li>
                        <li class="bottom_line"><a href="/zf_user/hr-magazine/plus-list?category=tip" onmousedown="try{n_trackEvent('gnbmenu', 'layer', 'HR-magazine', 'tip');}catch(e){};">사람인 이용 꿀팁</a></li>
                        <li><a href="#" onclick="window.open('/company/service_guide/recruit_process.php', 'recruitProcessSideBar' ,'width=826px, height=512px, resizable=no, scrollbars=no, status=no;');" onmousedown="try{n_trackEvent('gnbmenu', 'layer', 'HR-magazine', 'recruit_process');}catch(e){};">채용 가이드<span class="list_gnb_ico ico_1x3_depth2">새창</span></a></li>
                        <li><a href="/zf_user/hr-magazine/solution" onmousedown="try{n_trackEvent('gnbmenu', 'layer', 'HR-magazine', 'solution');}catch(e){};">채용솔루션 [등용문 3.0]</a></li>
                        <li><a href="/zf_user/hr-magazine/outsourcing" onmousedown="try{n_trackEvent('gnbmenu', 'layer', 'HR-magazine', 'outsourcing');}catch(e){};">채용솔루션 [등용문 공채대행]</a></li>
                        <li><a href="http://www.saraminhs.co.kr/" target="_blank" onmousedown="try{n_trackEvent('gnbmenu', 'layer', 'HR-magazine', 'saraminhs');}catch(e){};">인재파견 [사람인HS]<span class="list_gnb_ico ico_1x3_depth2">새창</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <nav id="gnb" class="gnb">
        <div class="wrap_event_nudge">
        </div>
        <ul class="list_gnb">
            <li class="_gnb_item gnb_recruit_add"><a href="/zf_user/memcom/recruit/add" onmousedown="try{n_trackEvent('gnbmenu', 'button' , 'recruit-add', '');}catch(e){};" class="list_gnb_ico ico_1x1">공고등록</a></li>
            <li class="has_depth _gnb_item gnb_recruit_manage"><a href="/zf_user/company/recruit-manage?gnb_main=y" onmousedown="try{n_trackEvent('gnbmenu', 'button' , 'recruit-manage', '');}catch(e){};">공고<em>·</em>지원자관리</a>
                <div class="list_gnb_depth2" style="display: none;">
                    <div class="depth2_inner pos_2th">
                        <div class="depth2_btn"><a href="/zf_user/memcom/recruit/add" class="_skip" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'recruit-manage', 'add');}catch(e){};">공고 등록하기</a></div>
                        <ul>
                            <li class="bottom_line"><a href="/zf_user/company/recruit-manage/mode/entire" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'recruit-manage', 'entire');}catch(e){};">전체공고</a>
                                <ul>
                                    <li><a href="/zf_user/company/recruit-manage" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'recruit-manage', 'ing');}catch(e){};">- 진행중 공고</a></li>
                                    <li><a href="/zf_user/company/recruit-manage/mode/standby" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'recruit-manage', 'standby');}catch(e){};">- 대기중 공고</a></li>
                                    <li><a href="/zf_user/company/recruit-manage/mode/end" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'recruit-manage', 'end');}catch(e){};">- 마감된 공고</a></li>
                                    <li><a href="/zf_user/company/recruit-manage/mode/incomplete" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'recruit-manage', 'incomplete');}catch(e){};">- 미완성 공고</a></li>
                                </ul>
                            </li>
                            <li><a href="/zf_user/memcom/recruit-service-manage" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'recruit-service-manage');}catch(e){};">공고 유료적용 관리</a></li>
                            <li><a href="/zf_user/memcom/service-manage/saving-package-history" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'saving-package-history');}catch(e){};">실속팩 상품 관리</a></li>
                            <li><a href="/zf_user/memcom/service-manage/package-use-history" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'package-use-history');}catch(e){};">충전팩 사용 내역</a></li>
                            <li><a href="/zf_user/memcom/service-manage/keyword-service-history" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'keyword-service-history');}catch(e){};">검색키워드 상품 관리</a></li>
                            <li><a href="/zf_user/memcom/talent-manage/send-sms-email-history?top_menu_cd=recruit-manage" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'send-sms-email-history');}catch(e){};">문자·이메일 발송 내역</a></li>
                        </ul>
                        <p class="txt_desc"><img src="//www.saraminimage.co.kr/ui/layout/mypage_2016/pos_2th_txt.png" alt="공고 등록&amp;관리, 쉽고 빠르게 진행하세요! 사람인에서는 어렵지도 복잡하지도 않아요!"></p>
                </div>
                </div>
            </li>
            <li class="ico_talent _gnb_item gnb_talent_search"><a href="/zf_user/talent/search" class="list_gnb_ico ico_1x2" onmousedown="try{n_trackEvent('gnbmenu', 'button' , 'talent-search', '');}catch(e){};">인재검색</a></li>
            <li class="has_depth _gnb_item gnb_talent_manage"><a href="/zf_user/memcom/talent-manage/scrap-talent" onmousedown="try{n_trackEvent('gnbmenu', 'button' , 'talent-manage', '');}catch(e){};">인재관리</a>
                <div class="list_gnb_depth2" style="display: none;">
                    <div class="depth2_inner">
                        <div class="depth2_btn"><a href="/zf_user/talent/search" class="_skip" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'talent-manage', 'talent-search');}catch(e){};">인재 검색하기</a></div>
                        <ul>
                            <li><a href="/zf_user/memcom/talent-manage/scrap-talent" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'talent-manage', 'scrap-talent');}catch(e){};">관심 인재</a></li>
                            <li><a href="/zf_user/memcom/talent-manage/today-talent" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'talent-manage', 'today-talent');}catch(e){};">오늘 본 인재</a></li>
                            <li><a href="/zf_user/memcom/talent-manage/serv-talent" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'talent-manage', 'serv-talent');}catch(e){};">연락처확인 인재</a></li>
                            <li><a href="/zf_user/applicant/manage/recruit-recommend-redirect" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'talent-manage', 'pandora');}catch(e){};">공고 기반 추천 인재</a></li>
                                                        <li><a href="/zf_user/memcom/service-manage/talent-service-history" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'talent-manage', 'talent-service-history');}catch(e){};">인재정보 상품 사용 내역</a></li>
                            <li><a href="/zf_user/memcom/talent-manage/send-sms-email-history" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'talent-manage', 'send-sms-email-history');}catch(e){};">문자·이메일 발송 내역</a></li>
                        </ul>
                        <p class="txt_desc"><img src="//www.saraminimage.co.kr/ui/layout/mypage_2016/pos_4th_txt.png" alt="꼭 필요하고 적합한 인재를 찾을 수 있도록! 인재검색이 쉽고 간편하게 재탄생했습니다!"></p>
                    </div>
                </div>
            </li>
            <li id="gnb_top_menu_siat" class="has_depth _gnb_item gnb_exam_list"><a href="/zf_user/memcom/siat/exam-list" onmousedown="try{n_trackEvent('gnbmenu', 'button' , 'siat', '');}catch(e){};">인적성검사</a>
                <div class="list_gnb_depth2" style="display: none;">
                    <div class="depth2_inner">
                        <div class="depth2_btn"><a href="/zf_user/memcom/siat?add_exam_immediately=y" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'siat-manage', 'add-exam');}catch(e){};">검사 신청하기</a></div>
                        <ul>
                            <li><a href="/zf_user/memcom/siat/exam-list" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'siat-manage', 'exam-list');}catch(e){};">인적성검사 신청/관리</a></li>
                            <li><a href="/zf_user/memcom/service-manage/siat-use-history" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'siat-manage', 'siat-use-history');}catch(e){};">인적성검사 사용내역</a></li>
                            <li><a href="/zf_user/memcom/service-guide/siat" class="_skip" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'goods', 'siat-description');}catch(e){};">인적성검사 상품안내</a></li>
                            <li><a href="/zf_user/memcom/service-guide/siat?type=needs#needs" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'goods', 'siat-description-needs');}catch(e){};">인적성검사 필요성</a></li>
                            <li><a href="/zf_user/memcom/service-guide/siat?type=kind#kind" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'goods', 'siat-description-kind');}catch(e){};">인적성검사 종류와 구성</a></li>
                            <li><a href="/zf_user/memcom/service-guide/siat?type=utilize#utilize" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'goods', 'siat-description-utilize');}catch(e){};">인적성검사 활용법</a></li>
                            <li><a href="/zf_user/memcom/service-guide/siat?type=process#process" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'goods', 'siat-description-process');}catch(e){};">인적성검사 이용절차</a></li>
                        </ul>
                        <p class="txt_desc"><img src="//www.saraminimage.co.kr/ui/layout/mypage_2016/pos_5th_txt.png" alt="SIAT 혹시 의심가는 지원자가 있으신가요? 사람인 인적성검사를 통해 부적합한 인재를 걸러내 보세요!"></p>
                    </div>
                </div>
            </li>
            <li class="has_depth _gnb_item gnb_interview_manage"><a href="/zf_user/memcom/interview/main" onmousedown="try{n_trackEvent('gnbmenu', 'button' , 'interview-manage', '');}catch(e){};">면접관리</a>
                <div class="list_gnb_depth2" style="display: none;">
                    <div class="depth2_inner">
                        <div class="depth2_btn"><a href="/zf_user/memcom/interview/write" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'interview-manage', 'add');}catch(e){};">면접 등록하기</a></div>
                        <ul>
                            <li><a href="/zf_user/memcom/interview/main" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'interview-manage', 'calendar');}catch(e){};">면접 캘린더</a></li>
                            <li><a href="/zf_user/memcom/interview/interview-list" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'interview-manage', 'interviewee');}catch(e){};">면접 대상자</a></li>
                            <li><a href="/zf_user/memcom/interview/interview-setting" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'interview-manage', 'setting');}catch(e){};">면접 관리설정</a></li>
                        </ul>
                        <p class="txt_desc"><img src="//www.saraminimage.co.kr/ui/layout/mypage_2016/pos_6th_txt.png" alt="업계 최초! 면접 불참 확인 서비스 면접 스케쥴과 참석 유무를 확인해보세요."></p>
                    </div>
                </div>
            </li>
        </ul>
        <ul class="list_gnb pos_right">
            <li class="_gnb_item"><a class="_gnb_item " onmousedown="try{n_trackEvent('gnbmenu', 'button', 'order-guide', '');}catch(e){};" href="/zf_user/service/company/order">채용 상품 안내</a></li>
            <li class="_gnb_item"><a href="/zf_user/service/company/order?part_id=talent_search" onmousedown="try{n_trackEvent('gnbmenu', 'button', 'talent-guide', '');}catch(e){};">인재 상품 안내</a></li>
            <li class="has_depth _gnb_item gnb_payment_history"><a href="/zf_user/memcom/service-manage/payment-history" onmousedown="try{n_trackEvent('gnbmenu', 'button' , 'payment-manage', '');}catch(e){};">결제내역</a>
                <div class="list_gnb_depth2" style="display: none;">
                    <div class="depth2_inner">
                        <ul>
                            <li><a href="/zf_user/memcom/service-manage/payment-history" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'payment-history');}catch(e){};">결제내역 조회</a></li>
                            <li><a href="/zf_user/memcom/service-manage/tax-history" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'tax-history');}catch(e){};">전자세금계산서 조회</a></li>
                            <li><a href="/zf_user/memcom/service-manage/coupon-history" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'coupon-history');}catch(e){};">쿠폰 사용 내역</a></li>
                            <li><a href="/zf_user/memcom/service-manage/point-history" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'point-history');}catch(e){};">S-포인트 사용 내역</a></li>
                            <li><a href="/zf_user/memcom/sms/sms-service-history-detail" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'sms-service-history');}catch(e){};">문자(SMS)사용 내역</a></li>
                            <li><a href="/zf_user/payment/manage/oneclick" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'oneclick');}catch(e){};">원클릭 결제 관리</a></li>
                            <li><a href="/zf_user/memcom/service-guide/point-coupon" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'service-guide', 's-point');}catch(e){};">S-포인트 안내</a></li>
                        </ul>
                        <p class="txt_desc"><img src="https://www.saraminimage.co.kr/ui/layout/mypage_2016/pos_9th_txt.png" alt="결제, 할인, 쿠폰 등 결제에 관한 모든 것! 사람인에서 구매하신 모든 내용을 한눈에 확인하실 수 있습니다."></p>
                    </div>
                </div>
            </li>
            <li class="_gnb_item"><a href="/zf_user/hr-magazine/list" onmousedown="try{n_trackEvent('gnbmenu', 'button', 'HR-magazine', '');}catch(e){};"><em>HR</em>매거진</a></li>
        </ul>
    </nav>
    
</div>

<div class="box_withshadow" style="border-bottom: 1px solid rgb(202, 202, 202);"></div>
<div id="layer_corp_info" class="layer_corp_info act_stop closed" style="">
    <span class="bg_arr"></span>
    <div class="tit_corp_name"><a href="javascript:void(0);" style="cursor:default;">삼겹파티</a></div>
    <div class="corp_info">
        <div class="area_corp_logo">
            <div class="thumbnail" id="gnb_layer_logo_html"><img alt="" src="https://pds.saramin.co.kr/company/logo/201811/06/phqx7s_6gx5-v8uzae_logo.png" class="thumb" onload="var el = this; setTimeout(function() {var w = el.offsetWidth, h = el.offsetHeight; if (el.offsetWidth > 74) {w = 74; h = Math.round(74*el.offsetHeight/el.offsetWidth) }; if (h > 32) { el.height = 32; } else {el.width = w}; }, 10);" height="32"></div>
            <a href="#" id="btn_modify_ci" class="btn_modify_ci" data-mcom_idx="7672625" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'company-manage', 'logo-photo');}catch(e){};"><span>로고 변경</span></a>
        </div>
        <div class="wrap_links">
            <a href="/zf_user/company-join/edit" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'company-manage', 'edit');}catch(e){};"><span>기업정보 관리</span></a>
            <a href="/zf_user/company/edit-passwd" class="float_right" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'company-manage', 'edit-passwd');}catch(e){};"><span>비밀번호 변경</span></a>
        </div>

        <div class="wrap_coupon_point">
            <dl class="coupon">
                <dt>쿠폰</dt>
                <dd><a href="/zf_user/memcom/service-manage/coupon-history?status=y" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'company-manage', 'coupon');}catch(e){};"><strong id="gnb_layer_coupon_cnt">0</strong>장</a></dd>
            </dl>
            <dl class="spoint">
                <dt>S-포인트</dt>
                <dd><a href="/zf_user/memcom/service-manage/point-history" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'company-manage', 's-point');}catch(e){};"><strong id="gnb_layer_spoint">10,000</strong>P</a></dd>
            </dl>
        </div>
    </div>

    <div class="area_bottom">
        <div class="left_links">
            <a href="/zf_user/company-join/edit" onmousedown="try{n_trackEvent('gnbmenu', 'layer' , 'company-manage', 'edit');}catch(e){};">기업정보 관리</a>
        </div>
        <a href="/zf_user/auth/logout?ut=c&amp;redirect=%2Fzf_user%2Fmemcom%2Findex%2Fmain">로그아웃</a>
    </div>
</div>

<script type="text/javascript">
    </script>
    </header>
</div>
</body>
</html>