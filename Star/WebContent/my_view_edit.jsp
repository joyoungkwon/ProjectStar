<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! String pageName = "리뷰 수정"; %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="stylesheet" href="resources/css/layout.css">
		<link rel="stylesheet" href="resources/css/board_view.css">
		<link rel="stylesheet" href="resources/css/my_view_edit.css">
		<link rel="stylesheet" href="resources/css/board_big.css">
		<!-- 5. 아이콘 끌어오기 (폰트어썸)-->
		<script src="https://kit.fontawesome.com/64319e1cb9.js" crossorigin="anonymous"></script> 
		<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet"> 
	<title>메인 페이지 - 카테고리 선택</title>
</head>

<body>
	<c:set var="pageName" value="<%=pageName %>"></c:set>
	<%@ include file="menu_bar.jsp" %>
	<div id="sec"></div>
	<div id="board_container" class="container text-center">
		<div class="row custom_row_basic" id="view_box">
			<div class="col-12">
				<div class="content_col_big">
					<div class="big content_head">
						<div class="profile">
							프사/유저 아이디
						</div>
					</div>
					<div class="big content_img">
						<img class="img_b_size" src="resources/img/여행지1.jpg">
					</div>
					<div class="big content_midbar">
						<i class="fa-regular fa-star fa-lg" style="color: #1d69ed;"></i>
						<!-- 찜 안 눌렀을 때-->
						<i class="fa-solid fa-star fa-lg" style="color: #1d69ed;"></i>
						<!-- 찜 눌렀을 때-->
						<i class="fa-solid fa-share-from-square fa-lg"
							style="color: #1d69ed;"></i>
						댓글,좋아요,싫어요,신뢰온도
					</div>
					<input class="big content_write" value="내용">
					<button type="submit">수정하기</button>
				</div>
			</div>
		</div>
		<!-- row 닫기 -->
	</div>
	<!-- board_container 닫기 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<!-- 부트스트랩 - 자바스크립트 : body 태그 닫는 곳 바로 앞에 위치 -->
</body>
</html>