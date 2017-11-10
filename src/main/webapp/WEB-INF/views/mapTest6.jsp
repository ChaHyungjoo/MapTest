<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	margin-left: auto;
	margin-right: auto;
	position: relative;
	width: 80%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>

</head>
<body>

	<%-- <div class="">
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
	</div> --%>
	<input type="button" value="ajax">
	<div class="">
		<h3 class="hidden">레스토랑 목록</h3>
		<table class="">
			<thead>
				<tr>
					<th class="">번호</th>
					<th class="">가게이름</th>
					<th class="">주소</th>
					<th class="">좌표</th>
					<th class="">음식 사진</th>
					<th class="">작성자</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="n" items="${list}">					
			<tr>
				<td>${n.id}</td>
				<td class=""><a href="restaurant/${n.id}">${n.name} (${n.countCmt})</a></td>
				<td>${n.address}</td>
				<td>${n.location}</td>
				<td>${n.image}</td>
				<td>${n.writerName}</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 : <input type="text" value=" " id="keyword" size="15">
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>




	<div id="map" style="width: 100%; height: 800px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9c613e70636456cd2f3178169be248f"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			mapOption = {
				center : new daum.maps.LatLng(37.55325832462685, 126.93698692019638), // 지도의 중심좌표
				level : 4 // 지도의 확대 레벨
			};
	
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		/* 학원 마커 고정 --------------------------------------------------------------------------------*/
		var ajaxButton = $("input[value='ajax']");
		
		/* ajaxButton.click(function(e){
			//alert("hi");
			$.getJSON("map2-ajax")
			.done(function(data){
				alert(data.length);
				alert(data[0].location);
			})
		}); */
		
		
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
		
		$.getJSON("map2-ajax")
			.done(function(data) {
					//alert(data.length);
					//alert(data[0].location);
					//var str = data[0].location;
					
					/* var location = data[0].location.replace(/\(|\)/g,"");
					var xy = location.split(", ");
					alert(xy[0]+" "+xy[1]); */
					
					var locations = new Array();
					for(var i=0; i<data.length; i++){
						var location = data[i].location.replace(/\(|\)/g,"");
						locations.push(location);
					}
					//alert(locations[0]);
					
					
					// 마커를 표시할 위치와 title 객체 배열입니다 
					/* var positions = [
						{
							title : data[0].name,
							latlng : new daum.maps.LatLng(xy[0], xy[1])
							//latlng : new daum.maps.LatLng(data[0].location.replace(/\(|\)/g, ""))
							//latlng : new daum.maps.LatLng(37.5566398795825, 126.93524677384968)
						},
						{
							title : data[1].name,
							latlng : new daum.maps.LatLng(xy[0], xy[1])
						},
						{
							title : data[2].name,
							latlng : new daum.maps.LatLng(xy[0], xy[1])
						}
					];
					var positionss = JSON.stringify(positions);
					alert(positionss);
					alert(positions[0].latlng); */
					
					var positionList = new Array();
					for(var i=0; i<data.length; i++){
						var restaurant = new Object();
						var xy = locations[i].split(", ");
						
						restaurant.title = data[i].name;
						restaurant.latlng = new daum.maps.LatLng(xy[0], xy[1]);
						
						positionList.push(restaurant);
					}
					
					var positions = JSON.stringify(positionList);
					//alert(positions);
					alert(positionList.length);
					
					// 마커 이미지의 이미지 주소입니다
					/* var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
					
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
					} */
					
					// 마커 이미지의 이미지 주소입니다
					var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
					for (var i = 0; i < data.length; i++) {
	
						// 마커 이미지의 이미지 크기 입니다
						var imageSize = new daum.maps.Size(24, 35);
	
						// 마커 이미지를 생성합니다    
						var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
	
						// 마커를 생성합니다
						var marker = new daum.maps.Marker({
							map : map, // 마커를 표시할 지도
							position : positionList[i].latlng, // 마커를 표시할 위치
							title : positionList[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
							image : markerImage // 마커 이미지 
						});
					}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
				})
		
	

	</script>
</body>
</html>