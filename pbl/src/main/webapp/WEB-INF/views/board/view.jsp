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
                <div class="p-2 px-3 border-bottom border-2 border-black">
                    <a href="board.html" class="small"><span class="fw-bold">${board.cno} </span>카테고리</a>
                </div>
                <div class="small p-2 text-center border-2 border-bottom">
                    <span class="border-end float-start px-2 border-2 pe-3">${board.cno}</span>
                    <span class="text-start float-start px-3">${board.title}</span>
                    <span class="float-end px-2 text-muted"><i class="fa-solid fa-comment"></i> 4</span>
                    <span class="float-end px-2 text-muted"><i class="fa-solid fa-eye"></i> ${board.cnt}</span>
                </div>
                <div class="small bg-light p-2 px-3 text-muted">
                    <div class="small float-start">${board.id}</div>
                    <div class="small float-start ms-3"><a href="board.html" class="text-muted small text-decoration-underline">board.html</a></div>
                    <div class="small float-end">
                    <fmt:parseDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
                    <fmt:formatDate value="${parsedDate}" pattern="yy.MM.dd"/>
                 	</div>
                </div>
                <div class="p-3 border-bottom my-2">
                	${board.content}
                </div>
          
                <div class="m-2 mt-3">
                    <a href="list?${cri.qs2 }" class="btn btn-dark btn-sm"><i class="fa-solid fa-list-ul small pe-1"></i> 목록</a>
                    <a href="modify?${cri.qs2 }&bno=${board.bno}" class="btn btn-outline-secondary btn-sm"><i class="fa-solid fa-pen-to-square small pe-1"></i> 수정</a>
                    <a href="remove?${cri.qs2 }&bno=${board.bno}" class="btn btn-outline-secondary btn-sm" onclick="return confirm('삭제하시겠습니까?')"><i class="fa-solid fa-trash small pe-1"></i> 삭제</a>
                    <button class="btn btn-outline-secondary float-end btn-sm"><i class="fa-solid fa-share-nodes small pe-1"></i> 공유</button>
                    <button class="btn btn-outline-secondary float-end me-2 btn-sm"><i class="fa-regular fa-clipboard small pe-1"></i> 스크랩</button>
                </div>
            </div>
            
        </main>
    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>