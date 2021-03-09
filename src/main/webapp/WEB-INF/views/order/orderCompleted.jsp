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
<title>NO24</title>
<style type="text/css">
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
				<div class="col-12" style="margin-bottom: 20px;">
				<h2 class="card-title" style="padding-top: 15px;">예매한 공연정보</h2>
				<table class="table table-hover">
					<colgroup>
						<col width="50%">
						<col width="20%">
						<col width="20%">
						<col width="10%">
					</colgroup>
				    <thead>
				      <tr>
				        <th>공연명</th>
				        <th>공연장소</th>
				        <th>공연날짜</th>
				        <th>공연시간</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td>${show.name }</td>
				        <td>${show.placeName }</td>
				        <td>${putShows.day }</td>
				        <td>${putShows.startTime }</td>
				      </tr>
				    </tbody>
				  </table>
				  <h2 class="card-title" style="padding-top: 15px;">주문정보</h2>
				<table class="table table-hover">
					<colgroup>
						<col width="50%">
						<col width="20%">
						<col width="20%">
						<col width="10%">
					</colgroup>
				    <thead>
				      <tr>
				        <th>예매 수량</th>
				        <th>주문금액</th>
				        <th>사용포인트</th>
				        <th>결제금액</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td>${order.orderAmount }개</td>
				        <td><fmt:formatNumber value="${order.totalOrderPrice }" />원</td>
				        <td><fmt:formatNumber value="${order.usedPoint }" />원</td>
				        <td><fmt:formatNumber value="${order.totalPaymentPrice }" />원</td>
				      </tr>
				    </tbody>
				  </table>
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