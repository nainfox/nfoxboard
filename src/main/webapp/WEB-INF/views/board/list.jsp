<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../include/header.jsp" />
<script type="text/javascript" src="/resources/js/jquery.bootpag.min.js"></script>
<body>
	<jsp:include page="../include/nav.jsp" />
	<!-- 게시판 -->
	<h1>게시판</h1>
	<table id="listTable">
		<thead>
			<th>번호</th>
			<th>제목</th>
			<th>작성</th>
			<th>날짜</th>
			<th>조회</th>
		</thead>
		<c:forEach var="board" items="${boardMap.boardList }">
		<tr>
			<td>${board.id }</td>
			<td><a href="/board/view?id=${board.id }">${board.title }</a></td>
			<td>${board.name }</td>
			<f:parseDate var="parsedDate" value="${board.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
			<td><f:formatDate value="${parsedDate }" pattern="MM/dd HH:mm"/></td>
			<td>${board.hit }</td>
		</tr>
		</c:forEach>
	</table>
	<div id="page-selection"></div>
	    <script>
	        // init bootpag
	        var myboot = $('#page-selection').bootpag({
			    total: ${boardMap.totalPage},
			    page: 1,
			    maxVisible: 5,
			    leaps: true,
			    firstLastUse: true,
			    first: '←',
			    last: '→',
			    wrapClass: 'pagination',
			    activeClass: 'active',
			    disabledClass: 'disabled',
			    nextClass: 'next',
			    prevClass: 'prev',
			    lastClass: 'last',
			    firstClass: 'first'
			}).on("page", function(event, num){
				var text = $('#keyword').val();
			    $.ajax({
			    	url : "/board/boardPaging",
			    	type : "post",
			    	data : {page : num, keyword : text},
			    	success : function(data){
			    		//총 페이지의 수
			    		//현재 페이지부터의 한페이지에 출력할 로우량만큼의 데이터리스트
		    			myboot.bootpag({total: data.totalPage, page : num})
			    		 //데이터 넣기
			    		 $('#listTable>tbody').empty();
							if(data.boardList.length == 0){
								$('#listTable>tbody').append('<tr><td colspan="5">조회한 결과가 없습니다.</td></tr>');
							}
							for(var i of data.boardList){
								$('#listTable>tbody').append('<tr><td>'+i.id+'</td><td><a href="/board/view?id='+i.id+'">'+i.title+'</td><td>'+i.name+'</td>'+
									'<td>'+'<f:parseDate var="parsedDate" value="${board.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/>'+
									'<f:formatDate value="${parsedDate }" pattern="MM/dd HH:mm"/>'+'</td><td>'+i.hit+'</td></tr>');	
							}
			    	}
			    })
			})
	        
	        var repaging = function(event, num){
				var text = $('#keyword').val();
			    $.ajax({
			    	url : "/board/boardPaging",
			    	type : "post",
			    	data : {page : num, keyword : text},
			    	success : function(data){
			    		//총 페이지의 수
			    		//현재 페이지부터의 한페이지에 출력할 로우량만큼의 데이터리스트
			    		myboot.bootpag({total: data.totalPage, page : num})
			    		 //데이터 넣기
			    		 $('#listTable>tbody').empty();
							if(data.boardList.length == 0){
								$('#listTable>tbody').append('<tr><td colspan="5">조회한 결과가 없습니다.</td></tr>');
							}
							for(var i of data.boardList){
								$('#listTable>tbody').append('<tr><td>'+i.id+'</td><td><a href="/board/view?id='+i.id+'">'+i.title+'</a></td><td>'+i.name+'</td>'+
									'<td>'+'<f:parseDate var="parsedDate" value="${board.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/>'+
									'<f:formatDate value="${parsedDate }" pattern="MM/dd HH:mm"/>'+'</td><td>'+i.hit+'</td></tr>');	
							}
			    	}
			    })
			}
	        
	    </script>
	<div class="searchList">
		<form class="form-group text-center">
			<input type="text" id="keyword" name="keyword"
				class="form-control col-sm-4" placeholder="검색어를 입력하세요." />
			<div class="col-sm-2">
				<button type="button" onclick='repaging(event, 1);'
					class="btn btn-success">검색</button>
			</div>
		</form>
	</div>
	<button type="button" class="btn btn-primary text-right" onclick="location.href='/board/add'">글쓰기</button>

</body>
</html>