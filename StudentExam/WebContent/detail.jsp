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
<%
	int no = Integer.parseInt(request.getParameter("no"));
	Student student = null;
	JavaC javaC = new JavaC();
	for (int i = 0; i < javaC.getLength(); i++) {
		Student object = javaC.getStudent(i);
		if (object.getNo() == no) {
			student = object;
			break;
		}
	}
	String[] majorArray = {"기계공학","컴퓨터과학","컴퓨터공학","정보통신"};
	String[] cityArray = {"서울","안산","부천"};
%>
<H1><%= student.getName() %></H1>
<UL>
	<LI>번호:<%= student.getNo() %></LI>
	<LI>성별:<%= student.getGenter()=='m'?"남성":"여성" %></LI>
	<LI>전공:<%= majorArray[student.getMajor()] %></LI>
	<LI>지역:<%= cityArray[student.getCity()] %></LI>
	<LI>가입일:<%= student.getDate() %></LI>
</UL>

</body>
</html>