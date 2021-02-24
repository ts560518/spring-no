<%@ page pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Nav.css">
<div class="cp-top-wrap" style="border-bottom: 1px solid #ddd;">
	 <div class="consice" id="consice">
		<div class="consice-right">
			<c:if test="${empty LOGINED_USER }">
				<a href="/loginform.do">로그인</a>
				<a href="/form.do">회원가입</a>
			</c:if>
			<c:if test="${not empty LOGINED_USER }">
				<a href="/logout.do">로그아웃</a>
				<a href="/my/info.do">마이페이지</a>
			</c:if>
			<a href="/spring-shop/main.do">관리자페이지</a>
			<a href="#">고객센터</a>
		</div>
	 </div>
	 
	<header class="perform-top row" id="perform-top" style="height: 100px; background-color: white;">
		<div class="pf-left" style="margin-left: 15px;">
			<h1><a href="/home.do" class="pf-logo">
			<img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="" class="fixed" style="height: 30px; width: 150px;"></a></h1>
		</div>
		<div class="pf-center col-6">
			<div class="dropdown" style="display: inline-block;">
				<button type="button" class="btn btn-basic dropdown-toggle" style="color:black;" data-toggle="dropdown">
			    	콘서트
			  	</button>
				<div class="dropdown-menu">
			  		<a href="/genre/mainlist.do?catno=1" class="dropdown-item">콘서트</a>
			  		<a href="/genre/list.do?catno=1" class="dropdown-item">전체보기</a>
					<a href="/genre/list.do?catno=11" class="dropdown-item">국내뮤지션</a>
					<a href="/genre/list.do?catno=12" class="dropdown-item">해외뮤지션</a>
					<a href="/genre/list.do?catno=13" class="dropdown-item">페스티벌</a>
			  	</div>
			</div>
			<div class="dropdown" style="display: inline-block;">
				<button type="button" class="btn btn-basic dropdown-toggle" style="color:black;" data-toggle="dropdown">
			    	뮤지컬
			  	</button>
				<div class="dropdown-menu">
					<a href="/genre/mainlist.do?catno=2" class="dropdown-item">뮤지컬</a>
			  		<a href="/genre/list.do?catno=2" class="dropdown-item">전체보기</a>
					<a href="/genre/list.do?catno=21" class="dropdown-item">라이선스</a>
					<a href="/genre/list.do?catno=22" class="dropdown-item">오리지널</a>
					<a href="/genre/list.do?catno=23" class="dropdown-item">창작</a>
					<a href="/genre/list.do?catno=24" class="dropdown-item">넌버벌 퍼포먼스</a>
			  	</div>
			</div>
			<div class="dropdown" style="display: inline-block;">
				<button type="button" class="btn btn-basic dropdown-toggle" style="color:black;" data-toggle="dropdown">
			    	연극
			  	</button>
				<div class="dropdown-menu">
					<a href="/genre/mainlist.do?catno=3" class="dropdown-item">연극</a>
			  		<a href="/genre/list.do?catno=3" class="dropdown-item">전체보기</a>
					<a href="/genre/list.do?catno=31" class="dropdown-item">대학로</a>
					<a href="/genre/list.do?catno=32" class="dropdown-item">기타지역</a>
			  	</div>
			</div>
			<div class="dropdown" style="display: inline-block;">
				<button type="button" class="btn btn-basic dropdown-toggle" style="color:black;" data-toggle="dropdown">
			    	클래식
			  	</button>
				<div class="dropdown-menu">
					<a href="/genre/mainlist.do?catno=4" class="dropdown-item">클래식</a>
			  		<a href="/genre/list.do?catno=4" class="dropdown-item">전체보기</a>
					<a href="/genre/list.do?catno=41" class="dropdown-item">클래식</a>
					<a href="/genre/list.do?catno=42" class="dropdown-item">발레/무용</a>
					<a href="/genre/list.do?catno=43" class="dropdown-item">국악</a>
			  	</div>
			</div>
			<div class="dropdown" style="display: inline-block;">
				<button type="button" class="btn btn-basic dropdown-toggle" style="color:black;" data-toggle="dropdown">
			    	전시
			  	</button>
				<div class="dropdown-menu">
					<a href="/genre/mainlist.do?catno=5" class="dropdown-item">전시</a>
			  		<a href="/genre/list.do?catno=5" class="dropdown-item">전체보기</a>
					<a href="/genre/list.do?catno=51" class="dropdown-item">전시</a>
					<a href="/genre/list.do?catno=52" class="dropdown-item">체험/행사</a>
					<a href="/genre/list.do?catno=53" class="dropdown-item">워터파크/스파</a>
			  	</div>
			</div>
			<div class="dropdown" style="display: inline-block;">
				<button type="button" class="btn btn-basic dropdown-toggle" style="color:black;" data-toggle="dropdown">
			    	아동
			  	</button>
				<div class="dropdown-menu">
					<a href="/gerne/mainlist.do?catno=6" class="dropdown-item">아동</a>
			  		<a href="/genre/list.do?catno=6" class="dropdown-item">전체보기</a>
					<a href="/genre/list.do?catno=61" class="dropdown-item">뮤지컬</a>
					<a href="/genre/list.do?catno=62" class="dropdown-item">연극</a>
					<a href="/genre/list.do?catno=63" class="dropdown-item">기타</a>
			  	</div>
			</div>
		</div>
		


		<div class="pf-right">
	        <div class="pf-right-menu">
	            <a href="${pageContext.request.contextPath}/area.do">지역</a>
	            <a href="${pageContext.request.contextPath}/rank.do">랭킹</a>
	            <a href="#">이벤트</a>
	        </div>
		</div>
		<div style="position: absolute; top: 40px; right: 30px;">
			<form action="${pageContext.request.contextPath}/searchMain.do">
				<div class="search__container">
				    <input class="search__input" name="title" type="text" placeholder="Search">
				</div>
			</form>
		</div>
	</header>
</div>
