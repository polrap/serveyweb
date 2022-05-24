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
		document.serveyinfo.gender.focus();
		return;
	}	
	
	
	document.serveyinfo.submit();
}
function gendercheck(){
	if(document.gen.gender.value==""){
		alert("성별을 체크해주세요");
		return;
	}
	document.gen.submit();
}
function place(){
	document.serveyinfo.age.placeholder="";
}
function placeOver(){
	document.serveyinfo.age.placeholder="연령대를 넣어주세요";
}