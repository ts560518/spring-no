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
		<div class="col-6 offset-3 mt-5" style="margin-bottom: -100px;">
			<div class="alert alert-danger" style="text-align: center; padding-top: 20px;">
				<strong>오류</strong> 이미 사용중인 아이디입니다.
			</div>
		</div>
	</div>
   
	<div class="row" style="margin-top: 120px;">
		<div class="col-8 offset-2" >
			<h2 class="text-center" style="font-weight: bold; margin-bottom: 30px;">회원가입</h2>
			<div>
				<form id="user-form" method="post" action="register.do" enctype="multipart/form-data" onsubmit="checkUserForm(event)">
					<table class="table table-bordered">
						<colgroup>
							<col width="25%">
							<col width="75%" style="background-color: white;">
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center bg-light align-middle">이름</th>
								<td><input type="text" class="form-control form-control-sm" name="name" id="user-name" /></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">아이디</th>
								<td><input type="text" class="form-control form-control-sm" name="id" id="user-id" /></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">비밀번호</th>
								<td><input type="password" class="form-control form-control-sm" name="password1" id="user-pwd1" aria-describedby="pwd1" /></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">비밀번호 확인</th>
								<td><input type="password" class="form-control form-control-sm" name="password2" id="user-pwd2" aria-describedby="pwd2" /></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">생년월일</th>
								<td><input type="date" class="form-control form-control-sm" name="birth" id="user-birth" /></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">휴대전화</th>
								<td><input type="text" class="form-control form-control-sm" name="tel" id="user-tel" /></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">이메일</th>
								<td><input type="text" class="form-control form-control-sm" name="email" id="user-email" /></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">주소</th>
								<td>
									<div class="d-flex justify-content-start mb-1">
										<input type="text" class="form-control form-control-sm w-25 mr-2 mt-1" name="address" id="user-address" />
										<button class="btn btn-outline-dark btn-sm mt-1" style="height: 31px;">주소찾기</button>
									</div>
									<input type="text" class="form-control form-control-sm mb-1" name="address" />
									<input type="text" class="form-control form-control-sm mb-1" name="address" />
								</td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">이메일 수신여부</th>
								<td>
									<div class="form-check-inline">
										<label class="form-check-label">
											<input type="radio" class="form-check-input" name="receiveEmail" id="consent-email" value="Y" checked> 동의
										</label>
									</div>
									<div class="form-check-inline">
										<label class="form-check-label">
											<input type="radio" class="form-check-input" name="receiveEmail" id="refusal-email" value="N"> 거부
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">SMS 수신여부</th>
								<td>
									<div class="form-check-inline">
										<label class="form-check-label">
											<input type="radio" class="form-check-input" name="receiveSMS" id="consent-SMS" value="Y" checked> 동의
										</label>
									</div>
									<div class="form-check-inline">
										<label class="form-check-label">
											<input type="radio" class="form-check-input" name="receiveSMS" id="refusal-SMS" value="N"> 거부
										</label>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="form-group col-12 text-right">
						<input type="submit" class="btn btn-outline-primary btn-lg" value="회원가입" />
					</div>
					<!-- <div class="card-body">
						<div class="form-group mt-3">
							<h2 style="font-weight: bold;">회원가입</h2>
						</div>
						<div class="form-row">
							<div class="form-group col-12">
								<label style="font-size: 14px;">이름</label>
								<input type="text" class="form-control form-control-sm" name="name" id="user-name"/>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-9">
								<label style="font-size: 14px;">아이디</label>
								<input type="text" class="form-control form-control-sm" name="id" id="user-id"/>
							</div>
							<div class="form-group col-3">
								<label>&nbsp;</label>
								<button onclick="checkMyId()" type="button" style="font-size: 80%;" class="btn btn-success btn-sm form-control" >아이디 중복체크</button>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-12">
								<label style="font-size: 14px;">비밀번호</label>
								<input type="password" class="form-control form-control-sm" name="password" id="user-password" />
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-12">
								<label style="font-size: 14px;">비밀번호 확인</label>
								<input type="password" class="form-control form-control-sm" name="password2" id="user-password2"/>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-12">
								<label style="font-size: 14px;">전화번호</label>
								<input type="text" class="form-control form-control-sm" name="tel" id="user-tel"/>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-12">
								<label style="font-size: 14px;">이메일</label>
								<input type="text" class="form-control form-control-sm" name="email" id="user-email" />
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-8">
								<label style="font-size: 14px;">생년월일</label>
								<input type="date" class="form-control form-control-sm" name="birth" id="user-birth" />
							</div>
							<div class="form-group col-4">
								<a href="home.do" class="btn btn-outline-secondary btn-sm">취소</a>
								<input type="submit" class="btn btn-outline-primary btn-sm" value="회원가입" />
							</div>
						</div>
					</div> -->
		   		</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function checkMyId() {
		var myId = document.getElementById('user-id').value;
		console.log("입력한 아이디", myId);
		
		// ajax 엔진 객체 생성
		var xhr = new XMLHttpRequest();
		
		// ajax 엔진 객체의 readyState 상태가 변할 때
		xhr.onreadystatechange = function() {				// 콜백함수, 특정상황이 됐을 때 실행되는 함수
			if (xhr.readyState == 4) {						//		      특정상황 = 특정 이벤트 발생시
				alert(xhr.responseText);					//		      개발자가 임의의 시간에 실행하는 함수가 아니다.
			}												//		      자바스크립트 엔진이 자발적으로 실행하는 함수다.
		}
		
		// ajax 엔진 객체 초기화
		xhr.open("GET", "checkUserId.do?userId=" + myId);	// onreadystatechange 이벤트 발생
		// 서버로 HTTP 요청 보내기
		xhr.send();											// onreadystatechange 이벤트 발생
		
		//var msg = xhr.responseText;
		//console.log("응답메세지: " + msg);
	}

   	function checkUserForm(event) {
      	var form = document.querySelector("#user-form");
      
      	if (!document.querySelector("#user-name").value) {
         	alert("이름은 필수입력값입니다.");
         	event.preventDefault();
         	return;
      	}
      	if (!document.querySelector("#user-id").value) {
         	alert("아이디는 필수입력값입니다.");
         	event.preventDefault();
         	return;
      	}
      	var password = document.querySelector("#user-pwd1").value;
      	var confirmPassword = document.querySelector("#user-pwd2").value;
      	if (!password) {
         	alert("비밀번호는 필수입력값입니다.");
         	event.preventDefault();
         	return;
      	}
      	if (!confirmPassword) {
         	alert("비밀번호는 필수입력값입니다.");
         	event.preventDefault();
         	return;
      	}
      	if (password != confirmPassword) {
         	alert("비밀번호가 일치하지 않습니다.");
         	event.preventDefault();
         	return;
      
      	}
      	if (!document.querySelector("#user-tel").value) {
         	alert("전화번호는 필수입력값입니다.");
         	event.preventDefault();
         	return;
      	}
      	if (!document.querySelector("#user-email").value) {
         	alert("이메일은 필수입력값입니다.");
         	event.preventDefault();
         	return;
      	}
   	}
</script>
</body>
</html>