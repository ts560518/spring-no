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
	<div class="row list-title">
	<input type="hidden" id="catno" value="${catno }">
	    <p class="li-sec-tit" style="margin: 0 auto;">
			<span class="li-sec-tit1">${category.categoryName }</span>
			<span>></span>
			<span class="li-sec-tit2">${category.categoryDetailName }</span>
	    </p>
	</div>
	<div class="row mx-1" id="box-btn-sort">
		<div class="col-12" style= "text-align:right; padding: 20px 0 10px 0; border-bottom: solid gray;">
			<button onclick="changeSortType('신상품')" class="btn btn-outline-light" style="color: black;"><span>신상품순</span></button>
			<span>|</span>
			<button onclick="changeSortType('종료임박')" class="btn" style="color: black;"><span>종료임박순</span></button>
			<span>|</span>
			<button onclick="changeSortType('상품명')" class="btn" style="color: black;"><span>상품명순</span></button>
		</div>
	</div>
	
	<div class="row my-3" id="show-box">
	
	<%-- <div class="row"  style="text-align: center; padding-top: 20px;">
		<c:forEach var="show" items="${show }">
		<div class="col-3">
			<a href="/genre/detail.do?no=${show.no }">
				<img src="${pageContext.request.contextPath}/resources/images/NO24/${show.posterImg }.jpg">
				<small class="text-secondary">${show.name }</small><br>
				<small class="text-secondary"><fmt:formatDate value="${show.beginDate }" /></small><br>
				<small class="text-secondary">${show.placeName }</small>
			</a>
		</div>
		</c:forEach>
	</div> --%>
	<div class="row">
		<div class="col-12 mt-5">
			<%@ include file="../../common/footer.jsp" %>
		</div>
	</div>
</div>
<script type="text/javascript">
var sortType = '신상품'
var catno = document.querySelector("#catno").value;
function showsList(){
	$("#show-box").empty();
	$.getJSON("/api/genre/categoryList.do", {sort:sortType, catno:catno}, function(result) {
		var showList = result.shows;
		
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

function changeSortType(sort){
	$('#box-btn-sort button').removeClass('btn-outline-light');
	$('#box-btn-sort button:contains('+sort+')').addClass('btn-outline-light');
	sortType = sort;

    showsList();
}

</script>
</body>
</html>