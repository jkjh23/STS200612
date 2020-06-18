<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>게시판</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet"/>
</head>

<body>
	<div class="container">
		
		<%@ include file="/WEB-INF/views/menu.jsp" %>
		
		<div class="form-inline">
			<div style="margin-right:30px">
				<a href="${pageContext.request.contextPath}/board/insert" class="btn btn-success">글쓰기</a>
			</div>
			
			<form action="" method="post">
				<input type="text" class="form-control" placeholder="검색어"/>
				<input type="submit" class="btn btn-success" value="검색"/>
			</form>
		</div>
		
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>날짜</th>
				</tr>	
			</thead>
			
			<tbody>
				<c:forEach var="tmp" items="${list}" >
				<tr>
					<td>${tmp.brd_no}</td>
					<td>
						<a href="/board/content?no=${tmp.brd_no}">${tmp.brd_title}</a>
					</td>
					<td>${tmp.brd_id}</td>
					<td><fmt:formatNumber value="${tmp.brd_hit}" pattern="#,###"/></td>
					<td>
						<!-- String[] dt = tmp.brd_date.split(" ")	: 자바식 표현 -->
						<c:set var="dt" value="${fn:split(tmp.brd_date, ' ')}" />
						${dt[0]}
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
				<nav aria-label="Page navigation example">
					<ul class="pagination">
					    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
					    
					    <c:forEach var="i" begin="1" end="${cnt}" step="1">
					    	<li class="page-item"><a class="page-link" href="/board/list?page=${i}">${i}</a></li>
					    </c:forEach>
						    
					    <li class="page-item"><a class="page-link" href="#">Next</a></li> &nbsp
					   	<a class="btn btn-primary" href="/board/insertbatch" role="button">일괄등록 </a> &nbsp
					   	<a class="btn btn-primary" href="/" role="button">홈으로</a>
					</ul>
				</nav>
	</div>
</body>
</html>