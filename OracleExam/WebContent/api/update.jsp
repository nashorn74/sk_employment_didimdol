<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%
	Connection conn = null; Statement stmt = null;
	try {
		request.setCharacterEncoding("utf-8");
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		int major = Integer.parseInt(request.getParameter("major"));
		int city = Integer.parseInt(request.getParameter("city"));

		Class.forName("oracle.jdbc.driver.OracleDriver");
		String jdbcDriver="jdbc:oracle:thin:@127.0.0.1:1521:MYORACLE";
		String dbUser = "ora_user", dbPass = "test";
		String query = "update student set name=\'"+name+
				"\', gender=\'"+gender+"\', major="+major+
				", city="+city+" where no="+no;
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