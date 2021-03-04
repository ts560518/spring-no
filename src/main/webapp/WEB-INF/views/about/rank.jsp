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
	<link rel="stylesheet" type="text/css"  href="/resources/css/Rank.css">
<title>NO24 티켓</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-12">
			<%@ include file="../../common/navbar.jsp" %>
		</div>
	</div>
</div>
<div class="container" id="ranking-app">
	<div class="row">
		<div class="title col-12">
			<h1>랭킹</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-12" style="font-size: 12px;">
		 <button @click="changeCategoryNo(0)" class="btn  text-dark py-3 px-3" :class="changeStyleCategoryButton(0)" style="width: 14%; border-color: #6c757d;">전체</button>
		<c:forEach var="category" items="${categories}">
			  <button @click="changeCategoryNo(${category.no})" class="btn text-dark py-3 px-3" :class="changeStyleCategoryButton(${category.no})"  style="width: 14%; border-color: #6c757d;">${category.name}</button>
		</c:forEach>
		</div>
	</div>
	
	<!-- 순위 카테고리 -->
	<div class="row mx-1" >
		<div class="col-12" id="box-btn-categorysort">
			<button @click="changeSortType('day')" class="btn" :class="changeStyleSortButton('day')"><span>일간</span></button>
			<span style="margin-right: 5px">|</span>
			<button @click="changeSortType('week')" class ="btn" :class="changeStyleSortButton('week')"><span>주간</span></button>
			<span style="margin-right: 5px">|</span>
			<button @click="changeSortType('month')" class="btn" :class="changeStyleSortButton('month')"><span>월간</span></button>
			<span style="margin-right: 5px">|</span>
			<button @click="changeSortType('year')" class="btn" :class="changeStyleSortButton('year')"><span>연간</span></button>
		</div>
	</div>
	
	<div v-if="showsTop3.length == 0">
		<div class="row">
			<div class="col-12 text-center my-5" >정보가 없습니다.</div>
		</div>
	</div>
	<div v-else>
		<div class="row mx-1 d-flex justify-content-center" id="show-list" style="background-color: #FFFACD;">
			<div v-for="show in showsTop3" class="col-4 mb-3 px-5 py-5">
				<a :href="`/genre/detail.do?no=`+show.SHOW_NO">
					<img class="img-thumbnail" style="background-color: #FFFACD;" :src="`../resources/images/NO24/` + show.POSTER_IMG + `.jpg`" alt="Card image">
				</a>
				<p id="rank-best">
					<span>{{show.RN}}위</span>
				</p>
				<div class="mt-2" style="text-align: center;">
					<div><strong class="mb-2">{{show.SHOW_NAME}}</strong></div>
					<div><small class="text-secondary">{{show.BEGIN_DATE}}~{{show.END_DATE}}</small></div>
					<div><small class="text-secondary">{{show.PLACE_NAME}}</small></div>
				</div>
			</div>		
		</div>
		
		<!-- 4위이상 -->
		<div class="row mx-1" style="border-bottom: solid;">
			<table class="table" >
	         <colgroup>
	               <col width="10%">
	               <col width="10%">
	               <col width="55%">
	               <col width="25%">
	         </colgroup>
	          <tbody>
	            <tr id="rank-list" v-for="show in shows">
	            	 <td style="padding-top: 60px; text-align: center;"><strong>{{show.RN}}위</strong></td>
	                 <td><img alt=""  :src="`../resources/images/NO24/` + show.POSTER_IMG + `.jpg`" style="max-width: 100%;"> </td>
	                 <td style="padding-top: 60px;">{{show.SHOW_NAME}}</td>
	                 <td>{{show.BEGIN_DATE}}~{{show.END_DATE}}<br>{{show.PLACE_NAME}}</td>
	            </tr>
	          </tbody>
	        </table>
		</div>	
	</div>
	
	<div class="row">
		<div class="col-12 mt-5">
			<%@ include file="../../common/footer.jsp" %>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script type="text/javascript">
new Vue({
	el:"#ranking-app",
	data: {
		selectedCategory: 0,  //기본값
		selectedSort:'week', //기본값
		showsTop3:[],
		shows:[]
	},
	methods: {
		setShows: function() {
			this.showsTop3.splice(0, this.showsTop3.length)
			this.shows.splice(0, this.shows.length)
			var self = this; //this는 data:를 말함.
			$.getJSON('/api/rank/ranking.do', {genre:self.selectedCategory, sort:self.selectedSort}, function(response) {
				console.log(response);
				if (response.length <= 3) { //순위가 3이하면 showsTop3만 실행
					self.showsTop3 = response
					
				} else {
					self.showsTop3 = response.splice(0,3)// splice는 배열 0부터 3개 뽑아오는거임
					self.shows = response
				}
			})
		},
		changeSortType:function(sort){
			this.selectedSort = sort
			this.setShows();
		},
	    changeCategoryNo:function(genre){
	    	this.selectedCategory = genre
	    	this.setShows();
	    },	
		changeStyleCategoryButton: function(categoryNo) {
			return {
				'btn-warning': this.selectedCategory == categoryNo,
				'btn-outline-warning': this.selectedCategory != categoryNo
			}
		},
		changeStyleSortButton: function(sort) {
			return {
				'btn-light': this.selectedSort == sort,
				'btn-outline-light': this.selectedSort != sort
			}
		}
	},
	created() {
		this.setShows();
	}
})
</script>
</body>
</html>