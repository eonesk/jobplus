<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body {
		margin: 0 auto;
		padding: 30px 50px 30px 50px;
	}
	.button{
		background-color: #5882FA;
		border: none;
		padding: 3px 3px;
		text-align: center;
	    text-decoration: none;
	    display: inline-block;
		color:#fff;
		cursor: pointer;
	}
	.button:hover{
		background-color: #2E9AFE;
	}
	font{
		color: gray;
		font-size: 0.7em;
	}
</style>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a83477129827a8b78e5727b2058a47c6&libraries=services"></script>
<script type="text/javascript">
	$(function() {
		var location = "${param.location}";
		var title = "${param.title}";
		var markerName = "우리회사";
		$("#title").html(title);
		$("#location").append(location); 
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new daum.maps.LatLng(34.450701, 126.570667), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};  

		//지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 

		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		//주소로 좌표를 검색합니다
		geocoder.addressSearch(location, function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === daum.maps.services.Status.OK) {
	
			    var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
			    // 결과값으로 받은 위치를 마커로 표시합니다
			    var marker = new daum.maps.Marker({
			        map: map,
			        position: coords
			    });
		
			    // 인포윈도우로 장소에 대한 설명을 표시합니다
			    var infowindow = new daum.maps.InfoWindow({
			        content: "<div style='width:150px;text-align:center;padding:6px 0;'>"+ markerName +"</div>"
			    });
			    infowindow.open(map, marker);
	
			    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			    map.setCenter(coords);
			}else{
				alert("정확하지 않은 주소입니다. 다시 확인해주세요");
				window.close();
			}
		}); 
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	});
</script>
</head>
<body>
<h2 id="title"></h2>
<h4 id="location">주소 :&nbsp;</h4>
<div id="map" style="width:620px;height:400px;"></div>
<div><font>지도는 주소를 표기한 것이므로 실제 위치와 다를 수 있습니다</font></div>
</body>
</html>