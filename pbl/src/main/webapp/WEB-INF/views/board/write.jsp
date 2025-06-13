<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
</head>

<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/nav.jsp" %>
<div class="container p-0">
        <!-- content -->
        <main>
            <div class="container d-flex flex-column my-4 p-0">
                <div class="p-2 px-3 border-bottom border-2 border-black mb-3">
                    <a href="board.html" class="fw-bold">게시글 작성</a>
                </div>
                <div class="small p-2 text-center border border-bottom-0">
                    <input type="text" name="title" id="title" class="form-control" placeholder="Title">
                </div>
                <div class="mb-5">
                    <textarea name="content" id="editor1" class="form-control resize-none"></textarea>
                </div>
                <div class="m-2 mt-3">
                    <button class="btn btn-dark btn-sm float-end"><i class="fa-solid fa-pen pe-1 small"></i> 글쓰기</button>
                </div>
            </div>
            
        </main>
    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>