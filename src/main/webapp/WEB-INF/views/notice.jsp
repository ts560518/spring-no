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
<title>NO24</title>
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
			<p class="title"><span>공지사항</span></p>
			<div>
				<table class="table">
					<colgroup>
							<col width="20%">
							<col width="*">
							<col width="30%">
					</colgroup>
				    <thead>
					<tr>
				        <th>구분</th>
				        <th>제목</th>
				        <th>공지등록일</th>
				    </tr>
				    </thead>
				    <tbody>
						<tr>
					        <td>John</td>
					        <td>Doe</td>
					        <td>john@example.com</td>
				      	</tr>
				    </tbody>
				  </table>			
			</div>
		</div>
		
		<div class="row">
		<div class="col-12">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
	</div>
</body>
</html>