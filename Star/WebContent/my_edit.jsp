<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! String pageName = "내정보관리"; %>
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<link rel="stylesheet" href="resources/css/layout.css">
	<link rel="stylesheet" href="resources/css/my_edit.css">
	<link rel="stylesheet" href="resources/css/map_wrap.css">
	<!-- 5. 아이콘 끌어오기 (폰트어썸)-->
	<script src="https://kit.fontawesome.com/64319e1cb9.js" crossorigin="anonymous"></script> 
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet"> 
	<title>내정보관리</title>
</head>

<body>
	<c:set var="pageName" value="<%=pageName %>"></c:set>
	<%@ include file="menu_bar.jsp" %>
	<div id="sec"></div>
	<div id="top" class="wid-90 hei-15vh mar-at flex">
		<div class="wid-5"></div>
		<div class="wid-90 hei-100 flex flex-column">
			<div id="div_top">
				<div></div>
				<a href="logout.member" id="link">로그아웃 ></a>
			</div>
			<div class="flex flex-ali-center hei-60 wid-100">
				<img id="img" src="${login_img}"></img>
				<div class="wid-7_5"></div>
				<div class="text-left wid-60 font-20v">${login_name }님</div>
			</div>
			<div id="div_top">
			</div>
		</div>
		<div class="wid-5"></div>
	</div>
	<div id="sec"></div>
	<div id="addr" class="wid-90 hei-10vh mar-at flex">
		<div class="wid-5"></div>
		<div class="wid-90 flex flex-column">
			<div id="div_top" class="border">
				<p>우리 동네</p>
				<div onclick="onMap()" id="link" class="pointer">동네변경 ></div>
			</div>
			<div id="add" class="hei-100 flex flex-ali-center font-15v">${my.addr}</div>
		</div>
		<div class="wid-5"></div>
	</div>
	<div id="sec"></div>
	<div id="hi" class="wid-90 hei-20vh mar-at flex">
		<div class="wid-5"></div>
		<div class="wid-90 flex flex-column">
			<div id="div_top" class="border">
				<p>인사말</p>
				<button id="link" onclick="able(this)">인사말수정 ></button>
			</div>
			<form action="edit_intro.member" class="hei-100 wid-100" name="intro_frm" method="post">
				<input id="intro" name="intro" class="hei-100 wid-100 font-15v" value="${my.intro}" disabled>
				<input name="login_user" type="hidden" value="${login_id}">
			</form>
			<div id="div_top"></div>
		</div>
		<div class="wid-5"></div>
	</div>
	
	<!-- 주소 검색창 -->
	<div class="black_bg"></div>
	<form action="add_change.member" class="modal_wrap flex flex-column flex-ali-center">
		<div class="wid-90 flex flex-jus-end">
			<button type="button" class="modal_close" onclick="offMap()">X</button>
		</div>
		<input type="text" id="add_input" name="addr" class="wid-90" readonly>
		<div id="map_box" class="wid-90 hei-100 flex flex-center">
			<div id="map" class="wid-100 hei-80"></div>
		</div>
		<button id="complete_search_btn">변경하기</button>
	</form>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e6b74ea4529faab016309dd56092033&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript" src="resources/js/map.js" ></script>
	<script type="text/javascript" src="resources/js/my_edit.js" ></script>
</body>

</html>