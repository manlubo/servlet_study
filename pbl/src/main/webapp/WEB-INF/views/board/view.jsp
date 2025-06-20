<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		            <li class="list-group-item ps-5 profile-img py-3">
		                <p class="small text-secondary">
		                    <span class="pe-3 border-end">새똥*</span>
		                    <span class="px-3 border-end">3일전</span>
		                </p>
		                <p class="small ws-pre-line">
		                    온라인 구매가 가능해서 너무 좋네요
		                    콧물마루 너무 귀여워요!!
		                </p>
		                <button class="btn btn-outline-secondary btn-sm float-end btn-remove-submit ms-2">삭제</button>
		                <button class="btn btn-secondary btn-sm float-end btn-modify-form">수정</button>
		            </li>
		            <li class="list-group-item ps-5 profile-img py-3">
		                <p class="small text-secondary">
		                    <span class="pe-3 border-end">새똥*</span>
		                    <span class="px-3 border-end">3일전</span>
		                </p>
		                <p class="small ws-pre-line">
		                    온라인 구매가 가능해서 너무 좋네요
		                    콧물마루 너무 귀여워요!!
		                </p>
		                <button class="btn btn-danger btn-sm float-end btn-remove-submit ms-2">삭제</button>
		                <button class="btn btn-warning btn-sm float-end btn-modify-form">수정</button>
		            </li>
		        </ul>
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
        function list(bno, lastRno) {
        	lastRno = lastRno ? ("/" + lastRno) : '';
        	let reqUrl = url + 'list/' + bno  + lastRno;
        	
            $.ajax({
                 url : reqUrl,
                success : function(data){
                    if(!data) return;
                    let str = '';
                    for(let r of data) {
                        str += `<li class="list-group-item ps-5 profile-img" data-rno="\${r.rno}">
                                <p class="small text-secondary">
                                    <span class="pe-3 border-end">\${r.id}</span>
                                    <span class="px-3">\${dayjs(r.regdate, dayForm).fromNow()}</span>
                                </p>
                                <p class="small ws-pre-line">\${r.content}</p>
                                <button class="btn btn-outline-secondary btn-sm float-end btn-remove-submit">삭제</button>
                                <button class="btn btn-secondary btn-sm float-end mx-2 btn-modify-form">수정</button>
                                </li>`    
                    }
                    $(".reviews").html(str);
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
                        list(bno);
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
                        // list(bno);
                    }
                }
            })

            console.log("글수정 전송");
        })

        // 글 삭제 버튼 이벤트 btn-remove-submit
        $(".reviews").on("click",".btn-remove-submit",function() {
            const result = confirm("삭제하시겠습니까?");
            if(!result) return;
            
            const rno = $(this).closest("li").data("rno");
            console.log("글 삭제 전송");
            $.ajax({
                url : url + rno,
                method : 'DELETE',
                success : function(data) {
                    if(data.result){
                       // list(bno);
                    }
                }
            })
        })
    })
</script>
</body>
</html>