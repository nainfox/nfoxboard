<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../include/header.jsp" />
<script type="text/javascript" src="/resources/js/add.js"></script>
<script type="text/javascript" src="/resources/js/flowtype.js"></script>
<script type="text/javascript" src="/resources/js/nav.js"></script>
<style>
	.errors{
		color : red;
		font-weight: bold;
	}
</style>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/add.css">
<body>
	<jsp:include page="../include/nav.jsp" />
	<!-- 게시글 쓰기 -->
	
	<form:form action="/board/add" method="post" modelAttribute="boardVo">
		<table class="board-view table table-bordered ">
			<tr>
				<th>제목</th>
				<td>
					<form:input type="text" path="title" class="form-control"/>
					<form:errors class="errors" path="title"/>				
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<form:input type="text" path="name" class="form-control"/>
					<form:errors class="errors" path="name"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="2" class="">
					<form:textarea path="content" id="content" class="form-control"></form:textarea>
					<form:errors class="errors" path="content"/>
				</td>
			</tr>
		</table>
		<div class="buttons">
		    <button type="button" onclick="location.href='/board/list/'" class="btn btn_cancle btn-lg">취소</button>
			<button class="btn btn_add btn-lg">등록</button>
		</div>
	</form:form>
	
	
	
	
	<!-- summernote -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/lang/summernote-ko-KR.min.js"></script>
	<script>
		$("#content").summernote({
			height: 300,
			focus: true,
			lang: "ko-KR",
			callbacks: {
				onImageUpload : function(files, editor, welEditable){
					sendFile(files[0], editor, welEditable);
				}
			}
		});
		
		function sendFile(file, editor, welEditable){
			var data = new FormData();
			data.append('file', file);
			$.ajax({
				url : "/board/imgUpload",
				cache: false,
				processData: false,
                contentType: false,
				data : data,
				type : "post",
				success : function(data){
					var $img = $("<img>").attr('src', data.url);
					$("#content").summernote("insertNode", $img[0]);
				},
				error : function(err){
					console.log(err);
				}
			
			});
		} 
	</script>
	<script type="text/javascript">
      $('body').flowtype();
  	</script>
</body>
</html>