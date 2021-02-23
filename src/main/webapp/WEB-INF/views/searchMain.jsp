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
<title>Insert title here</title>
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
	<div class="row">
		<div class="col-12" style="text-align: center; padding-top: 40px; padding-bottom: 30px;background: #f6f6f6; ">
			<p style="font-size: 30px;"><span style="color: #ec7d2c;">'${title}'</span>에 대한 검색 결과입니다.</p>
			
		</div>
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