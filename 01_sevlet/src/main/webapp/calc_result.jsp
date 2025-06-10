<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	<% 
		// scriptlet
		int num1 = Integer.parseInt(request.getParameter("num1")) ; 
		int num2 = Integer.parseInt(request.getParameter("num2")) ; 
	%>
	
	<ul>
		<li>덧셈 : <%= num1 + num2 %></li>
		<li>빼기 : <%= num1 - num2 %></li>
		<li>곱셈 : <%= num1 * num2 %></li>
		<li>나눗셈 : <%= num1 / num2 %></li>
	</ul>
</body>
</html>