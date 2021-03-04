<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/Place.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
<title>NO24 티켓</title>
<style type="text/css">
.title{
	font-size: 45px;
    text-align: center;
    color: #333;
    padding: 50px 0 50px 0;
    font-family: '맑은 고딕';
}
</style>
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
			<h1>지역별 공연</h1>
		</div>
	</div>
	<!-- 지역별 카테고리 -->
	<div class="row" id="box-btn-localname">
		<div class="col-12" style="font-size: 12px;">
			<button onclick="changeLocalName('전체')" class="btn btn-warning  text-dark py-3 px-3" style="width: 16.4%; border-color: #6c757d;">전체</button>
			<c:forEach var="name" items="${names}">
				<button onclick="changeLocalName('${name}')" class="btn btn-outline-warning text-dark py-3 px-3" style="width: 16.4%; border-color: #6c757d;">${name}</button>
			</c:forEach>
	   </div>
	 </div>
	<!-- 공연수 -->
	<div class="row mt-5 mx-1"  >
		<div class="col-12 py-3" style="background-color:#FFFACD; text-align: center; font-size: 20px; color: #333;">
			현재 예매 가능한 공연은 총 <span id="show-count" style="color: #FF6600; font-size: 22px;"></span>개 입니다.
		</div>
	</div>
	<!--목차 -->
	<div class="row mx-1" id="box-btn-sort">
		<div class="col-12" style= "text-align:right; padding: 20px 0 10px 0; border-bottom: solid gray;">
			<button onclick="changeSortType('신상품')" class="btn btn-light"><span>신상품순</span></button>
			<span>|</span>
			<button onclick="changeSortType('종료임박')" class="btn btn btn-outline-light"><span>종료임박순</span></button>
			<span>|</span>
			<button onclick="changeSortType('상품명')" class="btn btn btn btn-outline-light"><span>상품명순</span></button>
		</div>
	</div>
	<!-- 데이터뿌리기 -->
	<div class="row my-3" id="show-box">
	</div>
	<div class="row">
		<div class="col-12 mt-5">
			<%@ include file="../../common/footer.jsp" %>
		</div>
	</div>
</div>
<script type="text/javascript">
var localName = '전체'
var sortType = '신상품'

function showsList(){
	$("#show-box").empty();
	// $.getJSON(요청URL, {요청파라미터명:값, 요청파라미터명:값}, function(컨트롤러가반환하는 결과값) { 수행문 })
	$.getJSON("/api/place/showList.do", {name:localName, sort:sortType}, function(result) {
		var cnt = result.size; //result의 변수 size를 받음.
		var showList = result.shows;
		
		$("#show-count").text(cnt);
		for(var i=0; i<showList.length; i++) {
			
			var show = showList[i];
			var html = '<div  class="col-3 mb-5">';
			html += '<a href="/genre/detail.do?no='+show.no+'">';
			html += '<img style="max-width: 100%; width: 100%;" src="../resources/images/NO24/' +show.posterImg+ '.jpg" alt="Card image">';
			html += '</a>';
			html += '<div class="mt-2" style="text-align: center;">';
			html += '<div><strong class="mb-2">'+show.name+'</strong></div>';
			html += '<div><small class="text-secondary">'+ show.beginDate +'~'+show.endDate+ '</small></div>'
			html += '<div><small class="text-secondary">'+ show.placeName + '</small></div>'
			
		    $("#show-box").append(html)	
		}	
	})
}

showsList();

function changeLocalName(name){
		$('#box-btn-localname button').removeClass('btn-warning').addClass("btn-outline-warning")
		$('#box-btn-localname button:contains('+name+')').removeClass("btn-outline-warning").addClass("btn-warning");
		localName = name;
	
	showsList();
}

function changeSortType(sort){
		$('#box-btn-sort button').removeClass('btn-light').addClass("btn-outline-light");
		$('#box-btn-sort button:contains('+sort+')').removeClass("btn-outline-light").addClass('btn-light');
		sortType = sort;

	showsList();
}
</script>
</body>
</html>