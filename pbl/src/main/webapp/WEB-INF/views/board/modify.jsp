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
        
       		<div class="d-grid my-2 attach-area">
				<label class="btn btn-outline-dark">파일첨부 <input type="file" id="f1" class="d-none" multiple=""></label>
				<ul class="list-group my-3 attach-list">
					<c:forEach items="${board.attachs }" var="a">
					<li class="list-group-item d-flex align-items-center justify-content-between" 
					data-uuid="${a.uuid }" 
					data-origin="${a.origin }" 
					data-image="${a.image }" 
					data-path="${a.path }" 
					data-odr="${a.odr }">
						<a href="/pbl/download?uuid=${a.uuid }&origin=${a.origin }&path=${a.path}">${a.origin }</a> 
						<i class="fa-solid fa-xmark float-end m-2"></i>
					</li>
					</c:forEach>
					
				</ul>
				<div class="row justify-content-around w-75 mx-auto attach-thumb">
					<c:forEach items="${board.attachs }" var="a">
					<c:if test="${a.image }">
						<div class="my-2 col-12 col-sm-4 col-lg-2" data-uuid="${a.uuid }">
							<div class="my-2 bg-primary" style="height: 150px; background-image: url('/pbl/display?uuid=t_${a.uuid }&path=${a.path }')">
								<i class="fa-solid fa-xmark float-end m-2"></i>
							</div>
						</div>	
					</c:if>
					</c:forEach>
				</div>
			</div>
		
        
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
   	<script type="text/javascript">
	
	// return true / false
	function validateFiles(files) {
		const MAX_COUNT = 5;
		const MAX_FILE_SIZE = 10 * 1024 * 1024;
		const MAX_TOTAL_SIZE = 50 * 1024 * 1024;
		const BLOCK_EXT = ['exe', 'sh', 'jsp', 'java', 'class', 'html', 'js'];

		// 개수체크
		if(files.length > MAX_COUNT){
			alert('파일은 최대 5개까지 업로드 가능합니다.');
			return false;
		}
		
		// 확장자 체크, 사이즈 체크
		let totalSize = 0;
		const isValid = files.every(f => {
			const ext = f.name.split(".").pop().toLowerCase(); // 문자열을 .을 기준으로 문자열 배열로 만든 다음 마지막 것을 가져옴(확장자 추출)
			totalSize += f.size;
			return !BLOCK_EXT.includes(ext) && f.size <= MAX_FILE_SIZE;
		}) && totalSize <= MAX_TOTAL_SIZE

		if(!isValid){
			alert('다음 파일 확장자는 업로드가 불가합니다. [exer, sh, jsp, java, class, html, js] \n 또한 각 파일은 10MB 이하, 전체 합계는 50MB 이하여야 합니다.')
		}

		return isValid;
	}
	$("#f1").change(function(){
		event.preventDefault();
		const formData = new FormData();
		
		console.log(formData);
		const files = this.files;
		for(let i = 0; i < files.length; i++){
			formData.append("f1",files[i]);
		}
		
		const valid = validateFiles([...files]);
		
		if(!valid) {
			return;
		}
		
		
		
		// 파일의 갯수, 파일당 크기, 파일들 전체의 총량, 파일 확장자 제한
		for(let i = 0; i < files.length; i++){
			console.log(files[i].name);
		}
		
		$.ajax({
			url : '${cp}/upload',
			method : 'POST',
			data : formData,
			processData : false, // data를 queryString으로 쓰지 않겠다.
			contentType : false, // multipart/form-data; 이후에 나오게될 브라우저 정보도 포함시킨다, 즉 기본 브라우저 설정을 따르는 옵션.
			success : function(data) {
				// console.log(data);
				let str = "";
				let thumbStr = "";
				for(let a of data){
				  //$(".container").append("<p>" + data[a].origin + "</p>");
				  	str += `<li class="list-group-item d-flex align-items-center justify-content-between" 
						data-uuid="\${a.uuid}"
						data-origin="\${a.origin}"
						data-image="\${a.image}"
						data-path="\${a.path}"
						data-odr="\${a.odr}"
					>
						<a href="${cp}/download?uuid=\${a.uuid}&origin=\${a.origin}&path=\${a.path}">\${a.origin}</a> 
						<i class="fa-solid fa-xmark"></i>
					</li>`;
					if(a.image){
						thumbStr += `<div class="my-2 col-12 col-sm-4 col-lg-2" data-uuid="\${a.uuid}">
										<div class="my-2 bg-primary" style="height: 150px; background-image: url('${cp}/display?uuid=t_\${a.uuid}&path=\${a.path}')">
											<i class="fa-solid fa-xmark float-end m-2"></i>
										</div>
									</div>`;
					}
				}
				console.log(thumbStr);
				$(".attach-list").append(str);
				$(".attach-thumb").append(thumbStr);
				
				// 이미지인 경우와 아닌경우

			}
		})

	})
		
	$(".attach-area").on("click","i",function(){
		const uuid = $(this).closest("[data-uuid]").data("uuid");
		$('*[data-uuid="'+ uuid +'"]').remove();
	})
	
	CKEDITOR.replace('editor1', {
		height : 400
	});
    
	$("#writeForm").submit(function(){
		event.preventDefault();
		const data = [];
		$(".attach-list li").each(function(){
			data.push({...this.dataset});
		});
		console.log(JSON.stringify(data));
		$("[name='encodedStr']").val(JSON.stringify(data));
		this.submit();
	})

</script>
</body>
</html>