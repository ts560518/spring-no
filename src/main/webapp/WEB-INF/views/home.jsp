<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<title>NO24</title>
<!-- Demo styles -->
  <style>
    html,
    body {
      position: relative;
      height: 100%;
    }

    body {
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper-container {
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
  </style>
<style type="text/css">
.cont-tit {
    font-size: 35px;
    color: #333;
    text-align: center;
    font-weight: 700;
    height: 80px;
    margin-top: 50px;
}

.lazyload {
    width: 220px;
    height: 308px;
}

.slide-wrapper {
    display: block;
    text-align: center;
    font-size: 0px;
}

.list-more {
    display: block;
    width: 220px;
    height: 48px;
    line-height: 48px;
    text-align: center;
    border: 1px solid #ddd;
    font-size: 15px;
    color: #000;
    background: #fff;
    margin: 39px auto 0 auto;
    position: relative;
    z-index: 5;
    transition: all 0.3s;
}

.ticket-date {
    font-size: 15px;
    color: #ec7d2c;
    padding: 15px 0 5px 0;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.ticket-tit {
    font-size: 15px;
    color: #000;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-12">
			<%@ include file="../common/navbar.jsp" %>
		</div>
	</div>
	<!-- Swiper -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
    	<img class="swiper-slide" src="${pageContext.request.contextPath}/resources/images/메인이미지001.jpg" alt="" class="lazyload">
    	<img class="swiper-slide" src="${pageContext.request.contextPath}/resources/images/메인이미지002.jpg" alt="" class="lazyload">
    	<img class="swiper-slide" src="${pageContext.request.contextPath}/resources/images/메인이미지003.jpg" alt="" class="lazyload">
    	<img class="swiper-slide" src="${pageContext.request.contextPath}/resources/images/메인이미지004.jpg" alt="" class="lazyload">
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>

  <!-- Swiper JS -->
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      pagination: {
        el: '.swiper-pagination',
        type: 'fraction',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>
	
</div>
<div class="container">	
	<div>
		<p class="cont-tit"><span>TICKET OPEN</span></p>
	</div>
	<div class="slide-wrapper row">
	<c:forEach var="showList" items="${showList }">
		<div class="col-3" style="display: inline-block; text-align: center;">
			<a href="/genre/detail.do?no=${showList.no }">
				<div class="ticket-txt">
				<img src="${pageContext.request.contextPath}/resources/images/NO24/${showList.posterImg }.jpg" alt="" class="lazyload">
					<p class="ticket-date"><fmt:formatDate value="${showList.beginDate }" /></p>
					<p class="ticket-tit">${showList.name }</p>
				</div>
			</a>
		</div>
	</c:forEach>
		<a href="../notice/list.do" class="list-more">티켓오픈 더보기 +</a>
	</div>
	
	<div>
		<p class="cont-tit"><span>RANKING</span></p>
	</div>
	<div class="slide-wrapper row">
	<c:forEach var="showRankList" items="${showRankList }">
		<div class="col-4" style="display: inline-block; text-align: center;">
			<a href="/genre/detail.do?no=${showRankList.no }">
				<img src="${pageContext.request.contextPath}/resources/images/NO24/${showRankList.posterImg }.jpg" alt="" class="lazyload">
				<div class="ticket-txt">
					<p class="ticket-date"><fmt:formatDate value="${showRankList.beginDate }"/></p>
					<p class="ticket-tit">${showRankList.name }</p>
				</div>
			</a>
		</div>
	</c:forEach>
		<a href="/rank.do" class="list-more">랭킹 더보기 +</a>
	</div>
	
	<div>
		<p class="cont-tit"><span>공지사항</span></p>
	</div>
	<table class="table">
	  		<thead class="bg-light">
		  		<colgroup>
						<col width="20%">
						<col width="60%">
						<col width="20%">
				</colgroup>
	  			<tr>
		        	<th>타입</th>
		        	<th>제목</th>
		        	<th>등록일</th>
		      	</tr>
		    </thead>
		    <tbody>
		    <c:forEach var="noticeList" items="${noticeList }">
		    	<tr>
		        	<td><button type="button" class="btn btn-outline-danger btn-sm">${noticeList.type }</button></td>
		        	<td><a href="../notice/detail.do?pageNo=${page.pageNo }&noticeNo=${noticeList.no }" class="text-primary" id="notice-title">${noticeList.title }</a></td>
		        	<td><fmt:formatDate value="${noticeList.createdDate }"/></td>
		      	</tr>
		    </c:forEach>
		    </tbody>
		</table>

	<a href="../notice/list.do" class="list-more">공지사항 더보기 +</a>
	
	<div class="row">
		<div class="col-12">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
	
</div>
</body>
</html>