<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>판매량 보기</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css"	rel="stylesheet"/>
	
	<!-- 참고 : https://c3js.org/ -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.3/c3.min.css" rel="stylesheet" />
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/d3/5.9.7/d3.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.3/c3.min.js"></script>	
</head>

<body>
	<div class="container">
		<h4>chart 표시</h4>
		<div class="chart1"></div>		
	</div>
	
	<script type="text/javascript">
		$(function(){
			//restcontroller에서 값을 받아옴
			$.get('/rest/itemorder.json', function(data){
				console.log(data);
				var cnt = data.ret.length; //배열의 개수 구하기

				var tmp = [];
				for(var i=0; i<cnt; i++) {
					tmp.push([data.ret[i].itemname, data.ret[i].ordercnt])
				}
				console.log(tmp);

				var chart = c3.generate({
					bindto : '.chart1',
				    data: {
				        columns: tmp,
				        type: 'bar'
				    },
				});

			},'json');

		}); 
	</script>
</body>
</html>