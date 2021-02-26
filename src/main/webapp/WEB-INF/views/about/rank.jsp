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
	<link rel="stylesheet" type="text/css"  href="/resources/css/Rank.css">
	<script type="text/javascript" src="/resources/js/about/rank.js"></script>
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
		 <button type="button" class="btn btn-outline-warning  text-dark py-3 px-3"  style="width: 14%; border-color: #6c757d;">전체</button>
		<c:forEach var="category" items="${categories}">
			  <button type="button" class="btn btn-outline-warning  text-dark py-3 px-3"  style="width: 14%; border-color: #6c757d;">${category.name}</button>
		</c:forEach>
		</div>
	</div>
	
	<!-- 순위 카테고리 -->
	<div class="row mx-1" >
		<div class="col-12" id="rank-category">
			<a href="#"><span style="margin-right: 10px">일간</span></a>
			<span style="margin-right: 15px">|</span>
			<a href="#"><span style="margin-right: 10px">주간</span></a>
			<span style="margin-right: 15px">|</span>
			<a href="#"><span style="margin-right: 10px">월간</span></a>
			<span style="margin-right: 15px">|</span>
			<a href="#"><span style="margin-right: 10px">연간</span></a>
		</div>
	</div>
	
	<!-- 1위~3위 -->
	<div class="row mx-1 d-flex justify-content-center" style="background-color: #FFFACD;">
		<div class="col-4 mb-3 px-5 py-5">
			<a href="#">
				<img class="img-thumbnail" style="background-color: #FFFACD;" src="../resources/images/콘서트000001.jpg" alt="Card image">
			</a>
			<p id="rank-best">
				<span>1위</span>
			</p>
			<div class="mt-2" style="text-align: center;">
				<div><strong class="mb-2">콘서트</strong></div>
				<div><small class="text-secondary">2021.02.21~2021.02.25</small></div>
				<div><small class="text-secondary">일산홀</small></div>
			</div>
	  	</div>		
		<div class="col-4 mb-3 px-5 py-5">
			<a href="#">
				<img class="img-thumbnail" style="background-color: #FFFACD;" src="../resources/images/콘서트000001.jpg" alt="Card image">
			</a>
			<p id="rank-best">
				<span>2위</span>
			</p>
			<div class="mt-2" style="text-align: center;">
				<div><strong class="mb-2">콘서트</strong></div>
				<div><small class="text-secondary">2021.02.21~2021.02.25</small></div>
				<div><small class="text-secondary">일산홀</small></div>
			</div>
	  	</div>		
		<div class="col-4 mb-3 px-5 py-5">
			<a href="#">
				<img class="img-thumbnail" style="background-color: #FFFACD;" src="../resources/images/콘서트000001.jpg" alt="Card image">
			</a>
			<p id="rank-best">
				<span>3위</span>
			</p>
			<div class="mt-2" style="text-align: center;">
				<div><strong class="mb-2">콘서트</strong></div>
				<div><small class="text-secondary">2021.02.21~2021.02.25</small></div>
				<div><small class="text-secondary">일산홀</small></div>
			</div>
	  	</div>		
	</div>
	
	<!-- 4위이상 -->
	<div class="row mx-1" style="border-bottom: solid;">
		<table class="table" >
         <colgroup>
               <col width="10%">
               <col width="10%">
               <col width="55%">
               <col width="25%">
         </colgroup>
          <tbody>
            <tr id="rank-list">
            	 <td style="padding-top: 50px; text-align: center;"><strong>4위</strong></td>
                 <td><img alt="" src="../resources/images/콘서트000001.jpg" style="max-width: 100%;"> </td>
                 <td style="padding-top: 50px;">2021 뮤지컬[미드나잇:액터뮤지션]</td>
                 <td>2021.12.01~2021.05.21<br>삼성동 백암아트홀</td>
            </tr>
            <tr id="rank-list">
            	 <td style="padding-top: 50px; text-align: center;"><strong>5위</strong></td>
                 <td><img alt="" src="../resources/images/콘서트000001.jpg" style="max-width: 100%;"> </td>
                 <td style="padding-top: 50px;">2021 뮤지컬[미드나잇:액터뮤지션]</td>
                 <td>2021.12.01~2021.05.21<br>삼성동 백암아트홀</td>
            </tr>
            <tr id="rank-list">
            	 <td style="padding-top: 50px; text-align: center;"><strong>6위</strong></td>
                 <td><img alt="" src="../resources/images/콘서트000001.jpg" style="max-width: 100%;"> </td>
                 <td style="padding-top: 50px;">2021 뮤지컬[미드나잇:액터뮤지션]</td>
                 <td>2021.12.01~2021.05.21<br>삼성동 백암아트홀</td>
            </tr>
            <tr id="rank-list">
            	 <td style="padding-top: 50px; text-align: center;"><strong>7위</strong></td>
                 <td><img alt="" src="../resources/images/콘서트000001.jpg" style="max-width: 100%;"> </td>
                 <td style="padding-top: 50px;">2021 뮤지컬[미드나잇:액터뮤지션]</td>
                 <td>2021.12.01~2021.05.21<br>삼성동 백암아트홀</td>
            </tr>
          </tbody>
        </table>
	</div>	
	<div class="row">
		<div class="col-12 mt-5">
			<%@ include file="../../common/footer.jsp" %>
		</div>
	</div>
</div>
</body>
</html>