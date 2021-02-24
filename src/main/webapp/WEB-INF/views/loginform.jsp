<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>NO24</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
	body {
		background-color: #f9f9f9;
	}
</style>
<body>
<div class="container">

	<div class="row mt-4">
		<div class="col-10">
			<a href="home.do">
				<img src="${pageContext.request.contextPath}/resources/images/logo.png" style="height: 30px; width: 150px;">
			</a>
		</div>
		<div class="col-2">
			<a href="/form.do"><button style="width: 100px; height: 35px; background-color: white;">회원가입</button></a>
		</div>
	</div>
		
	<c:if test="${param.error eq 'empty' }">
		<div class="row">
			<div class="col-6 offset-3 mt-5" style="margin-bottom: -100px;">
				<div class="alert alert-danger" style="text-align: center; padding-top: 20px;">
					<strong>오류</strong> 아이디와 비밀번호는 필수 입력값입니다.
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${param.error eq 'notfound' or param.error eq 'mismatch' }">
		<div class="row">
			<div class="col-6 offset-3 mt-5" style="margin-bottom: -100px;">
				<div class="alert alert-danger" style="text-align: center; padding-top: 20px;">
					<strong>오류</strong> 아이디 혹은 비밀번호가 올바르지 않습니다.
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${param.error eq 'deny' }">
		<div class="row">
			<div class="col-6 offset-3 mt-5" style="margin-bottom: -100px;">
				<div class="alert alert-danger" style="text-align: center; padding-top: 20px;">
					<strong>오류</strong> 로그인이 필요한 서비스에 접속을 시도하였습니다.
				</div>
			</div>
		</div>
	</c:if>
	
	<div class="row" style="margin-top: 120px;">
		<div class="col-6 offset-3">
			<div class="card" style="height: 100%">
				<form id="login-form" method="post" action="login.do" onsubmit="checkLoginForm(event)">
					<div class="card-body" style="height: 380px;">
						<div class="form-group mt-2" style="margin-bottom: 40px;">
							<h2 style="font-weight: bold;">LOGIN</h2>
						</div>
						<div class="form-group mt-4">
							<input type="text" style="height: 50px;" class="form-control" name="id" id="user-id" placeholder="아이디"/>
						</div>
						<div class="form-group">
							<input type="password" style="height: 50px;" class="form-control" name="password" id="user-password" placeholder="비밀번호"/>
						</div>
						<div class="text-right mt-5">
							<button class="btn btn-primary btn-lg btn-block" >로그인</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>	
</div>
<script type="text/javascript">
	function checkLoginForm(event) {
		var form = document.querySelector("login-form");

		if (!document.querySelector("#user-id").value) {
			alert("아이디는 필수입력값입니다.");
			event.preventDefault();
			return;
		}


		if (!document.querySelector("#user-password").value) {
			alert("비밀번호는 필수입력값입니다.");
			event.preventDefault();
			return;
		}

		form.submit();
	}
</script>
</body>
</html>