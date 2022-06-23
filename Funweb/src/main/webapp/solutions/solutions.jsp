<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>company/welcome.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더 들어가는곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문 메인 이미지 -->
		<div id="sub_img"></div>
		<!-- 왼쪽 메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="solutions.jsp">Avante</a></li>
				<li><a href="solutions_grandeur.jsp">Grandeur</a></li>
				<li><a href="solutions_sonata.jsp">sonata</a></li>
				<li><a href="solutions_staria.jsp">Staria</a></li>
				
			</ul>
		</nav>
		<!-- 본문 내용 -->
		<article>
			<h1>Avante</h1>
			<figure class="ceo">
				<img src="../images/avante-icons.png">
				<figcaption>Avante</figcaption>
			</figure>
			<h2>10.25인치 풀 컬러 클러스터
			<br>음성인식 차량제어
			<br>개인화 프로필
			<br>공기 청정 시스템
			<br>운전석 10way & 동승석4way 전동시트
			<br>운전석 자세 메모리 시스템
			</h2>
			
		
			
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>