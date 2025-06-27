<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
    <!-- 게시글 카드 시작 -->
    <c:forEach items="${boards}" var="b">
    <c:if test="${empty b.attachs }">
    	<c:set var="src" value="https://placehold.co/300x200?text=No+Image"/>
    </c:if>
    <c:if test="${not empty b.attachs }">
    	<c:set var="src" value="${cp}/display?uuid=t_${b.attachs[0].uuid}&path=${b.attachs[0].path}"/>
    </c:if>
	    <div class="col">
	      <div class="card h-100 shadow-sm">
	        <img src="${src}" class="card-img-top" alt="썸네일" style="object-fit: cover; height: 200px">
	        <div class="card-body d-flex flex-column">
	          <h5 class="card-title text-truncate fs-6">${b.title}</h5>
	          <p class="card-text text-muted mb-1"><i class="fa-solid fa-calendar-days small mx-1"></i> ${b.regdate }</p>
	          <p class="card-text text-muted mb-1"><i class="fa-solid fa-eye small" style="margin-left: 2px;"></i> ${b.cnt }</p>
	          <a href="${cp }/board/view?bno=${b.bno}&${pageDto.cri.qs2}" class="mt-3 btn btn-outline-primary btn-sm">자세히 보기</a>
	        </div>
	      </div>
	    </div>
    </c:forEach>
    <!-- 게시글 카드 끝 -->
   

    <!-- 추가 카드 복제해서 반복 -->
  </div>
            