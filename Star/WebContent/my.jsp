<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! String pageName = "마이페이지"; %>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
   <link rel="stylesheet" href="resources/css/layout.css">
	<link rel="stylesheet" href="resources/css/my.css">
	<!-- 5. 아이콘 끌어오기 (폰트어썸)-->
   <script src="https://kit.fontawesome.com/64319e1cb9.js" crossorigin="anonymous"></script> 
   <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet"> 
  <title>마이페이지</title>
</head>


<body>
	<c:set var="pageName" value="<%=pageName %>"></c:set>
	<%@ include file="menu_bar.jsp" %>
	<div id="sec"></div>
	<div id="profile" class="flex flex-jus-center wid-90 mar-at" style="height: 20vh;">
		<div class="wid-90 flex flex-between">
			<div class="wid-35 hei-100 flex flex-center">
				<img id="img" class="wid-90 hei-63" src="${login_img}"></img>
			</div>
			<div class="wid-55 hei-100 ">
				<div class="wid-100 hei-50 flex flex-column flex-jus-end text-left">
					<b class="wid-50 pointer" style="font-size: 2.0vh;" onclick="location.href='my_edit.jsp'">${my.user_name} &gt;</b>
					<div class="wid-90" style="font-size: 1.5vh;">팔로워 2 | 팔로잉 10</div>
				</div>
				<div class="wid-100 hei-30 flex">
					<div class="wid-10 hei-100 flex flex-ali-center">
						<img src="resources/img/마트1.jpg" alt="tier" class="wid-100 hei-40">
					</div>
					<div class="wid-90 hei-100 flex flex-center">
						<div class="wid-90 hei-30" style="background-color: yellow;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="sec"></div>
	<div id="latest" class="flex wid-90 mar-at">
		<c:forEach var="view" items="${list }" varStatus="i">
			<div class="wid-35 flex flex-ali-center flex-jus-end">
				<div class="wid-90 flex flex-center">
					<%@ include file="board_small.jsp" %>
				</div>
			</div>
		</c:forEach>
	</div>
	<div id="sec"></div>
	<div id="link" class="flex flex-column flex-center wid-90 mar-at">
		<div onclick="location.href='my_view.jsp'">
			<p>내 리뷰 관리</p>
			<p>&gt;</p>
		</div>
		<div onclick="location.href='notification.jsp'">
			<p>내 활동</p>
			<p>&gt;</p>
		</div>
		<div onclick="location.href='my_wish_board.jsp'">
			<p>찜 목록</p>
			<p>&gt;</p>
		</div>
		<div onclick="location.href='#'">
			<p>문의</p>
			<p>&gt;</p>
		</div>
	</div>
	<script type="text/javascript" src="resources/js/view_loca.js" ></script>
	<script type="text/javascript" src="resources/js/board_view.js" ></script>
</body>

</html>