<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${i.first}">
	<link rel="stylesheet" href="resources/css/board_big.css">
</c:if>
<div class="col-12">
	<div class="content_col_big">
		<div class="big content_head">
			<div class="write_head flex wid-100 hei-90 flex-ali-center">
				<div class="profile">
					<img alt="profile" src="${view.img}" style="width: 100%;">
				</div>
				<div id="user_id">${view.id }</div>
				<c:choose>
					<c:when test="${edit}">
						<div class="pointer" onclick="document.editFrm.submit()" style="color: white;">완료</div>
					</c:when>
					<c:when test="${login_id eq view.id && not empty param.no}">
						<a href="board_view_edit.jsp?no=${param.no}" style="color: white;">수정</a>
					</c:when>
				</c:choose>
			</div>
		</div>
		
		<div class="big content_img" onclick="loca(${view.no})">
			<!-- 슬라이드 캐러셀-->
           	<div id="carousel" class="carousel slide">
                <!-- 하단 위치 표시 (인디케이터)-->
                <div class="carousel-indicators"> <!-- 안에 반복문 (0일때 class="active" 주기)-->
                	<c:forEach var="file" items="${view.file_name }" varStatus="i">
	                	<button type="button" data-bs-target="#carousel" data-bs-slide-to="${i.index }" <c:if test="${i.first}">class="active"</c:if> aria-current="true" aria-label="Slide ${i.count }"></button>
                	</c:forEach>
                </div> <!-- carousel-indicators 닫기 -->

				<div class="carousel-inner hei-100 flex flex-ali-center">
					<c:forEach var="file" items="${view.file_name }" varStatus="i">
						<!-- 안에 반복문 (0일때 class="active" 주기)-->
						<div class="carousel-item <c:if test="${i.first}">active</c:if>">
							<div id="carImg">
								<div>
									<img src="resources/img/board/${file }" class="d-block w-100 img_b_size" alt="First slide">
								</div>
							</div>
						</div>
					</c:forEach>
				</div> <!-- carousel-inner 닫기 -->
                <!--왼쪽 오른쪽 화살표 버튼-->
				<button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<!--왼쪽 < -->
				<button class="carousel-control-next" type="button" data-bs-target="#carousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
				<!-- 오른쪽 > -->
			</div> <!-- 슬라이드 캐러셀 끝 --> 
		</div>
		
		<div class="big content_midbar">
			
			<div <c:if test="${not empty login_id }">onclick="favoriteChange(this, ${view.no})"</c:if> id="${fn:contains(view.favorite_list, login_id)}" >
			<c:choose>
				<c:when test="${not empty login_id and fn:contains(view.favorite_list, login_id)}">
					<!-- 찜 눌렀을 때 -->
					<i class="fa-solid fa-star fa-lg" style="color: #1d69ed;"></i>
				</c:when>
				<c:otherwise>
					<!-- 찜 안 눌렀을 때-->
					<i class="fa-regular fa-star fa-lg" style="color: #1d69ed;"></i>
				</c:otherwise>
			</c:choose>
			</div>
			
			<div class="flex flex-ali-center" <c:if test="${not empty login_id }">onclick="GoodChange(this, ${view.no})"</c:if> id="${fn:contains(view.good_list, login_id)}" >
			<c:choose>
				<c:when test="${not empty login_id and fn:contains(view.good_list, login_id)}">
					<!-- 좋아요 눌렀을 때 -->
					<i class="fa-solid fa-thumbs-up fa-lg" style="color: #1d69ed;"></i>
				</c:when>
				<c:otherwise>
					<!-- 좋아요 안 눌렀을 때-->
					<i class="fa-regular fa-thumbs-up fa-lg" style="color: #1d69ed;"></i>
				</c:otherwise>
			</c:choose>
			</div>
			<div>${view.good_count }</div>
			
			<div class="flex flex-ali-center" <c:if test="${not empty login_id }">onclick="BadChange(this, ${view.no})"</c:if> id="${fn:contains(view.bad_list, login_id)}" >
			<c:choose>
				<c:when test="${not empty login_id and fn:contains(view.bad_list, login_id)}">
					<!-- 싫어요 눌렀을 때 -->
					<i class="fa-solid fa-thumbs-down fa-lg" style="color: #1d69ed;"></i>
				</c:when>
				<c:otherwise>
					<!-- 싫어요 안 눌렀을 때-->
					<i class="fa-regular fa-thumbs-down fa-lg" style="color: #1d69ed;"></i>
				</c:otherwise>
			</c:choose>
			</div>
			<div>${view.bad_count }</div>
			
			<i class="fa-solid fa-share-from-square fa-lg"
				style="color: #1d69ed;"></i>
			<!-- 공유 버튼-->
			<div class="hit">
				<i class="fa-regular fa-eye fa-lg" style="color: #1d69ed;"></i>${view.view_count}
			</div>
		</div>
		
		<div class="big content_write">
			<c:choose>
				<c:when test="${edit}">
					<form action="edit.board" method="post" name="editFrm" class="wid-100 hei-15vh" id="big-content">
						<input type="hidden" name="no" value="${param.no }">
						<textarea class="wid-100 hei-100" style="resize: none;" name="content">${view.content}</textarea>
					</form>
				</c:when>
				<c:otherwise>
					<div class="wid-100" id="big-content">
						<div class="real_text">${view.content}</div>
		           		<div class="more-text" onclick="moretxt(this)" id="true">더보기</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="hei-1vh"></div>
		<div class="big content_comment">
			<c:if test="${not empty login_id}">
				<!--  댓글 달기 -->
				<div class="wid-100 hei-4vh flex flex-ali-center">
					<div class="hei-100 flex wid-100">
						<input type="hidden" name="no" value="${view.no}">
						<div class="cmt_1 wid-85">
							<input id="reply_write" class="form-control form-control-sm" type="text" placeholder="댓글을 입력해주세요.">
						</div> <!-- 1 (width가 85) -->
						<div class="wid-15">
							<button onclick="reply(${view.no})" class="btn btn-light wtn">등록</button>
						</div> <!-- 2 (width가 15)-->
					</div>
				</div>  <!-- 댓글 달기 끝 -->
			</c:if>
			<div class="hei-1vh"></div>
			<div class="big content_comment">
				<div class="comment">
					<c:forEach var="reply" items="${view.reply_list }">
						<div class="wid-100 flex flex-ali-center">
							<div class="wid-3"></div>
							<i class="fa-regular fa-comment fa-lg" style="color: #1d69ed;"></i>
							<div class="wid-2"></div>
							${reply.content}
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<div class="hei-2vh"></div>
	</div>
</div>
