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
			<h1>Grandeur</h1>
			<figure class="ceo">
				<img src="../images/grandeur-icons.png">
				<figcaption>Grandeur</figcaption>
			</figure>
			<h3>
			스마트스트림 가솔린 2.5 엔진
			최고출력 198 PS / 6,100 rpm
			최대토크 25.3 kgf·m / 4,000 rpm
			<br>
			가솔린 3.3 엔진
			최고출력 290 PS / 6,400 rpm
			최대토크 35.0 kgf·m / 5,200 rpm
			<br>
			LPi 3.0 엔진
			최고출력 235 PS / 6,000 rpm
			최대토크 28.6 kgf·m / 4,500 rpm
			</h3>
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>