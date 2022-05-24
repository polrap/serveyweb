function servaycode(){
	var text =document.serveylistinfo.num.value;
	var serveycode =document.serveylistinfo.serveyCode.value;
	if(document.serveylistinfo.serveyCode.value==""){
		alert("장르를 선택해주세요");
		document.serveylistinfo.serveyCode.focus();
		return;
	}
	if(serveycode==text){
		let form=document.serveylistinfo;
		if(document.serveylistinfo.serveycodename.value==""){
			alert("기타 장르 입력란에 장르를 입력해주세요");
		document.serveylistinfo.serveycodename.focus();
		return;
		}
		form.action="serveyetc.jsp"
		
	}else if(serveycode<text){
		if(document.serveylistinfo.serveycodename.value !=""){
			alert("기타 장르 입력란에 장르를 제거해주세요");
		document.serveylistinfo.serveycodename.focus();
		return;
		}
	}
	if(document.serveylistinfo.songName.value==""){
		alert("선택하신 장르 중 가장 좋아하시는 음악의 제목을 입력해주세요");
		document.serveylistinfo.songName.focus();
		return;
	}
	if(document.serveylistinfo.serveyCode.value!=text){
		document.serveylistinfo.submit();
	}else{
		document.serveylistinfo.submit();
	}
	
	
}