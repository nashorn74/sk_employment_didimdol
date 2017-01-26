<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%
	Connection conn = null; PreparedStatement stmt = null;
	try {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		int major = Integer.parseInt(request.getParameter("major"));
		int city = Integer.parseInt(request.getParameter("city"));
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
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
%>
{"result":"OK"}
<%
	} catch(Exception ex) { 
		ex.printStackTrace();
%>
{"result":"FAIL"}
<%
	} finally {
		if (stmt != null) try { stmt.close(); } catch(SQLException e) {}
		if (conn != null) try { conn.close(); } catch(SQLException e) {}
	}
%>