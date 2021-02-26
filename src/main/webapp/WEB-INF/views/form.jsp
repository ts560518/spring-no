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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	
	<div class="row" style="margin-top: 50px;">
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
								<td>
									<div class="d-flex justify-content-start mb-1">
										<input type="text" class="form-control form-control-sm w-75" name="id" id="user-id" />
										<button onclick="checkMyId()" type="button" style="font-size: 80%; height: 31px;" class="btn btn-success btn-sm form-control ml-1 w-25">중복체크</button>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">비밀번호</th>
								<td><input type="password" class="form-control form-control-sm" name="password1" id="user-pwd1"/></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">비밀번호<br />확인</th>
								<td class="align-middle"><input type="password" class="form-control form-control-sm" name="password2" id="user-pwd2"/></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">생년월일</th>
								<td><input type="date" class="form-control form-control-sm" name="birth" id="user-birth" /></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">전화번호</th>
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
										<input type="text" class="form-control form-control-sm w-25 mr-2 mt-1" name="address" id="address-postcode" placeholder="우편번호"/>
										<input type="button" onclick="searchAddress()" class="btn btn-outline-dark btn-sm mt-1" style="height: 31px;" value="주소찾기"/>
									</div>
									<input type="text" class="form-control form-control-sm mb-1" name="address" id="address" placeholder="주소"/>
									<div class="d-flex justify-content-start mb-1">
										<input type="text" class="form-control form-control-sm mr-1" name="address" id="detailAddress" placeholder="상세주소"/>
										<input type="text" class="form-control form-control-sm" name="address" id="extraAddress" placeholder="참고항목"/>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">이메일<br />수신여부</th>
								<td class="align-middle">
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
								<th class="text-center bg-light align-middle">SMS<br />수신여부</th>
								<td class="align-middle">
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
						<button type="submit" class="btn btn-outline-primary btn-lg">회원가입</button>
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
	function searchAddress() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = '(' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("extraAddress").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("address-postcode").value = data.zonecode;
	            document.getElementById("address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("detailAddress").focus();
	        }
	    }).open();
	}

	var idRegExp = /^[A-Za-z0-9]{7,}$/;
	var pwdRegExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
	
   	$("user-form").submit(function() {
      	var userId = $("#user-id").val();
      	var userPwd = $("#user-pwd1").val();
      	
      	if (!idRegExp.test(userId)) {
			alert("아이디는 영어 대소문자, 숫자로 구성된 7글자 이상의 글자만 가능합니다.");
			return false;
		}
      	if (!pwdRegExp.test(userPwd)) {
			alert("비밀번호는 최소 8글자 이상, 최소 하나의 문자, 하나의 숫자를 포함해야 합니다.");
			return false;
		}
      	return true;
	})

	function checkMyId() {
		var myId = document.getElementById('user-id').value;
		//console.log("입력한 아이디", myId);
		
		// ajax 엔진 객체 생성
		var xhr = new XMLHttpRequest();
		
		if (myId == "") {
			alert("사용하실 아이디를 입력하세요.")
			return false;
		}
		
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
      	if (!document.querySelector("#user-birth").value) {
         	alert("생년월일은 필수입력값입니다.");
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
      	if (!document.querySelector("#address").value || !document.querySelector("#address-postcode").value
      			|| !document.querySelector("#detailAddress").value || !document.querySelector("#extraAddress").value) {
         	alert("주소는 필수입력값입니다.");
         	event.preventDefault();
         	return;
      	}
   	}
</script>
</body>
</html>