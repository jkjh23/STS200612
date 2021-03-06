<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>게시판 글쓰기</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet"/>
</head>

<body>
	<div class="container">
		<div style="width:1000px; padding:30px; border:1px solid #cccccc">
			<form action="${pageContext.request.contextPath}/board/insert" method="post" enctype="multipart/form-data">
				<div style="margin-bottom:10px">
					<input type="text" class="form-control" name="brd_title" placeholder="글제목" />
				</div>
				<div style="margin-bottom:10px">
					<textarea id="content" class="form-control" name="brd_content" placeholder="글내용"></textarea>
				</div>
				<div style="margin-bottom:10px">
					<input type="text" class="form-control" name="brd_id" value="${userid}" readonly />
				</div>
				<div style="margin-bottom:10px">
					<input type="file" class="form-control" name="imgs" />
				</div>	
				<hr />
				<input type="submit" class="btn btn-success" value="글쓰기 " />
			</form>
		</div>
	</div>
	
<%-- 원래 있던 소스
	<form action="/board/insert" method="post" enctype="multipart/form-data">
		<input type="text" name="brd_title" placeholder="글제목" />
		<textarea id="content" name="brd_content" placeholder="글내용"></textarea>
		<input type="text" name="brd_id" value="${userid}" readonly/>
		<input type="file" name="imgs" />			
				<!-- <input type="file" name="imgs" enctype="multipart/form-data" />  -->	
				<!-- BoardController에 @RequestParam MultipartFile[] imgs 로 되어있음  -->	
		<input type="submit" value="글쓰기 " />
	</form>
--%>
	
<%-- 게시판 포맷 수정 ver.me
	<div class= "container">
		<form action="/board/insert" method="post" enctype="multipart/form-data">
			<input type="text" class="form-control" name="brd_title" placeholder="글제목" />
			<textarea id="content" class="form-control" name="brd_content"placeholder="글내용"></textarea>
			<input type="text" class="form-control" name="brd_id" value="${userid}" readonly />
			<input type="file" name="imgs" id="imgs"/>
			<hr />
			<input type="submit" class="btn btn-success" value="글쓰기" />
			<a href="${pageContext.request.contextPath}/board/list" class="btn btn-success">글목록</a>
		</form>
	</div>
--%>
</body>
</html>