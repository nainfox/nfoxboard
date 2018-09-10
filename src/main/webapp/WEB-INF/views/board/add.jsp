<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Insert title here</title>
</head>
<style>
	.errors{
		color : red;
		font-weight: bold;
	}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<body>
	<jsp:include page="../include/nav.jsp" />
	<!-- 게시글 쓰기 -->
	<!-- 글쓰고 확인 및 취소 버튼 필요 -->
	<!-- 확인 url은 동일하게 /board/add로 요청 -->
	<!-- 필요 파라미터 (파라미터명) : 게시글 제목 (title), 작성자 (name), 게시글 (content) -->
	
	
	<form:form action="/board/add" method="post" modelAttribute="boardVo">
		<table class="board-view table table-bordered table-hover">
			<tr>
				<th width="30%">제목</th>
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
			<button class="btn btn-primary btn-lg">등록</button>
			<button type="button" onclick="location.href='/board/list/'" class="btn btn-danger btn-lg">취소</button>
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
	
</body>
</html>