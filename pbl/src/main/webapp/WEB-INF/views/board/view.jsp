<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/dayjs.min.js" integrity="sha512-FwNWaxyfy2XlEINoSnZh1JQ5TRRtGow0D6XcmAWmYCRgvqOUTnzCxPc9uF35u5ZEpirk1uhlPVA19tflhvnW1g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/locale/ko.min.js" integrity="sha512-ycjm4Ytoo3TvmzHEuGNgNJYSFHgsw/TkiPrGvXXkR6KARyzuEpwDbIfrvdf6DwXm+b1Y+fx6mo25tBr1Icg7Fw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/plugin/relativeTime.min.js" integrity="sha512-MVzDPmm7QZ8PhEiqJXKz/zw2HJuv61waxb8XXuZMMs9b+an3LoqOqhOEt5Nq3LY1e4Ipbbd/e+AWgERdHlVgaA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/nav.jsp" %>
 <div class="container p-0">
        <!-- content -->
        <main>
            <div class="container d-flex flex-column my-4 p-0">
                <div class="p-2 px-3 border-bottom border-2 border-black">
                <c:forEach items="${cate }" var="c">
                    	<c:if test="${c.cno == cri.cno}">
                    			<a href="board.html" class="small"><span class="fw-bold">${c.cname} </span>카테고리</a>
                    	</c:if>
                    </c:forEach>
                    		
                </div>
                <div class="small p-2 text-center border-2 border-bottom">
                    <span class="border-end float-start px-2 border-2 pe-3">${board.cno}</span>
                    <span class="text-start float-start px-3">${board.title}</span>
                    <span class="float-end px-2 text-muted"><i class="fa-solid fa-comment"></i> ${board.replyCnt } </span>
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
          		
          		<c:if test="${not empty board.attachs }">
          		<div class="d-grid my-2 attach-area">
					<!--  <label class="btn btn-outline-dark">파일첨부 <input type="file" id="f1" class="d-none" multiple=""></label>-->
					<ul class="list-group my-3 attach-list">
						<c:forEach items="${board.attachs }" var="a">
						<li class="list-group-item d-flex align-items-center justify-content-between" 
						data-uuid="${a.uuid }" 
						data-origin="${a.origin }" 
						data-image="${a.image }" 
						data-path="${a.path }" 
						data-odr="${a.odr }">
							<a href="/pbl/download?uuid=${a.uuid }&origin=${a.origin }&path=${a.path}">${a.origin }</a> 
							<!-- <i class="fa-solid fa-xmark float-end m-2"></i>-->
						</li>
						</c:forEach>
						
					</ul>
					<div class="row justify-content-around w-75 mx-auto attach-thumb">
						<c:forEach items="${board.attachs }" var="a">
						<c:if test="${a.image }">
							<div class="my-2 col-12 col-sm-4 col-lg-2" data-uuid="${a.uuid }">
								<div class="my-2 bg-primary" style="height: 150px; background-image: url('/pbl/display?uuid=t_${a.uuid }&path=${a.path }')">
								</div>
							</div>	
						</c:if>
						</c:forEach>
					</div>
				</div>
				</c:if>
					
					
                <div class="m-2 mt-3">
                    <a href="list?${cri.qs2 }" class="btn btn-dark btn-sm"><i class="fa-solid fa-list-ul small pe-1"></i> 목록</a>
                    <a href="modify?${cri.qs2 }&bno=${board.bno}" class="btn btn-outline-secondary btn-sm"><i class="fa-solid fa-pen-to-square small pe-1"></i> 수정</a>
                    <a href="remove?${cri.qs2 }&bno=${board.bno}" class="btn btn-outline-secondary btn-sm" onclick="return confirm('삭제하시겠습니까?')"><i class="fa-solid fa-trash small pe-1"></i> 삭제</a>
                    <button class="btn btn-outline-secondary float-end btn-sm"><i class="fa-solid fa-share-nodes small pe-1"></i> 공유</button>
                    <button class="btn btn-outline-secondary float-end me-2 btn-sm"><i class="fa-regular fa-clipboard small pe-1"></i> 스크랩</button>
                </div>
                
                <div class="small p-0 py-2 border-1 border-bottom mt-5 border-top border-muted d-flex align-items-center justify-content-between px-2">
                    <span class="fw-bold"><i class="fa-solid fa-comment-dots small me-2"></i>Reply</span>
                    <c:if test="${empty member }">
                    <a class="small text-dark" href='${cp }/member/login'>댓글을 작성하려면 로그인이 필요합니다.</a>
                    </c:if>
                    <c:if test="${not empty member }">
                    <button class="btn btn-write-form btn-sm btn-dark">댓글 작성</button>
                    </c:if>
                </div>
                <ul class="list-group list-group-flush reviews">
		        </ul>
		        <div class="d-grid">
		        	<button class="btn btn-dark btn-block btn-reply-more d-none mt-3">댓글 더보기</button>
		        </div>
            </div>
            
        </main>
    </div>
        <!-- The Modal -->
    <div class="modal fade" id="reviewModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Review  Form</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="/action_page.php">
                        <div class="mb-3 mt-3">
                            <label for="content" class="form-label"><i class="fa-solid fa-comment text-primary"></i> Content</label>
                            <textarea class="form-control no-resize" id="content" placeholder="Enter Content" name="content" rows="5"  ></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="writer" class="form-label"><i class="fa-solid fa-user text-primary"></i> Writer</label>
                            <input type="text" class="form-control" id="writer" placeholder="Enter Writer" name="writer" value="${member.id }" disabled="disabled">
                        </div>
                    </form>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btn-sm btn-write-submit">Write</button>
                    <button type="button" class="btn btn-warning btn-sm btn-modify-submit">Modify</button>
                    <button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>
