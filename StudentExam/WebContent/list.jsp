<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.student_exam.Student" %>
<%@ page import="com.test.student_exam.JavaC" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
<% 
	JavaC javaC = new JavaC();
	for (int i = 0; i < javaC.getLength(); i++) {
		Student student = javaC.getStudent(i);
%>
		<li><a href="detail.jsp?no=<%= student.getNo()%>
		"><%= student.getName() %></a></li>
<% 
	} 
%>
</ul>
</body>
</html>