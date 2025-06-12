<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<p>국어</p><input name="kor">
		<p>영어</p><input name="eng">
		<p>수학</p><input name="mat">
		<br>
		<button>계산</button>
	</form>
	<%	
		if(request.getParameter("kor") != null && request.getParameter("eng") != null && request.getParameter("mat") != null){
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		int sum = kor + eng + mat;
		double mul = sum / 3.0; %>
		
		<h2>총점 : <%=sum %></h2>
		<h2>평균 : <%=mul %></h2>
	<%		
		}		
	%>
</body>
</html>