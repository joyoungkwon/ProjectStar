<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! String pageName = "찜 목록"; %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="stylesheet" href="resources/css/layout.css">
		<link rel="stylesheet" href="resources/css/my_view.css">
		<!-- 5. 아이콘 끌어오기 (폰트어썸)-->
		<script src="https://kit.fontawesome.com/64319e1cb9.js" crossorigin="anonymous"></script> 
		<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet"> 
	<title>찜 목록</title>
</head>

<body>
	<c:set var="pageName" value="<%=pageName %>"></c:set>
	<%@ include file="menu_bar.jsp" %>
	<div id="sec"></div>
	<div id="sec"></div>
	<div id="sec"></div>
	<div id="sec"></div>
	<div id="sec"></div>
	<div id="board_container" class="container text-center">
		<div class="row custom_row_basic" id="view_box">
			<c:forEach var="view" items="${list}" varStatus="i">
				<%@ include file="board_small.jsp" %>
			</c:forEach>
		</div>
		<!-- row 닫기 -->
	</div>
	<!-- board_container 닫기 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<!-- 부트스트랩 - 자바스크립트 : body 태그 닫는 곳 바로 앞에 위치 -->
	<script type="text/javascript" src="resources/js/view_loca.js" ></script>
	<script type="text/javascript" src="resources/js/board_view.js" ></script>
</body>
</html>