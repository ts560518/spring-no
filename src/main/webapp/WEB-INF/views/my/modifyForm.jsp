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
<link rel="stylesheet" href="../resources/css/commons.css">
<title>NO24</title>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	
	<!-- navbar -->
	<div class="row">
		<div class="col-12">
			<%@ include file="../../common/navbar.jsp" %>
		</div>
	</div>
	
	<div class="container d-flex justify-content-center">
		<div class="row">
			<div class="col-12">
				<h2 class="text-center" style="font-weight: bold; margin-bottom: 30px;">나의정보</h2>
				<div>
				<form id="user-form" method="post" action="register.do" enctype="multipart/form-data">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th class="text-center bg-light align-middle">이름</th>
								<td><input type="text" class="form-control form-control-sm" name="name" id="user-name" value="${user.name }" readonly /></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">아이디</th>
								<td>
									<div class="d-flex justify-content-start mb-1">
										<input type="text" class="form-control form-control-sm w-75" name="id" id="user-id" value="${user.id }" readonly />
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">비밀번호</th>
								<td><input type="password" class="form-control form-control-sm" name="password" id="user-pwd1"/></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">비밀번호<br />확인</th>
								<td class="align-middle"><input type="password" class="form-control form-control-sm" name="password2" id="user-pwd2"/></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">생년월일</th>
								<td><input type="date" class="form-control form-control-sm" name="birth" id="user-birth" value='<fmt:formatDate value="${user.birth }"/>' readonly /></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">전화번호</th>
								<td><input type="text" class="form-control form-control-sm" name="tel" id="user-tel" value="${user.tel }"/></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">이메일</th>
								<td>
									<div class="d-flex justify-content-start">
										<input type="text" class="form-control form-control-sm" name="email" id="user-email"/>
										<input type="button" class="btn btn-success btn-sm ml-1" style="font-size: 80%; height: 31px;" id="btn-send-random" value="이메일 인증"/>
									</div>
									<div class="justify-content-start mt-1" id="box-check-code">
										<input type="text" class="form-control form-control-sm w-50" id="field-check-code" style="display: inline-block;" placeholder="인증번호"/>
										<input type="button" class="btn btn-success btn-sm" style="margin-top: -3px; font-size: 80%; height: 31px;" id="btn-check-random" value="인증하기"/>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">주소</th>
								<td id="allAddress">
									<div class="d-flex justify-content-start mb-1">
										<input type="text" class="form-control form-control-sm w-25 mr-2 mt-1" name="postAddress" id="user-address-postcode" placeholder="우편번호"/>
										<input type="button" onclick="searchAddress()" class="btn btn-outline-dark btn-sm mt-1" style="height: 31px;" value="주소찾기"/>
									</div>
									<input type="text" class="form-control form-control-sm mb-1" name="address1" id="user-address" placeholder="주소"/>
									<div class="d-flex justify-content-start mb-1">
										<input type="text" class="form-control form-control-sm mr-1" name="address2" id="user-detail-address" placeholder="상세주소"/>
										<input type="text" class="form-control form-control-sm" name="address3" id="user-extra-address" placeholder="참고항목"/>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">이메일<br />수신여부</th>
								<td class="align-middle">
									<div class="form-check-inline">
										<label class="form-check-label">
											<input type="radio" class="form-check-input" name="emailReceivingConsent" id="consent-email" value="${user.emailReceivingConsent }" checked> 동의
										</label>
									</div>
									<div class="form-check-inline">
										<label class="form-check-label">
											<input type="radio" class="form-check-input" name="emailReceivingConsent" id="refusal-email" value="N"> 거부
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">SMS<br />수신여부</th>
								<td class="align-middle">
									<div class="form-check-inline">
										<label class="form-check-label">
											<input type="radio" class="form-check-input" name="smsReceivingConsent" id="consent-SMS" value="${'Y' eq user.smsReceivingConsent ? 'checked' : '' }" checked> 동의
										</label>
									</div>
									<div class="form-check-inline">
										<label class="form-check-label">
											<input type="radio" class="form-check-input" name="smsReceivingConsent" id="refusal-SMS" value="${'N' eq user.smsReceivingConsent ? 'checked' : '' }"> 거부
										</label>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="form-group col-12 text-right">
						<button type="submit" class="btn btn-outline-primary btn-lg">회원정보 수정</button>
					</div>
		   		</form>
			</div>
		</div>
	</div>
</div>
	
	<br>
	<br>
	
	<!-- footer -->
	<div class="row mt-5">
		<div class="col-12">
			<%@ include file="../../common/footer.jsp" %>
		</div>
	</div>

</body>
</html>