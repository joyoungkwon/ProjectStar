<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/menu_bar.css">
<script type="text/javascript" src="resources/js/menu_bar.js" ></script>
<div id="slide1">
	<div class="slide1_menu" onclick="closeSlide()">
		<div class="wid-10"></div>
		<button class="btn btn-info" onclick="location.href='board_write.jsp'">글작성</button>
		<button id="menu_btn" class="wid-10">
			<i class="fa-solid fa-xmark fa-lg"></i>
		</button>
	</div>
	<div class="hei-15 flex flex-center">
		<img class="hei-90" alt="logo" src="resources/img/logo.png" onclick="location.href='index.jsp'">
	</div>
	<c:if test="${not empty login_id }">
		<div class="slide1_top flex flex-column flex-center">
			<div id="menu_profile" class="flex flex-jus-center wid-90 hei-70">
				<div class="wid-90 flex flex-between">
					<div class="wid-35 hei-100 flex flex-center">
						<img id="img" class="wid-90 hei-70" src="${login_img}" style="border-radius: 50%; border: 1px solid black;"></img>
					</div>
					<div class="wid-55 hei-100 ">
						<div class="wid-100 hei-50 flex flex-column flex-jus-end text-left">
							<b class="wid-50 pointer" style="font-size: 2.0vh;" onclick="location.href='my_edit.jsp'">${login_name} &gt;</b>
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
		</div>
	</c:if>
	<div class="slide1_bottom">
		<b>신뢰온도 랭킹</b>
	</div>
</div><!-- slide 닫기 - 메뉴 버튼 누르면 나올 메뉴 div -->
<div id="slide1_background"></div><!-- 슬라이드 나올 때 뒷배경 블러 처리-->
<div id="menu_bar"><!-- 메뉴 버튼-->
	<div class="wid-15 flex flex-jus-start">
		<c:choose>
			<c:when test="${menu_btn}">
				<button id="menu_btn" onclick="history.back()">
					<i class="fa-solid fa-chevron-left fa-xl" style="color: #ffffff;"></i>
				</button>
			</c:when>
			<c:otherwise>
				<button id="menu_btn" onclick="openSlide()">
					<i class="fa-solid fa-bars fa-xl"></i>
				</button>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="all_mini">
		${pageName}
		<c:if test="${addr_bool}">
			<span id="addr_div">${addr}</span>&ensp;
			<i onclick="onMap()" class="fa-solid fa-chevron-down fa-xl" style="color: #ffffff;"></i>
		</c:if>
		<c:if test="${not empty cate_list_mini}">
		<c:forEach var="cate" items="${cate_list_mini }">
			<div onclick="scrollToCenter(this)" <c:if test="${cate.name eq cate_name}"> id="select_cate" </c:if>><i class="${cate.mark}"></i></div>
		</c:forEach>
		</c:if>
	</div> 
	<!-- 로그인 버튼 - 로그인 안 되어있을 때 My 클릭하면 로그인 페이지로 이동, 로그인 되어있을 때 클릭하면 My 페이지로 이동 -->
	<div class="wid-15 flex flex-jus-end">
		<c:choose>
			<c:when test="${pageName eq '마이페이지'}"><a id="login_btn" href='index.jsp'><i class="fa-solid fa-house fa-lg"></i></a></c:when>
			<c:when test="${empty login_id}">
				<img class="hei-6vh pointer" alt="logo" src="resources/img/logo.png" onclick="location.href='login.jsp'"></img>
			</c:when>
			<c:otherwise>
				<img class="hei-4vh pointer" alt="logo" src="${login_img}" onclick="location.href='my.jsp'" style="border-radius: 50%"></img>
			</c:otherwise>
		</c:choose>
		<img class="hei-1vh" src="resources/img/none.png"></img>
	</div>
</div>
