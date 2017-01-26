<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%
	Connection conn = null; Statement stmt = null;
	try {
		int no = Integer.parseInt(request.getParameter("no"));

		Class.forName("oracle.jdbc.driver.OracleDriver");
		String jdbcDriver="jdbc:oracle:thin:@127.0.0.1:1521:MYORACLE";
		String dbUser = "ora_user", dbPass = "test";
		String query = "delete from student where no="+no;
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		stmt.executeUpdate(query);
%>
{"result":"OK"}
<%		
	} catch(Exception e) {
		e.printStackTrace();
%>
{"result":"FAIL"}
<%		
	} finally {
		if (stmt != null) try { stmt.close(); } catch(SQLException e){}
		if (conn != null) try { conn.close(); } catch(SQLException e){}
	}
%>