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
<title>Template</title>
<style type="text/css">
.seat-group {
	height: 40px;
	width: 40px;
	margin-right : 10px;
	margin-bottom : 10px;
	border: 1px solid gray;
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
	<div class="row" style="padding-top: 30px;">
		<div class="col-7" style="text-align:center;">
			<h3>좌석선택</h3>
			<input type="hidden" id="putShowNo" name="putShowNo" value="${putShowNo }">
			<c:forEach var="showSeatList" items="${showSeatList }">
				<button data-seat-no="${showSeatList.showSeatNo }" class="seat-group" ${showSeatList.ticket eq 'Y' ? 'disabled' : '' }>${showSeatList.showSeatNo }</button>
				<c:if test="${showSeatList.showSeatNo eq 'A5' }">
				<div class="col-12"></div>
				</c:if>
				<c:if test="${showSeatList.showSeatNo eq 'B5' }">
				<div class="col-12"></div>
				</c:if>
				<c:if test="${showSeatList.showSeatNo eq 'C5' }">
				<div class="col-12"></div>
				</c:if>
				<c:if test="${showSeatList.showSeatNo eq 'D5' }">
				<div class="col-12"></div>
				</c:if>
				
			</c:forEach>
		</div>
		<div class="col-5" style="padding-top: 40px; text-align: center;">
			<div>
				<p>A1~A5석 R석</p>
				<p>B1~D5석 S석</p>
			</div>
			<c:forEach var="seats" items="${seats }">
				<p  style="display: inline-block; margin-bottom: 0px;">${seats.grade }석</p>
				<fmt:formatNumber value="${seats.price }" /> 원 <br/>
			</c:forEach>
			
			<div style="padding-top: 30px;" id="showOrderTotalPrice">
				<span>가격</span>
				<span>상품 총 금액 : <strong class="mr-5"><fmt:formatNumber value="0" /> 원</strong></span>
				<input type="hidden" id="orderPrice" value="0">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12" style="text-align:center;">
			<button class="btn btn-danger">결재하기</button>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12 mt-5">
			<%@ include file="../../common/footer.jsp" %>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('.seat-group').click(function() {
		var orderPrice = document.querySelector("#orderPrice").value;
		$("#showOrderTotalPrice").empty();
		var seatNo = $(this).data('seat-no');
		var putShowNo = document.querySelector("#putShowNo").value;
		$.getJSON("/api/genre/orderPrice.do", {seatNo : seatNo, putShowNo : putShowNo}, function (result) {
			console.log(result);
			var price = parseInt(result.putSeat.seatPrice);
			var priceStr = new Number(price).toLocaleString();
			var html = '<span>가격</span>'
				html += '<span>상품 총 금액 : <strong class="mr-5">'+priceStr+'원</strong></span>'
				html += '<input type="hidden" id="orderPrice" value='+price+'>'
			
			$("#showOrderTotalPrice").append(html);
		 })
	})
</script>
</body>
</html>