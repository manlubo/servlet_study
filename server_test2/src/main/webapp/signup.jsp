<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
	<style>
		* {font-family: Pretendard}
		legend {font-weight: bold;}
		form {width: 400px; margin: auto;}
		button {padding: 10px 20px;}
	</style>
</head>
<body>
	<form method="post">	
		<fieldset>
			<legend>회원가입</legend>
			<p>아이디</p>
			<input name = "id">
			<p>비밀번호</p>
			<input name = "pw" type="password">
			<p>이름</p>
			<input name = "name">
			<hr>
			<button>회원가입</button>
		</fieldset>
	</form>
</body>
</html>