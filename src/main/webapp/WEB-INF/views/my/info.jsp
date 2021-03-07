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

<!-- navbar -->
<div class="row">
	<div class="col-12">
		<%@ include file="../../common/navbar.jsp" %>
	</div>
</div>

<div class="container-fluid">

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
		   				<a href="#" class="btn btn-outline-success float-center">포인트 내역 조회</a>
		   			</div>
	        	</div>
	      	</div>
	    </div><br>
	
	    <!-- Right Column -->
	    <div class="w3-twothird mt-4 mb-5">
	    	<div class="w3-container w3-card w3-white">
	        <h2 class="w3-text-grey w3-padding-16"><i class='fas fa-money-bill-wave' style="font-size: 36px; color: orange; margin-right: 10px;"></i>최근 예매내역</h2>
	        <table class="table mt-4">
				<thead>
					<tr>
						<th>예매번호</th>
						<th>상연번호(상연이름을 가져와야 함)</th>
						<th>예매수량</th>
						<th>결제상태</th>
						<th>결제금액</th>
						<th>결제일</th>
					</tr>
				</thead>
				<tbody>
				<!-- foreach문 써야 함 -->
					<tr>
						<td><a href="#" class="text-primary">예매번호</a></td>
						<td><a href="detail.jsp">상연번호를 통한 상연이름을 가져와야 해</a></td>
						<td>티켓오더아이템즈의 카운트를 가져와야 해</td>
						<td>결제완료라고 떠야 해</td>
						<td>결제 금액을 가져와야 해 내가 결제한 금액을</td>
						<td>결제일</td>
					</tr>
				</tbody>
			</table>
	      </div>
	    </div>
 	
	</div>
</div>

<!-- footer -->
<div class="row mt-5">
	<div class="col-12">
	<%@ include file="../../common/footer.jsp" %>
	</div>
</div>

</body>
</html>