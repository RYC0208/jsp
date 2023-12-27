<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<%
	int num =1;
	bDao.upCount(num);
	Board board = bDao.getBoard(num);

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{width: 550px; margin-top: 25px;}

</style>
</head>
<body>
	<table align="center">
			<tr>
				<th colspan="4" bgcolor="#FFD9EC"> 글 읽 기 </th>
			</tr>
			<tr>
				<td width="15%">성명</td>
				<td><%=board.getName() %></td>
				<td>등록날짜</td>
				<td><%=board.getRegdate() %></td>
			</tr>
			<tr>
				<td >제목</td>
				<td colsapan="3"><%=board.getSubject() %></td>
			</tr>
			<tr>
				<td colsapan="4"><%=board.getContent() %></pre><br></td>
			</tr>
			<tr>
				<td colsapan="4" align="right"><%=board.getIp() %>로 부터 글을 남기셨습니다 / 조회수 <%=board.getCount() %></td>
			</tr>
			<tr>
				<td colsapan="4" align="center">
				<hr/>
					<a href="list.jsp">리스트</a>
					<a href="update.jsp?num=<%=num%>">수 정</a>
					<a href="reply.jsp">답 변</a>
					<a href="delete.jsp">삭 제</a>
				
				</td>
			</tr>
			
		</table>

</body>
</html>