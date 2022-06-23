<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>company/welcome.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
	
<body>
	



	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더 들어가는곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문 메인 이미지 -->
		<div id="sub_img"></div>
		<!-- 왼쪽 메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="mailForm.jsp">오시는 길</a></li>
				
				
			</ul>
		</nav>
		<!-- 본문 내용 -->
		<table>
		<H3> </H3>
		</table>
	
	<div id="map" style="width:500px;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=533d9d3ded52c2707b6d45b4be09cc1d"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.464646769339375, 127.04291990119533), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var marker = new kakao.maps.Marker();

// 타일 로드가 완료되면 지도 중심에 마커를 표시합니다
kakao.maps.event.addListener(map, 'tilesloaded', displayMarker);

function displayMarker() {
    
    // 마커의 위치를 지도중심으로 설정합니다 
    marker.setPosition(map.getCenter()); 
    marker.setMap(map); 

    // 아래 코드는 최초 한번만 타일로드 이벤트가 발생했을 때 어떤 처리를 하고 
    // 지도에 등록된 타일로드 이벤트를 제거하는 코드입니다 
    // kakao.maps.event.removeListener(map, 'tilesloaded', displayMarker);
}
</script>
		


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>