function showsList(localName){
	$("#show-box").empty();
	console.log(localName);
	$.getJSON("/api/place/showList.do", {name:localName}, function(result) {
		var cnt = result.size; //result의 변수 size를 받음.
		var showList = result.shows;
		
		console.log(localName);
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
