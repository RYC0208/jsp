<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="beanTest" class="ch04.BeanTest5"/>
    <jsp:setProperty name="beanTest" property="name" value="�ڹٺ���"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	����� �̸��� : <jsp:getProperty property="name" name="beanTest"/>
</body>
</html>