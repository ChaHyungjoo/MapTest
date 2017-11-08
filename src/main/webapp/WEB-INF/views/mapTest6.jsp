<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="">
		<h3 class="hidden">레스토랑 목록</h3>
		<table class="">
			<thead>
				<tr>
					<th class="">번호</th>
					<th class="">가게이름</th>
					<th class="">음식 사진</th>
					<th class="">작성자</th>
					<th class="">작성자 사진</th>
					<th class="">작성자 한마디</th>
					<th class="">좋아요</th>
					<th class="">평점</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="n" items="${list}">					
			<tr>
				<td>${n.id}</td>
				<td class=""><a href="restaurant/${n.id}">${n.name} (${n.countCmt})</a></td>
				<td>${n.image}</td>
				<td>${n.writerName}</td>
				<td>${n.writerImage}</td>
				<td>${n.tip}</td>
				<td>${n.countLiked}</td>
				<td>${n.avgPoint}</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>




	<div id="map" style="width: 100%; height: 800px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9c613e70636456cd2f3178169be248f"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			mapOption = {
				center : new daum.maps.LatLng(37.55325832462685, 126.93698692019638), // 지도의 중심좌표
				level : 3 // 지도의 확대 레벨
			};
	
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		/* 학원 마커 고정 --------------------------------------------------------------------------------*/
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(37.55325832462685, 126.93698692019638); 
		
		// 마커를 생성합니다
		var baseMarker = new daum.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		baseMarker.setMap(map);
				
		(function(baseMarker, title) {
			daum.maps.event.addListener(
					baseMarker
					, 'click'
					, function() {
						baseDisplayInfowindow(baseMarker, title);
					});
		})(baseMarker, "쌍용강북교육센터");
		
		function baseDisplayInfowindow(baseMarker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

			infowindow.setContent(content);
			infowindow.open(map, baseMarker);
		}
		
		/* -----------------------------------------------------------------------------------------*/
		
	
		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [
			{
				title : '카카오',
				latlng : new daum.maps.LatLng(33.450705, 126.570677)
			},
			{
				title : '생태연못',
				latlng : new daum.maps.LatLng(33.450936, 126.569477)
			},
			{
				title : '텃밭',
				latlng : new daum.maps.LatLng(33.450879, 126.569940)
			},
			{
				title : '근린공원',
				latlng : new daum.maps.LatLng(33.451393, 126.570738)
			}
		];
	
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	
		for (var i = 0; i < positions.length; i++) {
	
			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new daum.maps.Size(24, 35);
	
			// 마커 이미지를 생성합니다    
			var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
	
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage // 마커 이미지 
			});
		}
	</script>
</body>
</html>