<%@ include file="../common/footer.jsp" %>
<script>
	dayjs.extend(window.dayjs_plugin_relativeTime)
	dayjs.locale('ko')
	const dayForm = 'YYYY-MM-DD HH:mm:ss';
	dayjs('2025-05-21 13:40:44', dayForm).fromNow()
    $(_ => {
    	const bno = '${board.bno}'
        const url = "${cp}" + "/reply/";
        const modal = new bootstrap.Modal($("#reviewModal").get(0), {})
        // makeReplyLi(reply) > str
        
        function makeReplyLi(r) {
        	return `<li class="list-group-item ps-5 profile-img" data-rno="\${r.rno}">
            <p class="small text-secondary">
                <span class="pe-3 border-end">\${r.id}</span>
                <span class="px-3">\${dayjs(r.regdate, dayForm).fromNow()}</span>
            </p>
            <p class="small ws-pre-line">\${r.content}</p>
            <button class="btn btn-outline-secondary btn-sm float-end btn-remove-submit">삭제</button>
            <button class="btn btn-secondary btn-sm float-end mx-2 btn-modify-form">수정</button>
            </li>`;
        }
        
        function list(bno, lastRno) {
        	lastRno = lastRno ? ("/" + lastRno) : '';
        	let reqUrl = url + 'list/' + bno  + lastRno;
        	
            $.ajax({
                 url : reqUrl,
                success : function(data){
                    if(!data || data.length === 0) {
                    	if($(".reviews li").length === 0){
                    		$(".reviews").html("<li class='list-group-item text-center text-muted'>댓글이 없습니다</li>");
                    	}
                    	else {
                    		$(".btn-reply-more").prop("disabled", true).text("추가 댓글이 없습니다");
                    	}
                    	return;
                    		
                    }
                    $(".btn-reply-more").removeClass("d-none");
                    let str = '';
                    for(let r of data) {
                        str += makeReplyLi(r);  
                    }
                    $(".reviews").append(str); // 교체, 추가
                }
            })
        }
        list(bno);


        // 글쓰기 폼 활성화 btn-write-form
        $(".btn-write-form").click(function() {
            console.log("글쓰기 폼");
            $("#reviewModal form").get(0).reset();
            $("#reviewModal .modal-footer button").show().eq(1).hide();
            modal.show();
        })
        // 글쓰기 버튼 이벤트 btn-write-submit
        $(".btn-write-submit").click(function() {
            const result = confirm("등록하시겠습니까?");
            if(!result) return;

            const content = $("#content").val().trim();
            const id = $("#writer").val().trim();
            

            const obj = {content, id, bno};
            console.log(obj);
            console.log("글쓰기 전송");

            $.ajax({
                url,
                method : 'POST',
                data : JSON.stringify(obj),
                success : function(data) {
                    if(data.result) { 
                        modal.hide();
                        // 작성된 댓글
                        if(data.reply){ // not null, not undefined
	                        data.reply.regdate = dayjs().format(dayForm);
	                        const strLi = makeReplyLi(data.reply);
	                        $(".reviews").prepend(strLi);
                        }
                    }
                }
            })
        })
        // 글수정 폼 활성화 btn-modify-form
        $(".reviews").on("click",".btn-modify-form",function() {
            console.log("글수정 폼");
            const rno = $(this).closest("li").data("rno");
            $.getJSON(url + rno, function(data){
                $("#reviewModal .modal-footer button").show().eq(0).hide();
                $("#content").val(data.content);
                $("#writer").val(data.id);
                $("#reviewModal").data("rno", rno);
                console.log(data);
                modal.show();
            })
        })

        // 글 수정 버튼 이벤트 btn-modify-submit
        $(".btn-modify-submit").click(function() {
            const result = confirm("수정하시겠습니까?");
            if(!result) return;
            
            const rno = $("#reviewModal").data("rno");
            console.log(rno);
            
            const content = $("#content").val().trim();
            const id = $("#writer").val().trim();
       
            
            const obj = {content, id, rno};

            $.ajax({
                url : url + rno,
                method : 'PUT',
                data : JSON.stringify(obj),
                success : function(data) {
                    if(data.result){
                        modal.hide();
                        // 재호출 (get)
                        $.getJSON(url + rno, function(data){
                        	console.log(data);
                        	// 문자열 생성
                        	const strLi = makeReplyLi(data);
                        	// rno를 가지고 수정할 li를 탐색
                        	const $li = $(`.reviews li[data-rno=\${rno}]`);
                        	console.log($li.html());
                        	// replaceWith 내용교체
                        	$li.replaceWith(strLi);
                        })
                    }
                }
            })

            console.log("글수정 전송");
        })

        // 글 삭제 버튼 이벤트 btn-remove-submit
        $(".reviews").on("click",".btn-remove-submit",function() {
            const result = confirm("삭제하시겠습니까?");
            if(!result) return;
            
            const $li = $(this).closest("li");
            const rno = $li.data("rno");
            console.log("글 삭제 전송");
            $.ajax({
                url : url + rno,
                method : 'DELETE',
                success : function(data) {
                    if(data.result){
                       $li.remove();
                    }
                }
            })
        })
        // 댓글 더보기 버튼 이벤트
        $(".btn-reply-more").click(_ => {
        	// 현재 댓글 목록 중 마지막 댓글 번호를 가져오기
        	const lastRno = $(".reviews li:last").data("rno");
        	console.log(lastRno);
        	
        	list(bno, lastRno);
        })
        
    })
</script>
</body>
</html>