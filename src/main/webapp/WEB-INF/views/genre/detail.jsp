<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Detail.css">
<title>NO24</title>
<style type="text/css">
.detail-content-title{
	text-align: center;
	font-size: 30px;
    color: #333;
    padding-bottom: 51px;
    font-weight: bold;
}
.detail-map-title{
	text-align: center;
    font-size: 40px;
    color: #333;
    font-weight: bold;
    padding: 85px 0 42px 0;
}
.detail-map-sub-title{
	text-align: center;
    font-size: 20px;
    color: #333;
    font-weight: bold;
}

	.star { 
	text-decoration: none; color: gray; 
	} 
	.star.on{ 
	color: orange; 
	}

</style>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-12">
			<%@ include file="../../common/navbar.jsp" %>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-12">
			<p style="padding-top: 50px; font-size: 17px;">${category.topCategory} > ${category.category }</p>
		</div>
		<div class="col-12">
			<p style="font-size: 40px; font-weight: bold;">${show.showName }</p>
		</div>
		<div class="col-12" style="margin-left:15px; border-bottom: 3px black solid;">
			<p><span style="margin-right: 10px;"><fmt:formatDate value="${show.beginDate }" />~ <fmt:formatDate value="${show.endDate }" /></span> | <span style="margin-left: 10px;">${show.placeName }</span></p>
		</div>
		
		<div class="col-12" style="margin-top: 40px;">
			<div class="col-5" style="display: inline-block; float: left;">
				<img src="${pageContext.request.contextPath}/resources/images/NO24/${show.posterImg }.jpg">
			</div>
			<div class="col-7 detail-content" style="display: inline-block; float: right;">
				<dl style=" border-bottom: 2px solid #000;">
					<dt>등급</dt>
					<dd>${show.viewingGradeName }</dd>
					<dt>관람시간</dt>
					<dd>&nbsp;${show.runningTime }</dd>
					<dt>출연</dt>
					<dd>
						<c:forEach var="actor" items="${actor }">
							<p style="display: inline-block; margin-right: 5px;">${actor.actorName }</p>
						</c:forEach>
					</dd>
					<dt>가격</dt>
					<dd style="background: #f6f6f6;">
						<c:forEach var="seat" items="${seat }">
							<p  style="display: inline-block; margin-bottom: 0px;">${seat.grade }석</p>
							<fmt:formatNumber value="${seat.price }" /> 원 <br/>
						</c:forEach>
					</dd>
				</dl>
				
				<dl style="border-bottom: 2px solid black; padding-bottom: 10px;">
					<dt>공연시간 안내</dt>
					<dd>
						<c:forEach var="putShows" items="${putShows }">
							<p style="display: inline-block; margin-right: 3px; margin-bottom: 0px;">${putShows.day }</p> ${putShows.startTime } <br/>
						</c:forEach> 
					</dd>
					<dt>배송정보</dt>
					<dd>현장 수령만 가능</dd>
				</dl>
				
				<div class="col-12" style="padding-top: 20px;">
					<form action="../order/order.do" method="post">
					<dl>
						<dt>상연정보</dt>
						<dd>
							<select name="putShows" id="putShows">
								<c:forEach var="putShows" items="${putShows }">
									<option value="${putShows.putShowNo }">${putShows.day } ${putShows.startTime }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
						<button class="btn btn-danger" style="font-size: 20px; width: 200px; height: 50px; display: block; margin: 0 auto;" ${show.viewingGradeSd <= LOGINED_USER.age ? '' :'disabled'}>예매하기</button>
					</form>
				</div>
			</div>
		</div>

		<div class="like" style="margin-left: 30px; padding-top: 20px;">
			<div class="rn-product-good" onclick="likegood()">
				<input type="hidden" id="likeUser" value="${likeUser }">
				<input type="hidden" id="likeCnt" value="${likeCnt }">
				<input type="hidden" id="showNo" value="${show.showNo }">
				<div id="likeImg" style="display: inline-block;">
					<c:if test="${likeUser ne null }">
						<img src="${pageContext.request.contextPath}/resources/images/좋아요하트.jpg" alt="" style="display: inline-block;">
					</c:if>
					<c:if test="${likeUser eq null }">
						<img src="${pageContext.request.contextPath}/resources/images/좋아요깨진하트.jpg" alt="" style="display: inline-block;">
					</c:if>
					<span style="color: red; font-size: 15px;">${likeCnt }</span>
				</div>
				<span class="">Likes</span>
			</div>

		</div>
	</div>
	<div class="row" style="margin-top:30px; border-top: 2px solid black;">
		<p class="col-12 detail-content-title" style="margin-top: 50px;">유의사항</p>
		<img src="${pageContext.request.contextPath}/resources/images/detail/유의사항.jpg" style="margin: 0 auto;">
		<p class="col-12 detail-content-title" style="padding-top: 20px; font-size: 30px;">공연정보</p>
		<img src="${pageContext.request.contextPath}/resources/images/NO24/${show.showDetailImg }.jpg" style="margin: 0 auto;">
		<p class="col-12 detail-content-title">할인정보</p>
		<img src="${pageContext.request.contextPath}/resources/images/detail/${show.saleImg }.jpg" style="margin: 0 auto;">
	</div>
	
	<!-- 지도 -->
	<div class="row" style="border-top: 3px black solid;">
		<div class="col-12">
			<p class="detail-map-title">${show.placeName }</p>
			<p class="detail-map-sub-title">${show.placeAddress }</p>
			<input id="showPlaceAddress" type="hidden" value="${show.placeAddress }">
		</div>
		<div class="col-12" style="border-top: 2px #ddd solid;">
			
			<div id="mapwrap">
			
				<div class="mapicon" style="text-align: center; padding: 66px 0 55px 0; width: 750px; margin: 44px auto 0 auto;">
					<ul id="category">
				       <!--  <li id="BK9" data-order="0"> 
				        	<i class='fas fa-coffee' style='font-size:48px;color:red; display: block;'></i>
				            <span class="category_bg bank"></span>
				            주변 은행
				        </li>     -->   
				        <li id="MT1" data-order="1" style="display: inline-block; margin-right: 70px;"> 
				        	<i class='fas fa-shopping-cart' style='font-size:48px;color:gray; display: block;'></i>
				            <span class="category_bg mart"></span>
				         주변  마트
				        </li>
				     <!--    <li id="PM9" data-order="2"> 
				        	<i class='fas fa-coffee' style='font-size:48px;color:red; display: block;'></i>
				            <span class="category_bg pharmacy"></span>
				           주변 약국
				        </li>   -->
				        <li id="OL7" data-order="3" style="display: inline-block; margin-right: 70px;"> 
				        	<i class='fas fa-gas-pump' style='font-size:48px;color:gray; display: block;'></i>
				            <span class="category_bg oil"></span>
				          주변 주유소
				        </li>  
				        <li id="CE7" data-order="4" style="display: inline-block; margin-right: 70px;"> 
				        	<i class='fas fa-coffee' style='font-size:48px;color:gray; display: block;'></i>
				            <span class="category_bg cafe"></span>
				            주변 카페
				        </li>  
				        <li id="CS2" data-order="5" style="display: inline-block; margin-right: 70px;"> 
				        	<img class='fas fa-coffee' style='font-size:48px;color:gray; display: block;' alt="" src="${pageContext.request.contextPath}/resources/images//편의점.png">
				            <span class="category_bg store"></span>
				           주변 편의점
				        </li>      
				    </ul>
				</div>
				<div id="map" style="width:100%;height:700px;"></div>
			</div>

			
			<h2 class="w3-border-bottom w3-border-light-grey w3-padding-16"><i class='fas fa-pencil-alt' style="color: orange; margin-right: 10px;"></i>리뷰쓰기</h2>
			<p>매매, 욕설 등 NO24 게시판 운영 규정에 위반되는 글은 사전 통보없이 삭제될 수 있습니다.</p>
			<p>
			개인정보가 포함된 내용은 삼가 주시기 바라며, 게시물로 인해 발생하는 문제는 작성자 본인에게 책임이 있습니다.
			<span><button type="button" class="btn btn-outline-warning" data-toggle="modal" data-target="#myModal">리뷰 쓰기</button></span>
			</p>

		
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f051764ed5569f3245a77f313e307b6a&libraries=services"></script>
			<script>

			
	  		<div class="row mb-2">
	  			<div class="col-12 d-flex justify-content-center">
	  				<input type="hidden" name="sort" value="${empty param.sort ? 'date' : param.sort }" />
		    		<input type="hidden" name="pageNo" value="${page.pageNo }" />
	  			</div>
			</div>
	        
		  	<table class="table" id="table-reviews">
		  		<thead class="bg-light">
		  			<tr>
			        	<th>내용</th>
			        	<th>평점</th>
			        	<th>등록일</th>
			      	</tr>
			    </thead>
			    <tbody>
			    <%-- <c:forEach var="review" items="${reviews }">
			    	<tr>
						<td><c:out value="${review.content }" escapeXml="false"></c:out></td>
			        	<td>${review.rating }</td>
			        	<td><fmt:formatDate value="${review.createdDate }"/></td>
			      	</tr>
			    </c:forEach> --%>
			    </tbody>
			</table>
	  
	  		<br>
			
			<br>
			<div class="row mt-5">
				<div class="col-12">
					<ul class="pagination justify-content-center" id="box-pagination">
				  		<li class="page-item ${page.pageNo gt 1 ? '' : 'disabled' }">
				  			<a class="page-link w3-hover-blue" data-page-no=${page.pageNo - 1 } href="list.do?status=${status }&sort=${param.date }&pageNo=${page.pageNo - 1 }">&laquo;</a>
				  		</li>
				  		<%-- <c:forEach var="num" begin="${page.beginPage }" end="${page.endPage }">
					  		<li class="page-item ${num eq page.pageNo ? 'active' : '' }">
					  			<a class="page-link w3-hover-blue" data-page-no=${num } href="list.do?status=${status }&sort=${param.date }&pageNo=${num }">${num }</a>
					  		</li>
				  		</c:forEach> --%>
				  		
				  		<li class="page-item ${page.pageNo lt page.totalPages ? '' : 'disabled' }">
				  			<a class="page-link w3-hover-blue" data-page-no=${page.pageNo + 1 } href="list.do?status=${status }&sort=${param.date }&pageNo=${page.pageNo + 1 }">&raquo;</a>
				  		</li>
					</ul>
				</div>
			</div>
			
			
			
			
			<!-- The Modal -->
			<div class="modal fade" id="myModal">
				<div class="modal-dialog modal-dialog-centered">
				<form id="show-form" method="post" action="register.do">
				<div class="modal-content">
    
				<!-- Modal Header -->
				<div class="modal-header">
				 	<h4 class="modal-title">${show.showName }</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
	     
			     <p>별점</p>
			     <P id="star"> 
			     <!-- 부모 --> <a href="#" id="rating" value="1">★</a> 
			     <!-- 자식들--> <a href="#" value="2">★</a> 
			     <a href="#" value="3">★</a> 
			     <a href="#" value="4">★</a> 
			     <a href="#" value="5">★</a> 
			     <p>
			     
			     <!-- Modal body -->
			     <div class="modal-body">
					<textarea class="form-control" rows="8" id="content" name="content" placeholder="내용을 입력하세요."></textarea>
			     </div>
	     
				<div class="row d-flex justify-content-center mt-5 mb-3">
					<button type="submit" id="put-show" class="btn btn-danger float-right mr-2">등록</button>
					<a href="#" class="btn btn-outline-dark float-right">취소</a>
				</div>
	     		<!-- Modal footer -->
	       		<div class="modal-footer">
	       			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	       		</div>
     			</div>
			</form>
				</div>
 			</div>
		
			<%-- <div>
			<c:forEach var="review" items="reviews">
			<table>
				<tbody>
					<td>${review.rating }</td>
					<td><c:out value="${review.content }" escapeXml="false"></c:out></td>
					<td>테스트</td>
					<td>테스트</td>
				</tbody>
			</table>
			</c:forEach>
			</div> --%>
			
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f051764ed5569f3245a77f313e307b6a&libraries=services"></script>
<script>

	
		
	function getReviewsAndPagination(pageNo) {
		var $reviewTbody = $("#table-reviews").empty();
		var $reviewUl = $("#box-pagination").empty();
		
		$.getJSON("reviews.do", {no: '${param.no}', page:pageNo}, function(result) {
			var reviews = result.reviewDtos;
			var page = result.pagination;
			
			$.each(reviews, function(index, review) {
				var tr = "<tr>";
				tr += "<td>"+review.content+"</td>";
				tr += "<td>"
				for (var i=1; i<=review.rating; i++) {
					tr += "<span class='star on'>★<span>"
				}
				for (var i=1; i<=5-review.rating; i++) {
					tr += "<span class='star'>★<span>"
				}
				tr += "</td>";
				tr += "<td>"+new Date(review.createdDate).toLocaleString()+"</td>";
				tr += "</tr>"
				
				$reviewTbody.append(tr);
			});
			
			for (var num=page.beginPage; num<=page.endPage; num++) {
				var li = "<li class='page-item "+ (num == page.pageNo ? 'active' : '' ) +" '>";
				li += '<a class="page-link w3-hover-blue" data-page-no="'+num+'">'+num+'</a>'
				li += "</li>"
				
				$reviewUl.append(li);
			}
		})
		
	}
	
	getReviewsAndPagination(1);
	
	$('#box-pagination').on('click', 'a', function(event) {
		var pageNo = $(this).data("page-no");
		getReviewsAndPagination(pageNo)
	})

	


	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);	
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	// 상세주소
	var showPlaceAddress = document.querySelector("#showPlaceAddress").value;
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(showPlaceAddress, function(result, status) {
	
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
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+showPlaceAddress+'</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    }
	});
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(map); 

	// 지도에 idle 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', searchPlaces);

	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	contentNode.className = 'placeinfo_wrap';

	// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
	addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);  

	// 각 카테고리에 클릭 이벤트를 등록합니다
	addCategoryClickEvent();

	// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
	function addEventHandle(target, type, callback) {
	    if (target.addEventListener) {
	        target.addEventListener(type, callback);
	    } else {
	        target.attachEvent('on' + type, callback);
	    }
	}

	// 카테고리 검색을 요청하는 함수입니다
	function searchPlaces() {
	    if (!currCategory) {
	        return;
	    }
	    
	    // 커스텀 오버레이를 숨깁니다 
	    placeOverlay.setMap(null);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
	        displayPlaces(data);
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

	    } else if (status === kakao.maps.services.Status.ERROR) {
	        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
	        
	    }
	}

	// 지도에 마커를 표출하는 함수입니다
	function displayPlaces(places) {

	    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
	    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
	    var order = document.getElementById(currCategory).getAttribute('data-order');

	    

	    for ( var i=0; i<places.length; i++ ) {

	            // 마커를 생성하고 지도에 표시합니다
	            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	            (function(marker, place) {
	                kakao.maps.event.addListener(marker, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker, places[i]);
	    }
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, order) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfo (place) {
	    var content = '<div class="placeinfo">' +
	                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

	    if (place.road_address_name) {
	        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
	                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
	    }  else {
	        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
	    }                
	   
	    content += '    <span class="tel">' + place.phone + '</span>' + 
	                '</div>' + 
	                '<div class="after"></div>';

	    contentNode.innerHTML = content;
	    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
	    placeOverlay.setMap(map);  
	}


	// 각 카테고리에 클릭 이벤트를 등록합니다
	function addCategoryClickEvent() {
	    var category = document.getElementById('category'),
	        children = category.children;

	    for (var i=0; i<children.length; i++) {
	        children[i].onclick = onClickCategory;
	    }
	}

	// 카테고리를 클릭했을 때 호출되는 함수입니다
	function onClickCategory() {
	    var id = this.id,
	        className = this.className;

	    placeOverlay.setMap(null);

	    if (className === 'on') {
	        currCategory = '';
	        changeCategoryClass();
	        removeMarker();
	    } else {
	        currCategory = id;
	        changeCategoryClass(this);
	        searchPlaces();
	    }
	}

	// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
	function changeCategoryClass(el) {
	    var category = document.getElementById('category'),
	        children = category.children,
	        i;

	    for ( i=0; i<children.length; i++ ) {
	        children[i].className = '';
	    }

	    if (el) {
	        el.className = 'on';
	    } 
	} 
	
	
	
	// 리뷰 별점!!!!!!!!!!
	$('a.star').click(function(){ 
		$(this).parent().children("a").removeClass("on"); 
		$(this).addClass("on").prevAll("a").addClass("on"); 
		console.log($(this).attr("value")); 
	});

	</script>

				// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
				function changeCategoryClass(el) {
				    var category = document.getElementById('category'),
				        children = category.children,
				        i;

				    for ( i=0; i<children.length; i++ ) {
				        children[i].className = '';
				    }

				    if (el) {
				        el.className = 'on';
				    } 
				} 
				
				</script>


		</div>
	</div>
	
	
	<div class="row">
		<div class="col-12">
			<%@ include file="../../common/footer.jsp" %>
		</div>
	</div>
</div>
<script type="text/javascript">
	function likegood() {
		var likeUser = document.getElementById("likeUser").value;
		var likeCnt = document.getElementById("likeCnt").value;
		if(likeUser) {
			alert("이미 참여하셨습니다.");
			return;
		} else {
			var showNo = document.getElementById("showNo").value;
			var likeCnt = document.getElementById("likeCnt").value;
			$.getJSON("/api/genre/showLike.do",{showNo:showNo}, function (result) {
				if(!result) {
					alert("로그인을 해주세요");
					return;
				}
				$("#likeImg").empty();
				var likeCntplus = parseInt(likeCnt)+1;
				var html = '<img src="${pageContext.request.contextPath}/resources/images/좋아요하트.jpg" alt="" style="display: inline-block;">'
					html += '<span style="color: red; font-size: 15px;">'+likeCntplus+'</span>'
				document.getElementById("likeUser").value= '참여완료';
				$("#likeImg").append(html);
			})
		}
	}
</script>
</body>
</html>