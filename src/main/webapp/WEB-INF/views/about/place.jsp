<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/Place.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/js/about/place.js"></script>
	
<title>NO24 티켓</title>
<style type="text/css">
.title{
	font-size: 45px;
    text-align: center;
    color: #333;
    padding: 50px 0 50px 0;
    font-family: '맑은 고딕';
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
		<div class="title col-12">
			<h1>지역별 공연</h1>
		</div>
	</div>
	<!-- 지역별 카테고리 -->
	<div class="row">
		<div class="col-12" style="font-size: 12px;">
			<button onclick="showsList()" class="btn btn-outline-warning  text-dark py-3 px-3" style="width: 16.4%; border-color: #6c757d;">전체</button>

			<c:forEach var="name" items="${names}">

				<button onclick="showsList('${name}')" class="btn btn-outline-warning text-dark py-3 px-3" style="width: 16.4%; border-color: #6c757d;">${name}</button>
			</c:forEach>
	   </div>
	 </div>
	<!-- 공연수 -->
	<div class="row mt-5 mx-1"  >
		<div class="col-12" style="background-color:#FFFACD; text-align: center; padding-top: 20px; font-size: 20px; color: #333;">
			현재 예매 가능한 공연은 총 <span id="show-count" style="color: #FF6600; font-size: 22px;"></span>개 입니다.
		</div>
	</div>
	<!--목차 -->
	<div class="row mx-1">
		<div class="col-12" style= "text-align:right; padding: 20px 0 10px 0; border-bottom: solid gray;">
			<a href="#"><span style="margin-right: 15px">신상품순</span></a>
			<span style="margin-right: 15px">|</span>
			<a href="#"><span style="margin-right: 15px">종료임박순</span></a>
			<span style="margin-right: 15px">|</span>
			<a href="#"><span style="margin-right: 15px">상품명순</span></a>
		</div>
	</div>
	<!-- 데이터뿌리기 -->
	<div class="row my-3" id="show-box">
		<%-- <c:forEach var="show" items="${shows}">
		<div  class="col-3 mb-5" >
			<a href="#">
				<img style="max-width: 100%; width: 100%;" src="../resources/images/NO24/${show.posterImg}.jpg" alt="Card image">
			</a>
			<div class="mt-2" id="show-box" style="text-align: center;">
			
					<div><strong class="mb-2">${show.name}</strong></div>
					<div><small class="text-secondary"><fmt:formatDate value="${show.beginDate}"/>~<fmt:formatDate value="${show.endDate}"/></small></div>
					<div><small class="text-secondary">${show.placeName}</small></div> 
			
			</div>
	  	</div>
	  	</c:forEach> --%>
	</div>
	<div class="row">
		<div class="col-12 mt-5">
			<%@ include file="../../common/footer.jsp" %>
		</div>
	</div>
</div>
</body>
</html>