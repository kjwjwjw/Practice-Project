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
			<h1>대표 소개</h1>
			<table>
			<tr>
			<figure class="ceo">
				<img src="../images/company/Eui-Sun_Chung.jpg">
				<figcaption><h2>정의선</h2></figcaption>
			</figure>
			<h2>대한민국의 기업인. 현대자동차그룹 회장. </h2> <br>
			<h3>현대자동차그룹 초대 회장이자 명예회장 정몽구의 외동아들이며, 누나만 셋이 있다. <br>휘문고등학교(81회), 고려대학교 경영대학 경영학과를 졸업하였다. <br>이후 1999년에 현대자동차 상무이사로 경영수업을 시작했고, 2009년에 현대자동차그룹 부회장이 되었다. 그 후 2020년에 아버지이자 초대 회장 정몽구의 자리를 물려받아 2대 현대자동차그룹 회장이 되었다.
		<br>전북 현대 모터스, KIA 타이거즈의 구단주이며, 2005년부터는 대한양궁협회장, 아시아양궁연맹 회장도 맡고 있다.</h3>
			</tr>
			
			</table>
			
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


