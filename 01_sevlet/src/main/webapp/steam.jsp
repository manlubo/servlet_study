<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img alt="새똥이" src="img.jsp" width="100">
	<form>
		<select name="year">
			<optgroup label="생년">
				<%for(int i = 1900; i <= 2025; i++){
				if(i == 2025){%><option selected="selected"><%=i%></option><%}
				else {%><option><%=i%></option><%} %>
				<%} %>
			 </optgroup>
		</select>
		<select name="month">
			<optgroup label="월">
			<%for(int i = 1; i <= 12; i++){%>
					<option><%=i%></option>
					<%}%>
			 </optgroup>
		</select>
		<select name="day">
			<optgroup label="일">
			<%for(int i = 1; i <= 30; i++){%>
					<option><%=i%></option>
					<%}%>
			 </optgroup>
		</select>
		<button>전송</button>
	</form>
	<% 
		if(request.getParameter("year") != null && request.getParameter("month") != null && request.getParameter("day") != null){
			int year = Integer.parseInt(request.getParameter("year"));
			String result = "";
			if(2025 - year + 1 >= 20){
				result = "성인입니다.";
			}
			else{
				result = "성인이 아닙니다.";
			}
				%><h2>성인 여부 : <%=result %></h2><%
		}
	%>
				
			
</body>
</html>