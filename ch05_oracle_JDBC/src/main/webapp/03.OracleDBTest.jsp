<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String id, title, location;
try{
	Class.forName("oracle.jdbc.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","aie","aie");
	
	st = con.createStatement();
	rs = st.executeQuery("select * from department");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSP를 이용한 ORACLE 연동</h1>
	<table border="1">
		<tr>
			<th>부서번호</th>
			<th>부서명</th>
			<th>위치번호</th>
		</tr>
		<%
		if(rs != null) {
			while(rs.next()) {
				id = rs.getString(1);
				title = rs.getString(2);
				location = rs.getString(3);
		%>
		<tr>
			<td><%=id %></td>
			<td><%=title %></td>
			<td><%=location %></td>
		</tr>
		<%
			}
		}
		%>
	</table>
<%
}  catch(Exception e) {
	e.printStackTrace();
} finally {
	if(rs != null)
		try{rs.close(); } catch(Exception e) { }
	if(st != null)
		try{st.close(); } catch(Exception e) { }
	if(con != null)
		try{con.close(); } catch(Exception e) { }
}
%>
</body>
</html>