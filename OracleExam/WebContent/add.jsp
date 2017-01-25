<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	int major = Integer.parseInt(request.getParameter("major"));
	int city = Integer.parseInt(request.getParameter("city"));

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null; PreparedStatement stmt = null;
	try {
		String jdbcDriver="jdbc:oracle:thin:@127.0.0.1:1521:MYORACLE";
		String dbUser = "ora_user", dbPass = "test";
		String query = "select * from student";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.prepareStatement(
			"insert into student(no,name,gender,major,city) "+
			"values(seq_3.nextval,?,?,?,?)");
		stmt.setString(1, name);
		stmt.setString(2, gender);
		stmt.setInt(3, major);
		stmt.setInt(4, city);
		stmt.executeUpdate();
	} catch(SQLException ex) { ex.printStackTrace();
	} finally {
		if (stmt != null) try { stmt.close(); } catch(SQLException e) {}
		if (conn != null) try { conn.close(); } catch(SQLException e) {}
%>
		<script>
			location.href="list.jsp";
		</script>
<%
	}
%>
</body>
</html>