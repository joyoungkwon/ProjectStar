<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 1. 반응형 meta 태그 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<!-- 2. 부트스트랩 CDN 링크 -->
	<link rel="stylesheet" href="resources/css/layout.css">
	<link rel="stylesheet" href="resources/css/board_big.css">
	<link rel="stylesheet" href="resources/css/board_small.css">
	<link rel="stylesheet" href="resources/css/board_view.css">
	<link rel="stylesheet" href="resources/css/board_write.css">
	<!-- jQ -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<!-- 3. 내 스타일은 부트스트랩 스타일 뒤에 -->
	<!-- 4. 자바스크립트 -->
	<script src="https://kit.fontawesome.com/64319e1cb9.js" crossorigin="anonymous"></script> 
	<!-- 5. 아이콘 끌어오기 (폰트어썸)-->
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet"> 
	<!-- 6. 구글 폰트 -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
	<title>상세보기</title>
</head>
<body>
	<%@ include file="menu_bar.jsp" %>
	<div id="sec"></div>
	<div id="board_container" class="container text-center">
		<div class="row custom_row_basic" id="view_box">
			<%@ include file="board_big.jsp" %>
		</div> <!-- /.row -->
	</div> <!-- /#board_container -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<!-- 부트스트랩 - 자바스크립트 : body 태그 닫는 곳 바로 앞에 위치 -->
	<script type="text/javascript" src="resources/js/board_big.js" ></script>
  	<script type="text/javascript" src="resources/js/board_view.js" ></script>
</body>
</html>