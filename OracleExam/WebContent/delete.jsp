<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null; Statement stmt = null;
	try {
		String jdbcDriver="jdbc:oracle:thin:@127.0.0.1:1521:MYORACLE";
		String dbUser = "ora_user", dbPass = "test";
		String query = "delete from student where no="+no;
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		stmt.executeUpdate(query);
	} catch(SQLException e) {
		e.printStackTrace();
	} finally {
		if (stmt != null) try { stmt.close(); } catch(SQLException e){}
		if (conn != null) try { conn.close(); } catch(SQLException e){}
%>
		<script>location.href="list.jsp";</script>
<%
	}
%>
</body>
</html>