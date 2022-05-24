function valueCheck(){
	if(document.serveyinfo.age.value==""){
		alert("연령대를 입력해주세요");
		document.serveyinfo.age.focus();
		return;
	}
	if(document.serveyinfo.age.value%10!=0){
		alert("연령대를 잘못 입력하셨습니당");
		document.serveyinfo.age.focus();
		return;
	}
	if(document.serveyinfo.gender.value==""){
		alert("성별을 체크해주세요");
		document.serveyinfo.age.focus();
		return;
	}	
	
	
	document.serveyinfo.submit();
}