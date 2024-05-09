 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/layout.css">
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<title>map</title>
</head>
<body>
	<div id="map" style="width: 300px; height: 300px; border: 1px solid black;"></div>
	<div id="add" style="width: 500px; height: 100px; border: 1px solid black;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e6b74ea4529faab016309dd56092033&libraries=services,clusterer,drawing"></script>
	<script src="resources/js/map.js"></script>
</body>
</html>