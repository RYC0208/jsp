<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. formatNumber</h3>
	<p>
		숫자데이터의 포맷(형식) 지정 <br>
		-표현하고자 하는 숫자데이터의 형식을 통화기호, % 등 원하는 쓰임에 맞게 형식을 지정하는 태그 <br><br>
	</p>
	
	<c:set var="num1" value="123456789" />
	<c:set var="num2" value="0.95" />
	<c:set var="num3" value="50000" />
	
	num1 출력 : ${num1}<br>
	세자리마다 구분하여 출력 : <fmt:formatNumber value="${num1}"/> <br> 
						<!-- groupinUsed 기본값 true == 구분자 있게 출력 -->
	숫자 그대로 출력 : <fmt:formatNumber value="${num1}" grouptinUsed = "false" /><br><br>
	
	percent : <fmt:formatNumber value="${num2}" type="percent"/><br>
	currency : <fmt:formatNumber value="${num2}" type="currency" groupingUsed="false"/><br>
	currency $: <fmt:formatNumber value="${num2}" type="currency" currencySymbol="$"/><br>					
	<!-- 
		type : 백분율(%), 통화기호 형식 지정
		currencySymbol : 통화기호 문자 지정
		
		-	type="percent" : %로 출력
		-	type="currency" : 현재 local 지역의 화폐를 써줌
		-	type="currency" currencySymbol="$" : 화폐 단위를 $로 출력해줌
		
	 -->		
		
</body>
</html>