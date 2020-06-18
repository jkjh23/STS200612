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
				<a href="${pageContext.request.contextPath}/board/list" class="btn btn-success">전체목록</a>
				<a href="${pageContext.request.contextPath}/board/insert" class="btn btn-success">글쓰기</a>
				<a href="${pageContext.request.contextPath}/board/insertbatch" class="btn btn-success">일괄등록</a>
				<a href="${pageContext.request.contextPath}/" class="btn btn-success">홈으로</a>
			</div>
			
			<!-- 검색은 post보다 get으로 보내는 게 좋음 -->
			<form action="${pageContext.request.contextPath}/board/list" method="get">
				<input type="hidden" name="page" value="1" />
				<input type="text" name="text" class="form-control" placeholder="검색어" />
				<input type="submit" class="btn btn-success" value="검색" />
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
				<c:if test="${empty list}">
					<tr>
						<td colspan="5" align=center>검색결과가 없습니다.</td>
					</tr>
				</c:if>
		
				<c:if test="${!empty list}">
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
				</c:if>
			</tbody>
		</table>
		
		<div id="pagination-div"></div>

	</div>
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>

	<script>
		$(function(){
			$('#pagination-div').twbsPagination({
		        totalPages: Number('${cnt}'), /* 전체 페이지 수*/
		        visiblePages: 10, /*화면에 표시할 페이지 수 */
		        startPage : Number('${param.page}'), /* 주소창에 ~~/board/list?page=1 */
		        initiateStartPageClick : false,
		        onPageClick: function (event, page) {
		             window.location.href = "/board/list?page="+page+"&text=${param.text}";
		        }
		    });
		})
	</script>
	
</body>
</html>
