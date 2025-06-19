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
	<main>
        <form method="post" action="modify" onsubmit="return confirm('수정하시겠습니까?')">
            <div class="container d-flex flex-column my-4 p-0">
                <div class="p-2 px-3 border-bottom border-2 border-black mb-3">
                    <a href="board.html" class="fw-bold">게시글 수정</a>
                </div>
                <div class="small p-2 text-center border border-bottom-0" id="editer">
                    <input type="text" name="title" id="title" class="form-control" placeholder="제목" value="${board.title }">
                </div>
                <div class="mb-5">
                    <textarea name="content" id="editor1" class="form-control resize-none">${board.content}</textarea>
                </div>
                <div class="m-2 mt-3">
                	<a href="list?${cri.qs2 }" class="btn btn-secondary btn-sm float-end "> 취소</a>
                    <button class="btn btn-dark btn-sm float-end me-2"><i class="fa-solid fa-pen pe-1 small "></i> 글 수정</button>
                </div>
                <input type="hidden" name="id" value="${member.id }" />
                <input type="hidden" name="bno" value="${board.bno }" />
                <input type="hidden" name="cno" value="${cri.cno }" />
                <input type="hidden" name="page" value="${cri.page }" />
                <input type="hidden" name="amount" value="${cri.amount }" />
                <input type="hidden" name="type" value="${cri.type }" />
                <input type="hidden" name="keyword" value="${cri.keyword }" />
            </div>

        </form>
        
    </main>
</div>
<%@ include file="../common/footer.jsp" %>
<script>
        $(".slider").bxSlider({
            auto:true
        });

        $(window).scroll(function(e){
            console.log(window.scrollY)
            if(window.scrollY > 500){
                $(".arrow-area i").fadeIn(200);
            }
            else{
                $(".arrow-area i").hide(200)
            }
        })
        window.onload = function(){
            CKEDITOR.replace('editor1', {
                height : 400
            })
        }

    </script>
</body>
</html>