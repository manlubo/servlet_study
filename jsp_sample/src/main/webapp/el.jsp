<%@page import="domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=page==this %></h2>
	<h3><%=request.getSession() == session %></h3>
	<%	
		// 영역객체
		// page, request, session, application
		pageContext.setAttribute("value", 10);
		request.setAttribute("value", 20);
		session.setAttribute("value", 30);
		application.setAttribute("value", 40);
	%>
	<h3>${pageScope.value }</h3> <!-- 현재 페이지까지 --> 
	<h3>${requestScope.value }</h3> <!-- 응답할때 까지 -->
	<h3>${sessionScope.value }</h3> <!-- 세션 종료 (기본 30분) 까지 -->
	<h3>${applicationScope.value }</h3> <!-- 서버 실행 부터 종료까지 -->
	
	<%
		request.setAttribute("myValue", new Member());
	%>
	
	<%-- <h3>normal exp : <%=((Member)request.getAttribute("myValue")).getName() %></h3>--%>
	<h3>exp lang : ${myValue.name}</h3> <!-- 값이 null이어도 오류가 나지 않음 -->
	<h3>exp lang : ${myValue["name"]}</h3> <!-- js객체처럼 호출도 가능 -->
	<h3>${'1' + "2" }</h3> <!-- 문자열 결합은 숫자로 계산 -->
	<h3>${"1 + 2" }</h3>
	<h3>${5 / 2 }</h3> 
	<h3>${myValue.name eq '새똥이' }</h3>
	<h3>${myValue.name ne '새똥이' }</h3>
	<h3>${10 < 20}</h3>
	<h3>${5 mod 2}</h3>
	<h3>${empty ''}</h3>
	<h3>${not empty null}</h3>
</body>
</html>