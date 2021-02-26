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
	<div class="row">
		<div class="col-12">
			<form action="">
				<table class="table">
					<colgroup>
						<col>
						<col>
						<col>
						<col>
					</colgroup>
					<thead>
						
					</thead>
					<tbody>
						
					</tbody>
				</table>
				<!-- 배송 정보 시작 -->
		<div class="row mb-3">
			<div class="col-12">
				<div class="card">
					<div class="card-header font-weight-bold">배송정보</div>
					<div class="card-body">
						<div class="form-row">
							<div class="form-group col-3">
								<label>받는사람 이름</label>
      							<input type="text" class="form-control" name="name" value="${LOGINED_USER.name }">
							</div>
							<div class="form-group col-3">
								<label>받는사람 연락처</label>
      							<input type="text" class="form-control" name="tel" value="${LOGINED_USER.tel }">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-9">
								<label>주소</label>
      							<input type="text" class="form-control" name="address"  value="${LOGINED_USER.name }">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-12">
								<label>택배사 직원에게 남길 메세지 <small class="text-secondary">(예: 부재시 경비실에 맡겨주세요)</small></label>
      							<textarea rows="3" class="form-control" name="message"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 배송정보 끝 -->
			</form>
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