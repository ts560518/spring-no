/**
	첫 로드시 
	ex) ajax -> data (랭킹데이터) -> view
 */
window.onload = function(){
   
		// ajax 엔진 객체 생성
		var xhr = new XMLHttpRequest();
		
		// ajax 엔진 객체의 readyState 상태가 변할 때
		xhr.onreadystatechange = function(res) {				// 콜백함수, 특정상황이 됐을 때 실행되는 함수
			//console.log(res);
		
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonText = xhr.responseText;	// 서버가 응답으로 보낸 json형식의 텍스트를 jsontext 변수에 저장
				var book = JSON.parse(jsonText);	// json형식의 텍스트를 자바스크립트의 객체나 배열로 변환함.
				
				console.log(book);88
			}
		}
		
		// ajax 엔진 객체 초기화
		xhr.open("GET", "checkUserId.do");	// onreadystatechange 이벤트 발생
		// 서버로 HTTP 요청 보내기
		xhr.send();	

}


/*

tti 상호작용 
ttv 보여지는거
*/