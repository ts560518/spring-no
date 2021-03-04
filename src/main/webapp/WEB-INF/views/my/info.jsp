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
<style type="text/css">
	.btn-group-xs > .btn, .btn-xs {
	  padding: .45rem .4rem;
	  font-size: .875rem;
	  line-height: .5;
	  border-radius: .2rem;
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
<div class="container mt-5">
  	<h2 class="w3-border-bottom w3-border-light-grey w3-padding-16"><i class='far fa-address-book' style="color: orange; margin-right: 10px;"></i>마이페이지</h2>
  	
  	<div class="row mb-5">
  		<div class="col-2">
  			<img src="../resources/images/userDefault.png" alt="user" class="img-thumbnail">
		</div>
		    
		<div class="col-10">
			<table class="table d-flex justify-content-center">
				<tbody>
					<tr>
						<th>아이디</th>
						<td>${user.id }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${user.name }</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><fmt:formatDate value="${user.birth }" pattern="yyyy/MM/dd"/></td>
					</tr>
					<tr>	
						<th>연락처</th>
						<td>${user.tel }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${user.email }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${user.address }</td>
					</tr>
					<tr>
						<th>이메일 수신여부</th>
						<td>${user.emailReceivingConsent eq 'Y' ? '수신' : '거부' }</td>
					</tr>
					<tr>	
						<th>SMS 수신여부</th>
						<td>${user.smsReceivingConsent eq 'Y' ? '수신' : '거부' }</td>
					</tr>
					<tr>
						<th>사용가능 포인트</th>
						<td>${user.availablePoint }</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td><fmt:formatDate value="${user.createdDate }" pattern="yyyy/MM/dd"/></td>
					</tr>
				</tbody>
 			</table>
		</div>
	</div>
	
	<div class="row d-flex justify-content-center mt-5 mb-3">
   		<a href="checkPassword.do" class="btn btn-outline-primary float-center mr-2">회원정보수정</a>
   		<a href="putShowForm.do" class="btn btn-outline-success float-center">포인트 내역 조회</a>
   	</div>
	
	<p class="w3-border-bottom w3-border-black mt-5 mb-5"></p>
	<h3><i class='fas fa-money-bill-wave' style="font-size: 36px; color: orange; margin-right: 10px;"></i>최근 예매내역</h3>
	<table class="table mt-4">
		<thead>
			<tr>
				<th>예매번호</th>
				<th>상연번호(사실은 상연이름을 가져와야 함)</th>
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
 	
 	<!-- 비밀번호 변경 폼 모달 시작 -->
	<!-- Modal -->
	<div class="modal fade" id="modal-password-form" tabindex="-1" aria-hidden="true">
  		<div class="modal-dialog">
  			<form method="post" action="changePassword.hta" onsubmit="changePassword(event)">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title">비밀번호 변경하기</h5>
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        			</button>
      			</div>
      			<div class="modal-body">
      				<div class="card">
      					<div class="card-body">
		        			<div class="form-group">
		        				<label class="font-weight-bold">이전 비밀번호</label>
		        				<input type="password" class="form-control" name="prevPassword" id="pre-password"/>
		        			</div>
		        			<div class="form-group">
		        				<label class="font-weight-bold">새 비밀번호</label>
		        				<input type="password" class="form-control" name="password"  id="passsword"/>
		        			</div>
		        			<div class="form-group">
		        				<label class="font-weight-bold">새 비밀번호 확인</label>
		        				<input type="password" class="form-control" name="confirmPassword" id="confirm-password"/>
		        			</div>
      					</div>
      				</div>
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        			<button type="submit" class="btn btn-primary">변경하기</button>
      			</div>
    		</div>
    		</form>
  		</div>
	</div>
	<!-- 비밀번호 변경 폼 모달 끝 -->
 	
  	<div class="row">
		<div class="col-12">
			<%@ include file="../../common/footer.jsp" %>
		</div>
	</div>
</div>
<script type="text/javascript">
	function changePassword(event) {
		if (!document.getElementById("pre-password").value) {
			alert("이전 비밀번호를 입력하세요");
			event.preventDefault();
			return;
		}
		
		var password = document.getElementById("password").value;
		var confirmPassword = document.getElementById("confirm-password").value;
		if (!password || !confirmPassword) {
			alert("새 비밀번호를 입력하세요");
			event.preventDefault();
			return;
		}
		
		if (password != confirmPassword) {
			alert("비밀번호가 일치하지 않습니다.");
			event.preventDefault();
			return;
		}
		
	}
</script>
</body>
</html>