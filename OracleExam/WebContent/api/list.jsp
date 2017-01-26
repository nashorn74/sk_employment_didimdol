<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
{"students":[
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null; Statement stmt = null; ResultSet rs = null;
	try {
		String jdbcDriver="jdbc:oracle:thin:@127.0.0.1:1521:MYORACLE";
		String dbUser = "ora_user", dbPass = "test";
		String query = "select * from student";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_UPDATABLE);
		rs = stmt.executeQuery(query);
		//전체 개수 구하기-----------------
		int size = -1, count = 0;
		try {
			rs.last(); 
		    size = rs.getRow();
		    rs.first();
		} catch(SQLException e) {}
		while(rs.next()) {
%>
{"no":<%= rs.getInt("NO") %>,"name":"<%= rs.getString("NAME") %>",
"gender":"<%= rs.getString("GENDER") %>",
"major":<%= rs.getInt("MAJOR") %>,"city":<%= rs.getInt("CITY") %>,
"created_at":"<%= rs.getDate("CREATED_AT") %>"
<% 			if (count >= (size-2)){ %>
}
<%			} else { %>
},
<%			
			} count++; 		
		}
	} catch(SQLException ex) { ex.printStackTrace();
	} finally {
		if (rs != null) try { rs.close(); } catch(SQLException e) {}
		if (stmt != null) try { stmt.close(); } catch(SQLException e) {}
		if (conn != null) try { conn.close(); } catch(SQLException e) {}
	}
%>
]}






