<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Area.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
<title>NO24 티켓</title>
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
			<button type="button" class="btn btn-outline-secondary text-dark py-3 px-3" style="width: 16.4%">전체</button>
			<button type="button" class="btn btn-outline-secondary text-dark py-3 px-3" style="width: 16.4%">서울</button>
			<button type="button" class="btn btn-outline-secondary text-dark py-3 px-3" style="width: 16.4%">경기/인천</button>
			<button type="button" class="btn btn-outline-secondary text-dark py-3 px-3" style="width: 16.4%">충청/강원</button>
			<button type="button" class="btn btn-outline-secondary text-dark py-3 px-3" style="width: 16.4%">부산/대구</button>
			<button type="button" class="btn btn-outline-secondary text-dark py-3 px-3" style="width: 16.4%">광주/전라</button>
		</div>
	</div>
	<!-- 공연수 -->
	<div class="row" style="margin: 40px 3px 0 3px;"  >
		<div class="col-12" style="background-color:#EEEEEE; text-align: center; padding-top: 20px; font-size: 20px; color: #333;"  >
			<p >현재 예매 가능한 공연은 총 195개 입니다.</p>
		</div>
	</div>
	<!--목차 -->
	<div class="row"  style="margin: 0 3px 0 3px">
		<div class="col-12" style= "text-align:right; padding: 20px 0 10px 0; border-bottom: solid gray;">
			<a href="#"><span style="margin-right: 15px">신상품순</span></a>
			<a href="#"><span style="margin-right: 15px">종료임박순</span></a>
			<a href="#"><span style="margin-right: 15px">상품명순</span></a>
		</div>
	</div>
	<!-- 데이터뿌리기 -->
	<div class="row my-3">
		<div class="col-3 mb-5">
			<a href="#">
				<img style="max-width: 100%; width: 100%;" src="../resources/images/콘서트000001.jpg" alt="Card image">
			</a>
			<div class="mt-2" style="text-align: center;">
				<div><strong class="mb-2">콘서트</strong></div>
				<div><small class="text-secondary">2021.02.21~2021.02.25</small></div>
				<div><small class="text-secondary">일산홀</small></div>
			</div>
	  	</div>	
		<div class="col-3 mb-5">
			<a href="#">
				<img style="max-width: 100%; width: 100%;" src="../resources/images/콘서트000001.jpg" alt="Card image">
			</a>
			<div class="mt-2" style="text-align: center;">
				<div><strong class="mb-2">콘서트</strong></div>
				<div><small class="text-secondary">2021.02.21~2021.02.25</small></div>
				<div><small class="text-secondary">일산홀</small></div>
			</div>
	  	</div>	
		<div class="col-3 mb-5">
			<a href="#">
				<img style="max-width: 100%; width: 100%;" src="../resources/images/콘서트000001.jpg" alt="Card image">
			</a>
			<div class="mt-2" style="text-align: center;">
				<div><strong class="mb-2">콘서트</strong></div>
				<div><small class="text-secondary">2021.02.21~2021.02.25</small></div>
				<div><small class="text-secondary">일산홀</small></div>
			</div>
	  	</div>	
		<div class="col-3 mb-5">
			<a href="#">
				<img style="max-width: 100%; width: 100%;" src="../resources/images/콘서트000001.jpg" alt="Card image">
			</a>
			<div class="mt-2" style="text-align: center;">
				<div><strong class="mb-2">콘서트</strong></div>
				<div><small class="text-secondary">2021.02.21~2021.02.25</small></div>
				<div><small class="text-secondary">일산홀</small></div>
			</div>
	  	</div>	
		<div class="col-3 mb-5">
			<a href="#">
				<img style="max-width: 100%; width: 100%;" src="../resources/images/콘서트000001.jpg" alt="Card image">
			</a>
			<div class="mt-2" style="text-align: center;">
				<div><strong class="mb-2">콘서트</strong></div>
				<div><small class="text-secondary">2021.02.21~2021.02.25</small></div>
				<div><small class="text-secondary">일산홀</small></div>
			</div>
	  	</div>	
		<div class="col-3 mb-5">
			<a href="#">
				<img style="max-width: 100%; width: 100%;" src="../resources/images/콘서트000001.jpg" alt="Card image">
			</a>
			<div class="mt-2" style="text-align: center;">
				<div><strong class="mb-2">콘서트</strong></div>
				<div><small class="text-secondary">2021.02.21~2021.02.25</small></div>
				<div><small class="text-secondary">일산홀</small></div>
			</div>
	  	</div>	
		<div class="col-3 mb-5">
			<a href="#">
				<img style="max-width: 100%; width: 100%;" src="../resources/images/콘서트000001.jpg" alt="Card image">
			</a>
			<div class="mt-2" style="text-align: center;">
				<div><strong class="mb-2">콘서트</strong></div>
				<div><small class="text-secondary">2021.02.21~2021.02.25</small></div>
				<div><small class="text-secondary">일산홀</small></div>
			</div>
	  	</div>	
		<div class="col-3 mb-5">
			<a href="#">
				<img style="max-width: 100%; width: 100%;" src="../resources/images/콘서트000001.jpg" alt="Card image">
			</a>
			<div class="mt-2" style="text-align: center;">
				<div><strong class="mb-2">콘서트</strong></div>
				<div><small class="text-secondary">2021.02.21~2021.02.25</small></div>
				<div><small class="text-secondary">일산홀</small></div>
			</div>
	  	</div>	
	</div>

	<div class="row">
		<div class="col-12 mt-5">
			<%@ include file="../../common/footer.jsp" %>
		</div>
	</div>
</div>
</body>
</html>