<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 답변하기 화면</title>
<style>
	table{width: 550px; margin-top: 25px;}

</style>
</head>
<body>
	<form action="boardPost" method="post">
		<table align="center">
			<tr>
				<th colspan="2" bgcolor="#FFD9EC"> 수 정 하 기 </th>
			</tr>
			<tr>
				<td width="15%">성명</td>
				<td><input name="name"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="subject"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass">수정시에는 비밀번호가 필요합니다.</td>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="답변등록">&emsp;
					<input type="reset" value="다시쓰기">&emsp;
					<input type="button" value="뒤로" onclick="history.go(-1);">
				<!--히스토리 백 해줘도 되고 , 해스터리 -1 해줘도 되고 
				<input type="button" value="뒤로" onclick="location.href="history.go(-1)">
				
				
				  -->
				</td>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
	
	
	
	
	</form>
</body>
</html>