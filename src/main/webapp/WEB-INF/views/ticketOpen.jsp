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
<title>NO</title>
<style type="text/css">
.title {
    font-size: 45px;
    text-align: center;
    color: #333;
    padding: 90px 0 60px 0;
    font-family: 'Noto Sans KR', 'NanumBarunGothic', '맑은 고딕', 'Malgun Gothic', sans-serif;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-12">
			<%@ include file="../common/navbar.jsp" %>
		</div>
	</div>
</div>
<div class="container">
	<div>
		<p class="title"><span>최근등록공연</span></p>
	</div>
	<div>
		<table class="table">
			<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="*">
					<col width="20%">
			</colgroup>
		    <thead>
			<tr>
		        <th></th>
		        <th></th>
		        <th></th>
		        <th></th>
		    </tr>
		    </thead>
		    <tbody>
				<tr>
			        <td><img alt="" src="${pageContext.request.contextPath}/resources/images/콘서트000001.jpg" style="max-width: 100%;"> </td>
			        <td style="padding-top: 40px;">제목</td>
			        <td style="padding-top: 40px;">시작날짜~종료날짜</td>
			        <td style="padding-top: 40px;">장소</td>
		      	</tr>
		      	<tr>
			        <td><img alt="" src="${pageContext.request.contextPath}/resources/images/콘서트000001.jpg" style="max-width: 100%;"> </td>
			        <td style="padding-top: 40px;">제목</td>
			        <td style="padding-top: 40px;">시작날짜~종료날짜</td>
			        <td style="padding-top: 40px;">장소</td>
		      	</tr>
		      	<tr>
			        <td><img alt="" src="${pageContext.request.contextPath}/resources/images/콘서트000001.jpg" style="max-width: 100%;"> </td>
			        <td style="padding-top: 40px;">제목</td>
			        <td style="padding-top: 40px;">시작날짜~종료날짜</td>
			        <td style="padding-top: 40px;">장소</td>
		      	</tr>
		      	<tr>
			        <td><img alt="" src="${pageContext.request.contextPath}/resources/images/콘서트000001.jpg" style="max-width: 100%;"> </td>
			        <td style="padding-top: 40px;">제목</td>
			        <td style="padding-top: 40px;">시작날짜~종료날짜</td>
			        <td style="padding-top: 40px;">장소</td>
		      	</tr>
		    </tbody>
		  </table>			
	</div>
	<div class="row">
		<div class="col-12">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
</div>
</body>
</html>