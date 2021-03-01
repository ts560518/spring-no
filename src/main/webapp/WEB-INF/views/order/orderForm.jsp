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
<style type="text/css">
		.btn-group-xs > .btn, .btn-xs {
		  padding: .45rem .4rem;
		  font-size: .875rem;
		  line-height: .5;
		  border-radius: .2rem;
		}
	</style>
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
				
		<div class="row mb-3">
			<div class="col-12">
				<div class="card">
					<div class="card-header font-weight-bold">공연정보</div>
					<div class="card-body">
						<div class="form-row">
							<div class="form-group col-3">
								<label>공연이름</label>
								<p>${showAndPutShow.showName }</p>
							</div>
							<div class="form-group col-5">
								<label style="display: block;">선택좌석</label>
      							<c:forEach var="seatPrice" items="${seatPrice }">
      								<p style="display: inline-block; margin-right: 5px;">좌석 : ${seatPrice.seatNo }</p>
      								<p style="display: inline-block; margin-right: 5px;">등급 : ${seatPrice.grade }</p>
      								<p style="display: inline-block; margin-right: 5px;">가격 : ${seatPrice.price }</p>
      								<p></p>
      							</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
				
				<!-- 사용자 정보 시작 -->
		<div class="row mb-3">
			<div class="col-12">
				<div class="card">
					<div class="card-header font-weight-bold">사용자정보</div>
					<div class="card-body">
						<div class="form-row">
							<div class="form-group col-3">
								<label>이름</label>
      							<input type="text" class="form-control" name="name" value="${LOGINED_USER.name }" disabled="disabled">
							</div>
							<div class="form-group col-3">
								<label>연락처</label>
      							<input type="text" class="form-control" name="tel" value="${LOGINED_USER.tel }" disabled="disabled">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 사용자 정보 끝 -->
		
		<!-- 결재정보 시작 -->
		<div class="row mt-3">
			<div class="col-12">
				<div class="card">
					<div class="card-header font-weight-bold">결제정보</div>
					<div class="card-body">
						<div class="form-row">
							<div class="form-group col-3">
								<label>사용가능 포인트 <button type="button" class="btn btn-primary btn-xs" id="btn-use-point" onclick="usePoint()">사용하기</button></label>
      							<input type="text" class="form-control" name="usablePoint" id="usable-point" value="${LOGINED_USER.availablePoint }" readonly>
							</div>
							<div class="form-group col-3">
								<label>사용가능 쿠폰 <button type="button" class="btn btn-primary btn-xs" id="btn-use-point" onclick="useCoupon()">사용하기</button></label>
      							<select name="coupon" class="form-control">
									<option value="" selected disabled>쿠폰 선택</option>
				                    <option value="카카오뱅크" > 카카오뱅크</option>
								</select>
							</div>
							<div class="form-group col-2">
								<label>총 구매금액</label>
      							<input type="text" class="form-control" name="orderPrice" id="orderPrice" value="${orderPrice }" readonly>
							</div>
							<div class="form-group col-2">
								<label>포인트 사용액</label>
      							<input type="text" class="form-control" name="usedPoint" id="used-point" value="0" readonly>
							</div>
							<div class="form-group col-2">
								<label>총 결재금액</label>
      							<input type="text" class="form-control" name="totalPayPrice" id="total-pay-price" value="" readonly>
      							<input type="hidden" name="totalSavedPoint" value="" />
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-6">
								<label>은행 및 카드사</label>
				      			<select name="bank" class="form-control">
									<option value="" selected disabled>카드사 및 은행 선택</option>
				                    <option value="카카오뱅크" > 카카오뱅크</option>
				                    <option value="롯데카드" > 롯데카드</option>
				                    <option value="신한카드" > 신한카드</option>
				                    <option value="국민카드" > 국민카드</option>
				                    <option value="삼성카드" > 삼성카드</option>
				                    <option value="씨티카드" > 씨티카드</option>
				                    <option value="BC카드" > BC카드/우리카드</option>
				                    <option value="국민은행" > 국민은행</option>
				                    <option value="신한은행" > 신한은행</option>
				                    <option value="하나은행" > 하나은행</option>
				                    <option value="기업은행" > 기업은행</option>
				                    <option value="농협" > 농협</option>
				                    <option value="수협" > 수협</option>
				                    <option value="새마을금고" > 새마을금고</option>
								</select>
							</div>
							<div class="form-group col-6">
								<label>카드번호 및 계좌번호</label>
					      		<input type="text" class="form-control" name="account">
							</div>
						</div>
						<div class="text-right">
							<button type="submit" class="btn btn-primary btn-lg">결제하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 결재정보 끝  -->
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