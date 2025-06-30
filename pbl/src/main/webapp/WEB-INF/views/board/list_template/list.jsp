<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                <a href="view?bno=${board.bno}&${pageDto.cri.qs2}" class="list-group-item list-group-item-action">
                    <div class="row text-center align-items-center small text-muted">
                        <span class="col-1 small fw-bold">${board.bno}</span>
                        <span class="col-1 small">${board.cno}</span>
                        <span class="col text-start text-black">
                        <c:if test="${board.bno != board.grp}">
                        <i class="fa-solid fa-reply text-muted small" style="transform:rotate(180deg); margin-left: ${(board.depth - 2) * 16}px"></i>
                        </c:if>
                        ${board.title}<span class="small fw-bold text-danger ms-1">[${board.replyCnt }]</span> 
                        <c:if test="${board.attachCnt > 0}">
                        <i class="fa-solid fa-paperclip text-muted small ms-2"></i>
                        </c:if>
                        </span>
                        <span class="col-1 small"><span class="small">
                        <fmt:parseDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
                        <fmt:formatDate value="${parsedDate}" pattern="yy.MM.dd"/>
                        </span></span>
                        <span class="col-1 small"><span class="small">${board.cnt}</span></span>
                    </div>
                </a>
                </c:forEach>
            </div>
            