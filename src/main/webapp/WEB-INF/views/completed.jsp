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
	</div>

	<div class="row">
		<div class="col-6 offset-3 mt-5">
			<div class="card" style="text-align: center; padding-top: 20px; margin-top: 160px;">
				<div class="card-body">
					<h4 class="card-title text-info" style="margin-bottom: 50px; font-weight: bold;">회원가입 완료</h4>
					<p class="card-text" style="margin-bottom: 10px;">회원가입이 정상적으로 완료되었습니다.</p>
					<p class="card-text">로그인 후 다양한 서비스를 이용해보시기 바랍니다.</p>
					<a class="btn btn-secondary btn-sm" href="loginform.do">로그인 하러가기</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>