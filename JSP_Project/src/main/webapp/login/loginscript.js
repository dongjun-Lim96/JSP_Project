/**
 * 
 */

var use;
var isCheck = false;
 
function writeSave(){ // 가입클릭
	//alert(1);
	if($('input[name=id]').val() == ""){
		alert("아이디를 입력해주세요.");
		$('input[name=id]').focus();
		return false;
	}
	if(use == "missing"){
		alert('아이디를 입력하세요');
		$("input[name=id]").focus();
		return false;
	}
	else if(use == "impossible"){
		alert('이미 등록된 아이디입니다');
		$('input[name=id]').select();
		return false;
		
	}else if(isCheck == false){
		alert('중복체크 먼저 하세요');
		return false;
	}
	
	if($('input[name=password]').val() == ""){
		alert("비밀번호를 입력해주세요.");
		$('input[name=password]').focus();
		return false;
	}
	
	if(pwuse=='pwerror'){
		alert("비밀번호 형식이 잘못되었습니다.");
		return false;
	}
	if(emailuse=='emailerror'){
		alert("이메일 형식이 잘못되었습니다.");
		return false;
	}
	if(birthuse=='birtherror'){
		alert("생년월일이 잘못되었습니다.");
		return false;
	}
	if(teluse=='telerror'){
		alert("번호가 잘못되었습니다.");
		return false;
	}
	
	if($('input[name=password]').val() == ""){
		alert("비밀번호를 입력해주세요.");
		$('input[name=password]').focus();
		return false;
	}
	
	if(pwsame == "nosame"){
		alert("비번번호가 불일치");
		return false;
	}
	
	if($('input[name=name]').val() == ""){
		alert("이름을 입력해주세요.");
		$('input[name=name]').focus();
		return false;
	} 
	
	if($('input[name=email]').val() == ""){
		alert("이메일을 입력해주세요.");
		$('input[name=email]').focus();
		return false;
	} 
	
	if($('input[name=birth]').val() == ""){
		alert("생년월일을 입력해주세요.");
		$('input[name=birth]').focus();
		return false;
	} 
	
	if($('input[name=tel]').val() == ""){
		alert("휴대폰 번호를 입력해주세요.");
		$('input[name=tel]').focus();
		return false;
	} 
}//writeSave()

function duplicate(){ // 중복체크 클릭
	isCheck = true;
    $.ajax({
		url : "id_check_proc.jsp",
		data : ({
			userid : $('input[name=id]').val()
		}),
		success : function(data){
			//alert(data);
			if($('input[name=id]').val()==""){
				$("#idmessage").html('<font color=red>아이디를 입력하세요<font>').show();
				$('input[name=id]').focus();
				use = "missing";
			}
			else if($.trim(data) == "NO"){
				$("#idmessage").html('<font color=red>이미 등록된 아이디입니다<font>').show();
				$('input[name=id]').select();
				use = "impossible";
			}
			else if($.trim(data) == "YES"){
				$("#idmessage").html('<font color=blue>사용가능한 아이디입니다<font>').show();
				use = "possible";
			}
		}
	});//ajax
}//duplicate


function keyd(){
	//alert(key);
	$('#idmessage').css('display','none');
	use = "";
	isCheck = false;
}


function pwcheck(){
	pw = $('input[name=password]').val();
	var reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/i;
	
	if(!reg.test(pw)){
		//alert("비밀번호 형식이 틀렸습니다.");
		$("#pwmessage").html('<font color=red>비밀번호 형식이 틀렸습니다.<font>');
		pwuse = "pwerror";
		return;
	}else{
		$("#pwmessage").html('<font color=blue>가능한 비밀번호<font>');
	}
	
	var chk_num = pw.search(/[0-9]/);
	var chk_eng = pw.search(/[a-z]/i);
	
	
	if(chk_num < 0 || chk_eng < 0){
		//alert('영문과 숫자조합으로 완성하세요')
		pwuse = "pwerror";
	}else{
		pwuse = "";
	}
}

function pw2check() {
	if($('input[name=password]').val() == $('input[name=password2]').val()){
		$('#pwmessage2').html('<font color=blue>비밀번호 일치<font>');
		pwsame = "same";
	}else{
		$('#pwmessage2').html('<font color=red>비밀번호 불일치<font>');
		pwsame = "nosame";
	}
}

function emailcheck(){
  email = $('input[name=email]').val();
  var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  // 검증에 사용할 정규식 변수 regExp에 저장

  if (email.match(regExp) != null) {
    $('#emailmsg').html('<font color=blue>사용 가능한 이메일.<font>');
    emailuse = "";
  }
  else {
   	$('#emailmsg').html('<font color=red>이메일 형식이 잘못되었습니다.<font>');
   	emailuse = "emailerror";
  }
}

function birthcheck(){
  birth = $('input[name=birth]').val();
  var regExp = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;
  // 검증에 사용할 정규식 변수 regExp에 저장

  if (birth.match(regExp) != null) {
    $('#birthmsg').html('<font color=blue>성공<font>');
    birthuse = "";
  }
  else {
   	$('#birthmsg').html('<font color=red>생년월일이 잘못되었습니다.<font>');
   	birthuse = "birtherror";
  }
}

function telcheck(){
  tel = $('input[name=tel]').val();
  //var regExp = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
  var regExp = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
  // 검증에 사용할 정규식 변수 regExp에 저장

  if (tel.match(regExp) != null) {
    $('#telmsg').html('<font color=blue>성공<font>');
    teluse = "";
  }
  else {
   	$('#telmsg').html('<font color=red>번호가 잘못되었습니다.<font>');
   	teluse = "telerror";
  }
}