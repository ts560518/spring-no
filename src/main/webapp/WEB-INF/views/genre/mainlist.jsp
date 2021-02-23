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

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
  <!-- Demo styles -->
  <style>
    body {
      background: #fff;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper-container {
      width: 100%;
      padding-top: 50px;
      padding-bottom: 50px;
    }

    .swiper-slide {
      background-position: center;
      background-size: cover;
      width: 300px;
      height: 300px;

    }
.ms5-l-tit {
    font-size: 26px;
    color: #333;
    left: 54px;
    top: 22px;
    font-weight: bold;
    font-family: 'Noto Sans KR','NanumBarunGothic','맑은 고딕','Malgun Gothic',sans-serif;
}
ul {
    position: absolute;
    left: 54px;
    top: 105px;
    width: 370px;
    border-top: 2px solid #333;
    border-bottom: 1px solid #333;
}

.rank-img {
    display: block;
    width: 80px;
    height: 112px;
    margin-right: 15px;
}

img {
	width: 100%;
}
  </style>
<title>NO24</title>
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
	 <!-- Swiper -->
	<div class="swiper-container">
	    <div class="swiper-wrapper">
	    <c:forEach var="showSwiperList" items="${showSwiperList }">
	      <a class="swiper-slide" href="./detail.do?no=${showSwiperList.no }"><img alt="" src="../resources/images/NO24/${showSwiperList.posterImg}.jpg" style="max-height: 100%; max-width: 100%;"> </a>
	    </c:forEach>
	    </div>
    	<!-- Add Pagination -->
    	<div class="swiper-pagination"></div>
	</div>
	
	<div class="row" style="padding: 50px; height: 500px;">
		<div class="col-12" style="text-align: center;">
			<p class="ms5-l-tit">
				WHAT'S HOT
			</p>
			<div class="col-3 mb-5" style="display: inline-block; text-align: center;">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/images/콘서트000001.jpg">
				<small class="text-secondary">제목</small><br>
				<small class="text-secondary">일산홀</small>
			</a>
			</div>
			<div class="col-3 mb-5" style="display: inline-block; text-align: center;">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/images/콘서트000001.jpg">
				<small class="text-secondary">제목</small><br>
				<small class="text-secondary">일산홀</small>
			</a>
			</div>
			<div class="col-3 mb-5" style="display: inline-block; text-align: center;">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/images/콘서트000001.jpg">
				<small class="text-secondary">제목</small><br>
				<small class="text-secondary">일산홀</small>
			</a>
			</div>
		</div>
	</div>

	<div class="row" style="padding: 50px; height: 500px;">
		<div class="col-12" style="text-align: center;">
			<p class="ms5-l-tit">
				지역별 추천
			</p>
			<div class="col-3 mb-5" style="display: inline-block; text-align: center;">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/images/콘서트000001.jpg">
				<small class="text-secondary">제목</small><br>
				<small class="text-secondary">일산홀</small>
			</a>
			</div>
			<div class="col-3 mb-5" style="display: inline-block; text-align: center;">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/images/콘서트000001.jpg">
				<small class="text-secondary">제목</small><br>
				<small class="text-secondary">일산홀</small>
			</a>
			</div>
			<div class="col-3 mb-5" style="display: inline-block; text-align: center;">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/images/콘서트000001.jpg">
				<small class="text-secondary">제목</small><br>
				<small class="text-secondary">일산홀</small>
			</a>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-12 mt-5">
			<%@ include file="../../common/footer.jsp" %>
		</div>
	</div>
</div>
  <!-- Swiper JS -->
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      effect: 'coverflow',
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: 'auto',
      coverflowEffect: {
        rotate: 50,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows: true,
      },
      pagination: {
        el: '.swiper-pagination',
      },
    });
  </script>
</body>
</html>