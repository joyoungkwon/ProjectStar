<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${i.first}">
	<link rel="stylesheet" href="resources/css/board_small.css">
</c:if>
<div class="col-6 flex flex-center ${view.open}" onclick="loca(${view.no})">
	<div class="content_col_small event_small">
		<div class="img_s_box flex">
			<img class="img_s_size" src="resources/img/board/${view.file_name[0] }">
			<img class="img_s_size" src="resources/img/none.png">
		</div>
		<div class="div_hover">
			<div class="title">${view.title }</div>
			<div class="hei-17"></div>
			<div class="content">${view.content }</div>
			<div class="hei-17"></div>
			<div class="hit_good">
                <i class="fa-solid fa-thumbs-up fa-sm" style="color: #651ded;"></i> ${view.good_count} <!-- 좋아요--> &nbsp;
				<i class="fa-solid fa-thumbs-down fa-sm" style="color:  #651ded;"></i> ${view.bad_count} <!-- 싫어요--> &nbsp;
				<i class="fa-solid fa-eye fa-sm" style="color: #651ded;"></i> ${view.view_count} <!--조회수--> &nbsp;
			</div>
		</div>
	</div>
	<!-- content_col_small 닫기 -->
</div>
<!-- col-6 닫기 -->