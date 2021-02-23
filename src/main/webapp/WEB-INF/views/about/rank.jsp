<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Rank.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>NO24 티켓</title>
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
		<div class="title col-12">
			<h1>랭킹</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-12" style="font-size: 12px;">
			  <button type="button" class="btn btn-outline-secondary text-dark py-3 px-3" style="width: 14%">전체</button>
			  <button type="button" class="btn btn-outline-secondary text-dark py-3 px-3" style="width: 14%">콘서트</button>
			  <button type="button" class="btn btn-outline-secondary text-dark py-3 px-3" style="width: 14%">뮤지컬</button>
			  <button type="button" class="btn btn-outline-secondary text-dark py-3 px-3"style="width: 14%">연극</button>
			  <button type="button" class="btn btn-outline-secondary text-dark py-3 px-3"style="width: 14%">클래식/무용</button>
			  <button type="button" class="btn btn-outline-secondary text-dark py-3 px-3"style="width: 14%">전시/행사</button>
			  <button type="button" class="btn btn-outline-secondary text-dark py-3 px-3"style="width: 14%">아동/가족</button>
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