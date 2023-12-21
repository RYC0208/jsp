<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="script.js" charset="UTF-8"></script>
<style>
	* {margin: 0 auto;}
	div {width:1100px;}
	table {margin-top: 50px;}
	table th {text-align:center;}	
</style>
<script>
	function findAddr() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            let roadAddr = data.roadAddress;	// 도로명 주소
	            let jibunAddr = data.jibunAddress;	// 지번 주소
	            let extraAddr ='';
	            
	            document.getElementById('postcode').value = data.zonecode;	// 우편번호
	            
	            if(data.userSelectedType == 'R') {
	            	if(roadAddr != '') {
	            		if(data.bname != '') {
	            			extraAddr += data.bname;	// 동이름
	            		}
	            		if(data.buildingName != '') {
	            			extraAddr += ', ' + data.buildingName;		//빌딩명
	            		}	
	            	}
	            	roadAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';	// 동이름이나 빌딩명이 있으면 (동이름, 빌딩명)으로 뒤에 부착
	            	document.getElementById('addr').value = roadAddr;	// 도로명(동이름, 빌딩명) 을 input에 넣는다
	            } else {
	            	if(jibunAddr != '') {
	            		if(data.buildingName != '') {
	            			extraAddr += data.buildingName;
	            		}
	            	}
	            	jibunAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';
	            	document.getElementById('addr').value = jibunAddr;
	            }
	            document.getElementById('detailAddr').focus();
	        }
	    }).open();
	}
</script>
</head>
<body>
	<div>
		<form method="post" action="memberProc.jsp" name="frm">
			<table class="table">
				<tr>
					<th colspan="3"><font size="5em">회원가입</font></th>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
						<input name="id" onkeydown="inputIdChk();">
						<input type="button" value="ID중복확인" onclick="idCheck(this.form.id.value);">
						<input type="hidden" name="idBtnCheck" value="idUncheck">
					</td>
					<td>영문과 숫자로만 입력</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd"></td>
					<td>특수기호,영문,숫자가 각1개 이상씩 들어가야 되고 8글자 이상</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="repwd"></td>
					<td>위의 비밀번호를 한번 더 넣으세요</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input name="name"></td>
					<td>한글로 입력</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" value="1" checked>남&emsp;&emsp;
						<input type="radio" name="gender" value="2" >여
					</td>
					<td>성별을 선택해 주세요</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input name="birthday" ></td>
					<td>6글자로 입력. ex) 190315</td>
				</tr>
				<tr>
					<td>E-mail</td>
					<td><input name="email" size="40" ></td>
					<td>ex) email@naver.com</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input name="zipcode" id="postcode" readonly>
						<input type="button" value="우편번호 찾기" onclick="findAddr();">
					</td>
					<td>우편번호를 검색하세요</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input name="address" id="addr" size="60" readonly><br/>
						<input name="detailAddress" id="detailAddr" placeholder="상세주소 넣기">
					</td>
					<td>상세주소가 있으면 입력해주세요</td>
				</tr>
				<tr>
					<td>취미</td>
					<td>
						<input type="checkbox" name="hobby" value="인터넷" checked>인터넷&nbsp;
						<input type="checkbox" name="hobby" value="여행">여행&nbsp;
						<input type="checkbox" name="hobby" value="게임">게임&nbsp;
						<input type="checkbox" name="hobby" value="영화">영화&nbsp;
						<input type="checkbox" name="hobby" value="운동">운동
					</td>
					<td>취미를 선택하세요</td>
				</tr>
				<tr>
					<td>직업</td>
					<td>
						<select name="job">
							<option value="0" selected>선택하세요.
							<option value="회사원">회사원
							<option value="공무원">공무원
							<option value="의사">의사
							<option value="법조인">법조인
							<option value="학생">학생
							<option value="교수">교수
							<option value="기타">기타
						</select>
					</td>
					<td>직업을 선택하세요</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<input type="button" value="회원가입" onclick="inputCheck();">&emsp;&emsp;
						<input type="reset" value="다시쓰기">&emsp;&emsp;
						<input type="button" value="로그인" onClick="location.href='login.jsp'">
					</td>
				</tr>	
			</table>
		</form>
	</div>
</body>
</html>