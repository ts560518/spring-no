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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/categoryList.css">
<title>NO24</title>
</head>
<body>
<div class="container-fluld">
	<div class="row">
		<div class="col-12">
			<%@ include file="../../common/navbar.jsp" %>
		</div>
	</div>
</div>
<div class="container">
	<div class="row list-title">
	    <p class="li-sec-tit" style="margin: 0 auto;">
			<span class="li-sec-tit1">${category.categoryName }</span>
			<span>></span>
			<span class="li-sec-tit2">${category.categoryDetailName }</span>
	    </p>
	</div>
	<div class="row sec-tag" style="border-bottom: 2px solid #333;">
		<div class="btn-group" style="margin: 0 auto;">
	    	<button type="button" class="btn btn-basic category-list-btn">신상품순</button>
	    	<button type="button" class="btn btn-basic category-list-btn">종료임박순</button>
	    	<button type="button" class="btn btn-basic category-list-btn">상품명순</button>
		</div>
	</div>
	
	<div class="row"  style="text-align: center; padding-top: 20px;">
		<c:forEach var="show" items="${show }">
		<div class="col-3">
			<a href="/genre/detail.do?no=${show.no }">
				<img src="${pageContext.request.contextPath}/resources/images/NO24/${show.posterImg }.jpg">
				<small class="text-secondary">${show.name }</small><br>
				<small class="text-secondary"><fmt:formatDate value="${show.beginDate }" /></small><br>
				<small class="text-secondary">${show.placeName }</small>
			</a>
		</div>
		</c:forEach>
	</div>
	<div class="row">
		<div class="col-12 mt-5">
			<%@ include file="../../common/footer.jsp" %>
		</div>
	</div>
</div>

</body>
</html>