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
	<link rel="stylesheet" href="resources/css/index.css">
	<link rel="stylesheet" href="resources/css/map_wrap.css">
	<!-- 3. 내 스타일은 부트스트랩 스타일 뒤에 -->
	<script type="text/javascript" src="resources/js/index.js"></script>
	<!-- 4. 자바스크립트 -->
	<script src="https://kit.fontawesome.com/64319e1cb9.js" crossorigin="anonymous"></script> 
	<!-- 5. 아이콘 끌어오기 (폰트어썸)-->
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet"> 
	<!-- 6. 구글 폰트 -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
	<title>메인 페이지 - 카테고리 선택</title>
</head>

<body>
	<!-- a태그에 ? 필터 호출 하고  그안에 icon, text 로 jsp로 이동할 cate 
	 value 값 지정 하기 ? cate=-->
	<div id="head_menu" class="jumbotron text-center">
		<%@ include file="menu_bar.jsp" %>
		<!-- 1. menu_bar 닫기-->
		<div id="star_logo">
			<i class="fa-solid fa-star fa-fade fa-xl text-center"
				style="color: #518cf0;"></i>
		</div>
		<!-- 2. Star_Logo 닫기 - 별다별 메인 로고 (임시 아이콘)-->
		<form action="board_view.jsp">
			<div id="search_div">
				<div id="search_boxx">
					<div id="search_box">
						<input type="text" name="search_value">
						<button id="search_btn">
							<i class="fa-solid i1 fa-magnifying-glass"></i>
						</button>
						<!--검색어 버튼-->
					</div>
					<!-- 3. Search_Box 닫기 - 검색창-->
				</div>
			</div>
		</form>
		<!-- 4. search_div 닫기 -->
	</div>
	<!--head_menu 닫기-->
	<div id="sec"></div>
	<div id="category_content" class="container text-center">
		<div class="row custom_row">
			<c:forEach var="cate" items="${cate_list}">
				<div class="col-3 col-md-2 category_col">
					<div class="category_div" onclick="location.href='${cate.path}'">
						<div class="category_div_top">
							<i class="${cate.mark}"></i>
						</div>
						<div class="category_div_bottom">${cate.name}</div>
					</div>
				</div>
			</c:forEach>
		</div> <!-- row 닫기 -->
	</div> <!-- container 닫기 -->
	<!-- 주소 검색창 -->
	<div class="black_bg"></div>
	<form action="index.jsp" class="modal_wrap flex flex-column flex-ali-center">
		<div class="wid-90 flex flex-jus-end">
			<button type="button" class="modal_close" onclick="offMap()">X</button>
		</div>
		<input type="text" id="add_input" name="addr" class="wid-90" readonly>
		<div id="map_box" class="wid-90 hei-100 flex flex-center">
			<div id="map" class="wid-100 hei-80"></div>
		</div>
		<button id="complete_search_btn">변경하기</button>
	</form>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e6b74ea4529faab016309dd56092033&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript" src="resources/js/map.js" ></script>
	<script type="text/javascript" src="resources/js/my_edit.js" ></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<!-- 부트스트랩 - 자바스크립트 : body 태그 닫는 곳 바로 앞에 위치 -->
</body>
</html>