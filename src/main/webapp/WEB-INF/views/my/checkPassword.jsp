<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<link rel="stylesheet" href="resources/css/commons.css">
<title>NO24</title>
</head>
<body class="bg-light" style="font-family: 'Nanum Gothic', sans-serif;">	
	<!-- login form -->
	<div class="container">
	
		<c:if test="${param.error eq 'mismatch' }">
			<div class="row mb-5">
				<div class="col-6 offset-3 mt-5" style="margin-bottom: -100px;">
					<div class="alert alert-danger" style="text-align: center; padding-top: 20px;">
						<strong>오류</strong> 비밀번호가 올바르지 않습니다.
					</div>
				</div>
			</div>
		</c:if>
	
		<div class="row d-flex justify-content-center mt-5">
			<div class="col-6 mt-5">
  				<h2 class="text-center w3-animate-opacity"><strong>비밀번호 재확인</strong></h2>
  				<p class="text-center mt-1">개인정보보호를 위해 회원님의 비밀번호를 다시 한번 확인합니다.</p>
  				<div class="card mx-auto align-self-center">
  					<form id="login-form" method="post" action="modifyForm.do" onsubmit="checkLoginForm(event)">
  						<div class="card-body">
							<div class="form-group">
								<label>아이디</label>
								<input type="text" class="form-control" placeholder="ID" name="id" id="user-id" value="${user.id }" readonly/>
							</div>
							<div class="form-group">
								<label>비밀번호</label>
								<input type="password" class="form-control" placeholder="Password" name="password" id="user-password"/>
							</div>
							
							<div class="form-group d-flex justify-content-center">
								<input type="submit" class="btn btn-warning btn-lg" id="form-submit" value="확인" />
							</div>
  						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row fixed-bottom">
		<div class="col-12">
			<%@ include file="../../common/footer.jsp" %>
		</div>
	</div>
	
<script type="text/javascript">

	function checkLoginForm() {
		var password = document.querySelector("#user-password").value;
	
	    if (password == "") {
	    	alert("비밀번호를 입력해주세요.")
	    	event.preventDefault();
	    	return false;
	    }
	}
	
</script>
</body>
</html>