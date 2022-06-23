<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
// URL 파라미터로 전달받은 글번호(num) 와 페이지번호(page => pageNum) 를 가져와서 저장
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("page");

BoardDAO boardDAO = new BoardDAO();
// BoardDAO 객체의 updateReadcount() 메서드를 호출하여 게시물 조회수 증가
// 파라미터 : 글번호(num), 리턴 타입 :void

boardDAO.updateReadcount(num);


// => 파라미터 : 글번호(num) , 리턴타입 : BoardBean(board)
BoardBean board = boardDAO.selectBoard(num);

%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/notice_content.jsp</title>
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
			<h1>Notice Content</h1>
			<table id="notice">
				<tr>
					<th>글번호</th>
					<td><%=board.getNum() %></td>
					<th>글쓴이</th>
					<td><%=board.getName() %></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><%=board.getDate() %></td>
					<th>조회수</th>
					<td><%=board.getReadcount() %></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><%=board.getSubject() %></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><%=board.getContent() %></td>
				</tr>
			</table>

			<div id="table_search">
				<!-- 글 수정 클릭 시 notice_update.jsp 페이지로 이동(글번호, 페이지번호 전달) -->
				<input type="button" value="글수정" class="btn" 
						onclick="location.href='notice_update.jsp?num=<%=board.getNum() %>&page=<%=pageNum %>'">
				<!-- 글 수정 클릭 시 notice_delete.jsp 페이지로 이동(글번호, 페이지번호 전달) -->
				<input type="button" value="글삭제" class="btn" 
						onclick="location.href='notice_delete.jsp?num=<%=board.getNum() %>&page=<%=pageNum %>'">
				<!-- 글목록 버튼 클릭 시 notice.jsp 페이지로 이동(페이지번호 전달) --> 
				<input type="button" value="글목록" class="btn" 
						onclick="location.href='notice.jsp?page=<%=pageNum%>'">
			</div>


			<div class="clear"></div>
		</article>

		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


