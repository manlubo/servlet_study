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
            <div class="clearfix row align-items-center my-3">
	            <div class="col-2">
		            <select class="form-select form-select-sm">
		            	<option>10개씩 보기</option>
		            	<option>20개씩 보기</option>
		            	<option>50개씩 보기</option>
		            	<option>100개씩 보기</option>
		            </select>
	            </div>
            	
            	<form class="col input-group search-form">
		            <select class="form-select form-select-sm" name="type">
		            	<option value="T">제목</option>
		            	<option value="C">내용</option>
		            	<option value="I">작성자</option>
		            	<option value="TC">제목 + 내용</option>
		            	<option value="TI">제목 + 작성자</option>
		            	<option value="CI">내용 + 작성자</option>
		            	<option value="TCI">제목 + 내용 + 작성자</option>
		            </select>
            		<input type="text" class="form-control form-control-sm w-75" placeholder="Search" name="keyword">
            		<input type="hidden" name="page" value="1">
            		<input type="hidden" name="amount" value="${pageDto.cri.amount }">
            		<input type="hidden" name="cno" value="${pageDto.cri.cno }">
            		<button class="btn btn-dark btn-sm">검색</button>
            	</form>
            	<script type="text/javascript">
            		$(".search-form").submit(function() {
            			event.preventDefault();
            			this.keyword.value = encodeURIComponent(this.keyword.value);
						this.submit();          			
            		})
            	</script>
            	<div class="col-2">
	                <a href="write?${pageDto.cri.qs2}" class="btn btn-dark btn-sm float-end"><i class="fa-solid fa-pen pe-1 small"></i> 글쓰기</a>
            	</div>
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
                <a href="view?bno=${board.bno}&${pageDto.cri.qs2}" class="list-group-item list-group-item-action">
                    <div class="row text-center align-items-center small text-muted">
                        <span class="col-1 small fw-bold">${board.bno}</span>
                        <span class="col-1 small">${board.cno}</span>
                        <span class="col text-start text-black">${board.title}</span>
                        <span class="col-1 small"><span class="small">
                        <fmt:parseDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
                        <fmt:formatDate value="${parsedDate}" pattern="yy.MM.dd"/>
                        </span></span>
                        <span class="col-1 small"><span class="small">${board.cnt}</span></span>
                    </div>
                </a>
                </c:forEach>
            </div>
            <ul class="pagination my-5 justify-content-center">
            	
            	<c:if test="${pageDto.doubleLeft }">
				<li class="page-item"><a class="page-link" href="list?&page=1&${pageDto.cri.qs }"><i class="fa-solid fa-angles-left"></i></a></li>
            	</c:if>
				
				<c:if test="${pageDto.left }">
				<li class="page-item"><a class="page-link" href="list?&page=${pageDto.start - 1}&${pageDto.cri.qs}"><i class="fa-solid fa-angle-left"></i></a></li>
				</c:if>
				
				<c:forEach begin="${pageDto.start}" end="${pageDto.end}" var="i">
					<li class="page-item"><a class="page-link ${i == pageDto.cri.page ? 'active' : ''}" href="list?page=${i}&${pageDto.cri.qs}">${i}</a></li>
				</c:forEach>
				
				<c:if test="${pageDto.right }">
				<li class="page-item"><a class="page-link" href="list?page=${pageDto.end + 1}&${pageDto.cri.qs}"><i class="fa-solid fa-angle-right"></i></a></li>
				</c:if>
				
        		<c:if test="${pageDto.doubleRight }">
				<li class="page-item"><a class="page-link" href="list?page=${pageDto.realEnd}&${pageDto.cri.qs}"><i class="fa-solid fa-angles-right"></i></a></li>
				</c:if>
			</ul>
        </main>
    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>