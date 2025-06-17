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
            <div class="clearfix">
                <a href="write" class="btn btn-dark btn-sm float-end mb-3"><i class="fa-solid fa-pen pe-1 small"></i> 글쓰기</a>
            </div>
            <div class="list-group">
                
                <div href="board _view.html" class="list-group-item">
                    <div class="row text-center align-items-center small text-black">
                        <span class="col-1 small">글 번호</span>
                        <span class="col-1 small">카테고리</span>
                        <span class="col text-start small">제목</span>
                        <span class="col-1 small">작성일</span>
                        <span class="col-1 small">조회수</span>
                    </div>
                </div>
                <c:forEach items="${boards}" var="board">
                <a href="view?bno=${board.bno}" class="list-group-item list-group-item-action">
                    <div class="row text-center align-items-center small text-muted">
                        <span class="col-1 small fw-bold">${board.bno}</span>
                        <span class="col-1 small">${board.cno}</span>
                        <span class="col text-start fw-bold text-black">${board.title}</span>
                        <span class="col-1 small"><span class="small">
                        <fmt:parseDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
                        <fmt:formatDate value="${parsedDate}" pattern="yy.MM.dd"/>
                        </span></span>
                        <span class="col-1 small"><span class="small">${board.cnt}</span></span>
                    </div>
                </a>
                </c:forEach>
            </div>
        </main>
    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>