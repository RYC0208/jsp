// id를 수정후 다시 고쳤는지 확인
function inputIdChk() {
	frm.idBtnCheck.value="idUncheck";
}

function idCheck(id) {
	frm.idBtnCheck.value="idCheck";
	if(id == "") {
		alert("아이디를 입력하세요");
		frm.id.focus();
		return;
	}
	url = "idCheck.jsp?id="+id;
	window.open(url, "IDCheck", "width=300, height=150");
}

function inputCheck() {
	if(frm.id.value == "") {
		alert("아이디를 입력해 주세요");
		frm.id.focus();
		return;
	}
	if(frm.pwd.value == "") {
		alert("비밀번호를 입력해 주세요");
		frm.pwd.focus();
		return;
	}
	if(frm.repwd.value == "") {
		alert("비밀번호를 한번더 입력해 주세요");
		frm.repwd.focus();
		return;
	}
	if(frm.pwd.value != frm.repwd.value) {
		alert("비밀번호가 다릅니다");
		frm.repwd.focus();
		return;
	}
	if(frm.name.value == "") {
		alert("이름을 입력해 주세요");
		frm.name.focus();
		return;
	}
	frm.submit();
}