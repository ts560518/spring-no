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
			<h2 class="text-center" style="font-weight: bold; margin-bottom: 30px;">NO24 회원가입</h2>
			<div>
				<form id="user-form" method="post" action="register.do" enctype="multipart/form-data">
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
										<button id="user-id-check" type="button" style="font-size: 80%; height: 31px;" class="btn btn-success btn-sm form-control ml-1 w-25">중복체크</button>
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
								<td><input type="date" class="form-control form-control-sm" name="birth" id="user-birth" /></td>
							</tr>
							<tr>
								<th class="text-center bg-light align-middle">전화번호</th>
								<td><input type="text" class="form-control form-control-sm" name="tel" id="user-tel" /></td>
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
											<input type="radio" class="form-check-input" name="emailReceivingConsent" id="consent-email" value="Y" checked> 동의
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
											<input type="radio" class="form-check-input" name="smsReceivingConsent" id="consent-SMS" value="Y" checked> 동의
										</label>
									</div>
									<div class="form-check-inline">
										<label class="form-check-label">
											<input type="radio" class="form-check-input" name="smsReceivingConsent" id="refusal-SMS" value="N"> 거부
										</label>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="form-group col-12 text-right">
						<button type="submit" class="btn btn-outline-primary btn-lg">회원가입</button>
					</div>
		   		</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var idRegExp = /^(?=.*[a-zA-Z0-9]).{4,}$/;
	var pwdRegExp = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/;

	$(function() {
		// 메일로 발송된 인증코드가 저장되는 변수
		var emailCheckRandomCode
		// 인증코드 입력 시도 횟수
		var checkedCount = 0
		// 이메일 인증이 완료된 경우 true가 저장된다.
		var isEmailChecked = false;
		// 아이디 중복확인이 완료된 경우 true가 저장된다.
		var isIdChecked = false;
		
		// 인증코드 입력부분은 처음에는 표시되지 않게 한다.
		$("#box-check-code").hide()
		
		// 입력된 이메일로 인증번호 발송하기
		// 이메일 인증 버튼을 클릭하면 실행된다.
		$("#btn-send-random").click(function() {
			// 이메일이 입력되어 있지않으면 경고창 표시
			if ($("#user-email").val() == '') {
				alert("이메일을 입력하세요.");
				return false
			} else {
				alert("해당 이메일로 인증번호가 발송되었습니다.");
				// 인증코드 입력하는 부분을 표시한다.
				$('#box-check-code').show()
			}
			
			// 이메일로 인증번호를 발송하는 컨트롤러를 실행시키고, 발송된 인증번호를 전달받는다.
			$.get('sendRandom.do', {email: $("#user-email").val()}, function(response) {
				// 전달받은 인증코드를 변수에 저장한다.
				emailCheckRandomCode = response;
				// 이메일 인증여부를 false로 설정한다.
				isEmailChecked = false;
				// 시도횟수를 초기화한다.
				checkedCount = 0
			})
		})
		
		// 인증코드를 입력하고 확인버튼을 클릭했을 때 실행된다.
		$("#btn-check-random").click(function() {
			// 입력된 인증코드를 읽어온다.
			var code = $('#field-check-code').val()
			
			if (code == '') {
				alert("인증코드를 입력하세요.")
				return false;
			}
			// 사용자가 입력한 코드값과 메일 발송시 제공받은 인증번호와 비교한다.
			if (code != emailCheckRandomCode) {
				// 시도횟수를 증가시킨다.
				checkedCount++;
				// 시도횟수를 초과한 경우
				if (checkedCount == 5) {
					alert("시도가능한 횟수를 초과하였습니다.");
					$('#box-check-code').hide()
					$('#field-check-code').val('')
				
					return false;
				}
				alert("인증코드가 일치하지 않습니다. (" + (5-checkedCount) +"회 남았습니다.)" )
				return false;
			}
			
			// 사용자가 입력한 코드값이 메일 발송시 제공받은 인증번호와 일치하는 경우
			alert("이메일 인증이 완료되었습니다");
			// 이메일 인증이 완료된 경우 true가 저장된다.
			isEmailChecked = true
			// 이메일 입력필드는 다른 이메일을 입력하지 못하도록 읽기전용으로 변경한다.
			$("#user-email").prop('readonly', true)
			// 이메일 입력과 관련된 부분을 전부 보이지 않게 한다.
			$('#box-check-code').hide()
			$('#btn-send-random').hide()
		})
		
		$("#user-id").focus(function(){
			isIdChecked = false
		})
		
		$("#user-id-check").click(function() {
			var userId = $("#user-id").val();
			
			if (!userId) {
				alert("사용하실 아이디를 입력하세요.")
				return false;
			}
			
			if (!idRegExp.test(userId)) {
				alert("아이디는 영어 대소문자, 숫자로 구성된 4글자 이상의 글자만 가능합니다.");
				return false;
			}
			
			if (userId.search(/\s/) != -1) {
				alert("아이디는 공백없이 작성해주시기 바랍니다.");
				return false;
			}
			
			// checkUserId.do?userId=값
			$.getJSON("/api/member/checkUserId.do", {userId:userId}, function(result) {
				var isExist = result.exist;
				
				if (isExist) {
					alert("이미 사용중인 아이디입니다.");
					$("#user-id").val("")
					isIdChecked = false
				} else {
					alert("사용가능한 아이디입니다.");
					isIdChecked = true
				}
			})
		})
		
		// 최종적으로 회원가입버튼을 클릭한 경우
		// 폼입력값이 유효한지 체크하고, 이메일 인증을 수행했는지 체크한다.
		$("#user-form").submit(function() {
	      	var userId = $("#user-id").val();
	      	var password = $("#user-pwd1").val();
	      	var confirmPassword = $("#user-pwd2").val();
	      	
	      	if ($("#user-name").val() == "") {
	         	alert("이름은 필수입력값입니다.");
	         	return false;
	      	}
	      	if ($("#user-id").val() == "") {
	         	alert("아이디는 필수입력값입니다.");
	         	return false;
	      	}
	      	if (!password) {
	         	alert("비밀번호는 필수입력값입니다.");
	         	return false;
	      	}
	      	if (!confirmPassword) {
	         	alert("비밀번호 확인은 필수입력값입니다.");
	         	return false;
	      	}
	      	if ($("#user-birth").val() == "") {
	         	alert("생년월일은 필수입력값입니다.");
	         	return false;
	      	}
	      	if ($("#user-tel").val() == "") {
	         	alert("전화번호는 필수입력값입니다.");
	         	return false;
	      	}
	      	if ($("#user-email").val() == "") {
	         	alert("이메일은 필수입력값입니다.");
	         	return false;
	      	}
	      	if ($("#user-address").val() == "" || $("#user-address-postcode").val() == ""
	      			|| $("#user-detail-address").val() == "") {
	         	alert("주소는 필수입력값입니다.");
	         	return false;
	      	}
	      	if (userId.search(/\s/) != -1) {
				alert("아이디는 공백없이 작성해주시기 바랍니다.");
				return false;
			}
	      	if (!isIdChecked) {
				alert("아이디 중복확인을 해주시기 바랍니다.")
				return false;
			}
	      	if (!pwdRegExp.test(password)) {
				alert("비밀번호는 영어 대소문자, 숫자로 구성된 8글자 이상의 글자만 가능합니다.");
				return false;
			}
	      	if (password != confirmPassword) {
	         	alert("비밀번호가 일치하지 않습니다.");
	         	return false;
	      	}
	      	if (password.search(/\s/) != -1) {
				alert("비밀번호는 공백없이 작성해주시기 바랍니다.");
				return false;
			}
	      	if (!isEmailChecked) {
				alert("이메일 인증이 완료되지 않았습니다.");
				return false;
			}
	      	
	      	return true;
		});
	})

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
	                document.getElementById("user-extra-address").value = extraAddr;
	            
	            } else {
	                document.getElementById("user-extra-address").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("user-address-postcode").value = data.zonecode;
	            document.getElementById("user-address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("user-detail-address").focus();
	        }
	    }).open();
	}
</script>
</body>
</html>