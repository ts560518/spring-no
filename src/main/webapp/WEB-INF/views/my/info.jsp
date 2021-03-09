<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="../resources/css/commons.css">
<title>No24 info</title>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
<div class="container-fluid">
	<!-- navbar -->
	<div class="row">
		<div class="col-12">
			<%@ include file="../../common/navbar.jsp" %>
		</div>
	</div>

  	<div class="w3-row-padding">
	    <!-- Left Column -->
	    <div class="w3-third mt-5 mb-5">
	    	<div class="w3-white w3-card-4 w3-padding-32">
	    	<h2 class="text-center mb-5"><i class='far fa-address-book' style="color: orange; margin-right: 10px;"></i>내 정보</h2>
	    		<div class="container text-center">
	          		<p>아이디 &nbsp;&nbsp;<strong>${user.id }</strong></p>
		          	<p>이름 &nbsp;&nbsp;<strong>${user.name }</strong></p>
		          	<p>생년월일 &nbsp;&nbsp;<strong><fmt:formatDate value="${user.birth }" pattern="yyyy/MM/dd"/></strong></p>
		          	<p>연락처 &nbsp;&nbsp;<strong>${user.tel }</strong></p>
		          	<p>이메일 &nbsp;&nbsp;<strong>${user.email }</strong></p>
		          	<p>주소 &nbsp;&nbsp;<strong>${user.address }</strong></p>
		          	<p>이메일 수신여부 &nbsp;&nbsp;<strong>${user.emailReceivingConsent eq 'Y' ? '수신' : '거부' }</strong></p>
		          	<p>SMS 수신여부  &nbsp;&nbsp;<strong>${user.emailReceivingConsent eq 'Y' ? '수신' : '거부' }</strong></p>
		          	<p>사용가능 포인트 &nbsp;&nbsp;<strong>${user.availablePoint }</strong></p>
		          	<p>가입일 &nbsp;&nbsp;<strong><fmt:formatDate value="${user.createdDate }" pattern="yyyy/MM/dd"/></strong></p>
	        
		        	<div class="row d-flex justify-content-center mt-5 mb-3">
		   				<a href="checkPassword.do" class="btn btn-outline-primary float-center mr-2">회원정보수정</a>
		   			</div>
	        	</div>
	      	</div>
	    </div><br />
	
	    <!-- Right Column -->
	    <div class="w3-twothird mt-4 mb-5">
	    	<div class="w3-container w3-card w3-white">
	        <h2 class="w3-text-grey w3-padding-16"><i class='far fa-clock' style="font-size: 36px; color: orange; margin-right: 10px;"></i>최근 예매내역</h2>
	        <table class="table mt-4">
				<thead>
					<tr class="text-center">
						<th>예매번호</th>
						<th>상연이름</th>
						<th>예매수량</th>
						<th>결제상태</th>
						<th>결제금액</th>
						<th>결제일</th>
					</tr>
				</thead>
				<tbody>
				<!-- foreach문 써야 함 -->
					<c:choose>
						<c:when test="${empty order }">
							<tr>
								<td colspan="6" class="text-center">최근 예매내역이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="order" items="${order }">
								<tr class="text-center"> 
									<td><a href="/genre/detail.do?no=${showList.no }" class="text-primary">${order.show.no }</a></td>
									<td><a href="/genre/detail.do?no=${showList.no }">${order.show.name }</a></td>
									<td>${order.order.orderAmount }</td>
									<td>${order.order.status }</td>
									<td>${order.order.totalOrderPrice }</td>
									<td><fmt:formatDate value="${order.order.createdDate }"/></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
	        <h2 class="w3-text-grey w3-padding-16 mt-5"><i class='fas fa-money-bill-wave' style="font-size: 36px; color: orange; margin-right: 10px;"></i>소유중인 쿠폰</h2>
	        <table class="table mt-4">
				<thead>
					<tr class="text-center">
						<th>유저번호</th>
						<th>쿠폰번호</th>
						<th>쿠폰이름</th>
						<th>쿠폰가격</th>
						<th>쿠폰기한</th>
						<th>기한만료여부</th>
						<th>쿠폰사용여부</th>
						<th>사용일자</th>
					</tr>
				</thead>
				<tbody>
				<!-- foreach문 써야 함 -->
					<c:choose>
						<c:when test="${empty coupon }">
							<tr>
								<td colspan="8" class="text-center">소유중인 쿠폰이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="coupon" items="${coupon }">
								<tr class="text-center">
									<td>${coupon.userCoupon.userNo }</td>
									<td>${coupon.coupon.no }</td>
									<td>${coupon.coupon.name }</td>
									<td>${coupon.coupon.price }</td>
									<td><fmt:formatDate value="${coupon.coupon.startDate }"/><br />~<br /><fmt:formatDate value="${coupon.coupon.endDate }"/></td>
									<td>${coupon.coupon.status }</td>
									<td>${coupon.userCoupon.disabled }</td>
									<td><fmt:formatDate value="${coupon.userCoupon.usedDate }"/></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
	        <h2 class="w3-text-grey w3-padding-16 mt-5"><i class='fab fa-product-hunt' style="font-size: 36px; color: orange; margin-right: 10px;"></i>포인트 현황</h2>
	        <table class="table mt-4">
				<thead>
					<tr class="text-center">
						<th>순서</th>
						<th>유저번호</th>
						<th>증감포인트</th>
						<th>증감내역</th>
						<th>포인트사용일</th>
					</tr>
				</thead>
				<tbody>
				<!-- foreach문 써야 함 -->
					<c:choose>
						<c:when test="${empty point }">
							<tr>
								<td colspan="5" class="text-center">최근 포인트변동이 확인되지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="point" items="${point }">
								<tr class="text-center">
									<td>${point.no }</td>
									<td>${point.userNo }</td>
									<td>${point.pointAmount }</td>
									<td>${point.content }</td>
									<td><fmt:formatDate value="${point.createdDate }"/></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
	      </div>
	    </div>
 	
	</div>
</div>

<div class="container">
	<!-- footer -->
	<div class="row">
		<div class="col-12">
			<%@ include file="../../common/footer.jsp" %>
		</div>
	</div>
</div>

</body>
</html>