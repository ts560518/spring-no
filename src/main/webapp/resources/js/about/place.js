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
			html += '<a href="#">';
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
		$('#box-btn-sort button').removeClass('btn-outline-light');
		$('#box-btn-sort button:contains('+sort+')').addClass('btn-outline-light');
		sortType = sort;

	    showsList();
}


