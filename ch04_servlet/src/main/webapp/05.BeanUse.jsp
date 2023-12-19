<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="beanTest" class="ch04.BeanTest5"/>
    <jsp:setProperty name="beanTest" property="name" value="자바빈사용"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	당신의 이름은 : <jsp:getProperty property="name" name="beanTest"/>
</body>
</html>