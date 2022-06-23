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
			<h1>Staria</h1>
			<figure class="ceo">
				<img src="../images/staria-icons.png">
				<figcaption>Staria</figcaption>
			</figure>
			<h3>
			디젤 VGT 2.2
			최고출력 177 PS / 3,800 rpm
			최대토크 44.0 kgf·m / 1,500 ~ 2,500 rpm
			복합연비 11.8 km/ℓ
			(6단 수동변속기, 투어러 11인승, 2WD, 17인치 타이어, 빌트인 캠 미적용 기준)
			<br>
			스마트스트림 LPG 3.5
			최고출력 240 PS / 6,000 rpm
			최대토크 32.0 kgf·m / 4,500 rpm
			복합연비 6.7 km/ℓ
			(8단 자동변속기, 투어러 11인승, 2WD, 18인치 타이어, 빌트인 캠 적용 기준)</h3>
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>