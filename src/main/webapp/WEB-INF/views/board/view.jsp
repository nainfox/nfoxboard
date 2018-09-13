<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/view.css">
<script type="text/javascript" src="/resources/js/view.js"></script>
<script type="text/javascript" src="/resources/js/flowtype.js"></script>
<script type="text/javascript" src="/resources/js/nav.js"></script>
<body>
	<jsp:include page="../include/nav.jsp" />
	
	<!-- 게시글 보기 -->
	
	<table class="board-view table table-bordered">
		<tr>
			<th>제목</th>
			<td>${board.title }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${board.name }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="2" class="content">
				${board.content }
			</td>
		</tr>
	</table>
	<div class="buttons">
		<button type="button" style="text-align: right" class="btn btn_list btn-lg" 
		onclick="location.href='/board/list'">목록</button>
	</div>
	<script type="text/javascript">
      $('body').flowtype();
  	</script> 
</body>
</html>