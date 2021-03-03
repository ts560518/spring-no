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
<link rel="stylesheet" href="../../resources/css/commons.css">
<title>No24</title>
<style type="text/css">
.lazyload {
    width: 220px;
    height: 308px;
}
.cont-tit {
    font-size: 35px;
    color: #333;
    text-align: center;
    font-weight: 700;
    height: 80px;
    margin-top: 50px;
}
.slide-wrapper {
    display: block;
    text-align: center;
    font-size: 0px;
}
.list-more {
    display: block;
    width: 220px;
    height: 48px;
    line-height: 48px;
    text-align: center;
    border: 1px solid #ddd;
    font-size: 15px;
    color: #000;
    background: #fff;
    margin: 39px auto 0 auto;
    position: relative;
    z-index: 5;
    transition: all 0.3s;
}
.ticket-date {
    font-size: 15px;
    color: #ec7d2c;
    padding: 15px 0 5px 0;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.ticket-tit {
    font-size: 15px;
    color: #000;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<%@ include file="../../common/navbar.jsp" %>
			</div>
		</div>
	</div>
	
	<div class="container">
		<form id="search-form" method="get" action="list.do">
		<h2 class="w3-border-bottom w3-border-light-grey w3-padding-16"><i class='far fa-file-alt' style="color: orange; margin-right: 10px;"></i>공지사항</h2>
			<div class="slide-wrapper row">
				<c:forEach var="showList" items="${showList }">
					<div class="col-3" style="display: inline-block; text-align: center;">
						<a href="/genre/detail.do?no=${showList.no }">
							<div class="ticket-txt">
							<img src="${pageContext.request.contextPath}/resources/images/NO24/${showList.posterImg }.jpg" alt="" class="lazyload">
								<p class="ticket-date"><fmt:formatDate value="${showList.beginDate }" /></p>
								<p class="ticket-tit">${showList.name }</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
  		<div class="row mt-5 mb-5">
  			<div class="col-12 d-flex justify-content-center">
  				<input type="hidden" name="sort" value="${empty param.sort ? 'date' : param.sort }" />
	    		<input type="hidden" name="pageNo" value="${page.pageNo }" />
				<select name="opt" style="margin-right: 10px;">
					<option value="title" ${param.opt eq 'title' ? 'selected' : '' }> 제목</option>
             		<option value="content" ${param.opt eq 'content' ? 'selected' : '' }> 내용</option>
				</select>
				<input type="text" placeholder="검색어를 입력하세요" name="keyword" id="keyword-field" value="${param.keyword }">
				<button type="button" class="btn" id="btn-search">
					<i class="fa fa-search" style="font-size:24px"></i>
				</button>
  			</div>
		</div>
        <div class="mb-1">
        	<button id="btn-sort-date" class="btn ${empty param.sort or param.sort eq 'date' ? 'btn-outline-primary' : 'btn'}">최근등록순</button>
            <button id="btn-sort-views" class="btn ${param.sort eq 'views' ? 'btn-outline-primary' : 'btn'}">조회순</button>
        </div>
        
	  	<table class="table">
	  		<thead class="bg-light">
	  			<tr>
		        	<th>번호</th>
		        	<th>타입</th>
		        	<th>제목</th>
		        	<th>등록일</th>
		        	<th>조회수</th>
		      	</tr>
		    </thead>
		    <tbody>
		    <c:forEach var="notice" items="${notices }">
		    	<tr>
		        	<td>${notice.no }</td>
		        	<td><button type="button" class="btn btn-outline-danger btn-sm">${notice.type }</button></td>
		        	<td><a href="detail.do?pageNo=${page.pageNo }&noticeNo=${notice.no }" class="text-primary" id="notice-title">${notice.title }</a></td>
		        	<td><fmt:formatDate value="${notice.createdDate }"/></td>
		        	<td>${notice.views }</td>
		      	</tr>
		    </c:forEach>
		    </tbody>
		</table>
  
  		<br>
		<br>
		<div class="row mt-5">
			<div class="col-12">
				<ul class="pagination justify-content-center">
			  		<li class="page-item ${page.pageNo gt 1 ? '' : 'disabled' }">
			  			<a class="page-link w3-hover-blue" data-page-no=${page.pageNo - 1 } href="list.do?status=${status }&sort=${param.date }&pageNo=${page.pageNo - 1 }">&laquo;</a>
			  		</li>
			  		<c:forEach var="num" begin="${page.beginPage }" end="${page.endPage }">
				  		<li class="page-item ${num eq page.pageNo ? 'active' : '' }">
				  			<a class="page-link w3-hover-blue" data-page-no=${num } href="list.do?status=${status }&sort=${param.date }&pageNo=${num }">${num }</a>
				  		</li>
			  		</c:forEach>
			  		<li class="page-item ${page.pageNo lt page.totalPages ? '' : 'disabled' }">
			  			<a class="page-link w3-hover-blue" data-page-no=${page.pageNo + 1 } href="list.do?status=${status }&sort=${param.date }&pageNo=${page.pageNo + 1 }">&raquo;</a>
			  		</li>
				</ul>
			</div>
		</div>
		</form>
	</div>
	<!-- footer -->
	<div class="row">
		<div class="col-12">
			<%@ include file="../../common/footer.jsp" %>
		</div>
	</div>

<script type="text/javascript">

	// 체크박스 전체 선택/해제
	$("#check-all").click(function() {
		if ($("#check-all").prop("checked")) {
			$("input[name='noticeNo']").prop("checked", true);
		} else {
			$("input[name='noticeNo']").prop("checked", false);
		}
	});

	// 체크된 항목 삭제
	$("#delete-checked").click(function() {
		if ($(":checkbox[name='noticeNo']:checked").length == 0) {
			alert("체크된 항목이 없습니다.");
			return false;
		}
		$("#search-form").attr("action", 'delete.do').submit();
	});
	
	// 최근등록순, 조회순 정렬
   	$('#btn-sort-date').click(function() {
      	$("[name=sort]").val("date");
      	$("#search-form").submit();
   	});
   	
   	$('#btn-sort-views').click(function() {
      	$("[name=sort]").val("views");
      	$("#search-form").submit();
   	});
   	
   	// 검색
   	$("#btn-search").click(function() {
      	if ($('#keyword-field').val() == '') {
        	alert("키워드를 입력하세요.");
        	return false;
        }
      	$("[name=sort]").val("date");
      	$("[name=pageNo]").val("1");
      
      	$("#search-form").submit();
   	});
   	
   	// 페이지 변경
	$('.pagination a').click(function() {
		var pageNo = $(this).data('page-no');
		$("[name=pageNo]").val(pageNo);
		
		$("#search-form").submit();
		return false;
   	});
	
</script>	
</body>
</html>