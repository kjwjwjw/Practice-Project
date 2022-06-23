<%@page import="publicNews.publicNewsBean"%>
<%@page import="publicNews.publicNewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 게시물 상세정보를 조회 후 편집창에 표시
// => BoardDAO 객체의 selectBoard( ) 메서드 재사용
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("page");

publicNewsDAO publicnewsDAO = new publicNewsDAO();
publicNewsBean publicNews = publicnewsDAO.selectpublicNews(num);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/public_News_update.jsp</title>
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
		<div id="sub_img_center"></div>
		<!-- 왼쪽 메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="notice.jsp">Notice</a></li>
				<li><a href="public_News.jsp">Question</a></li>
				
				
			</ul>
		</nav>
		<!-- 본문 내용 -->
		<article>
			<h1>Question_Update</h1>
			<form action="public_News_updatePro.jsp" method="post">
			<input type="hidden" name="num" value="<%=num %>">
			<input type="hidden" name="page" value="<%=pageNum %>">
				<table id="notice">
					<tr>
						<td>글쓴이</td>
						<td><input type="text" value="<%=publicNews.getName() %>" name="name" required="required"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pass" value="<%=publicNews.getPass() %>" required="required"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" value="<%=publicNews.getSubject() %> " name="subject" required="required"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="20" name="content" required="required"><%=publicNews.getContent() %></textarea></td>
					</tr>
				</table>

				<div id="table_search">
					<input type="submit" value="글수정" class="btn">
				</div>
			</form>
			<div class="clear"></div>
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>