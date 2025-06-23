<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="common/head.jsp" %>
</head>
<body>
	<div class="container">
		<form method="post" enctype="multipart/form-data" id="uploadForm">
			<div class="d-grid my-2">
				<label class="btn btn-outline-dark">파일첨부 <input type="file" name="f1" class="d-none"  multiple></label>
			</div>
			<br>
			<button class="btn btn-dark">파일 업로드</button>
		</form>
	</div>
</body>
<script type="text/javascript">
	$("#uploadForm").submit(function() {
		event.preventDefault();
		const formData = new FormData(this);
		console.log(formData);
		
		$.ajax({
			url : '${cp}/upload',
			method : 'POST',
			data : formData,
			processData : false, // data를 queryString으로 쓰지 않겠다.
			contentType : false, // multipart/form-data; 이후에 나오게될 브라우저 정보도 포함시킨다, 즉 기본 브라우저 설정을 따르는 옵션.
			success : function(data) {
				console.log(data);
				for(let a in data){
				 $(".container").append("<p>" + data[a].origin + "</p>");
				}
					
			}
		})
	})
</script>
</html>