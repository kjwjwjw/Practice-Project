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
				<li><a href="welcome_welcome.jsp">Welcome</a></li>
				<li><a href="welcome_History.jsp">History</a></li>
		
			</ul>
		</nav>
		<!-- 본문 내용 -->
		<article>
			<h1>경영철학</h1>
			<h2> Management Philsophy</h2> 
			<h3> 창의적 사고와 끝없는 도전을 통해 새로운 미래를 참조함으로써 인류 사회의 꿈의 실력한다</h3>
			
			<img src ="../images/historylogo.jpg">
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>
