<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String siteName = request.getParameter("siteName");
		String siteTel = request.getParameter("siteTel");
	%>
	<jsp:include page="05_2.actionTag_include.jsp">
		<jsp:param value="jsp수업" name="siteName"/>
		<jsp:param value="02-1122-3344" name="siteTel"/>
	</jsp:include>
	<p/>
	include ActionTag의 Body입니다<p/>
	<%=siteName %><p/>
	<%=siteTel %><p/>
</body>
</html>






