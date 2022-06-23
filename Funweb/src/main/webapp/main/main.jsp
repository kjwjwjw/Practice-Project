<%@page import="publicNews.publicNewsBean"%>
<%@page import="publicNews.publicNewsDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main/main.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<%@ include file="../inc/top.jsp" %>
		<!-- 헤더 들어가는곳 -->
		  
		<div class="clear"></div>   
		<!-- 본문들어가는 곳 -->
		<!-- 메인 이미지 -->
		<div id="main_img"><img src="../images/avante_newmain.jpg" width="100%" height="100%">
							
		</div>
		<!-- 본문 내용 -->
		<article id="front">
		  	<div id="solution">
		  		<div id="hosting">
		  		<a href="../solutions/solutions.jsp">
		  		<img src="../images/avante-icons.png" width="230px" height="150px"></a>
		  		<a href="../solutions/solutions_grandeur.jsp">
		  		<img src="../images/grandeur-icons.png" width="230px" height="150px"></a>
		  		<a href="../solutions/solutions_sonata.jsp">
		  		<img src="../images/sonata-icons.png" width="230px" height="150px"></a>
		  		<a href="../solutions/solutions_staria.jsp">
		  		<img src="../images/staria-icons.png" width="230px" height="150px"></a>
		  		</div>
		  	</div>
		  	<div class="clear"></div>
			<div id="news_notice">
				<h3><span class="brown">  Question</h3>
				<table>
				<% 
 		  			publicNewsDAO publicnewsDAO = new publicNewsDAO();
					ArrayList<publicNewsBean> publicNewsList = publicnewsDAO.selectRecentpublicNewsList();
					
					for(publicNewsBean publicNews : publicNewsList) {
				%>
							<tr onclick="location.href='../center/public_News_content.jsp?num=<%=publicNews.getNum() %>&page=1'">
							<td width="320" class="contxt">	<%=publicNews.getSubject() %></td>
							<td width="80"><%=publicNews.getName() %></td>
							<td width="80"><%=publicNews.getDate() %></td>
						</tr>
					<%
					} 
					%>
					</table>
				
				
			</div>
		
			<div id="news_notice">
		  		<h3 class="brown">Security 	</span>  News</h3>
		  		
		  		<table>
		  			<% 
 		  			// BoardDAO 객체의 selectRecentBoardList() 메서드를 호출하여 최근 게시물 5개 조회 요청 
 					// => 파라미터 : 없음    리턴타입 : ArrayList<BoardBean>(boardList) 
					BoardDAO boardDAO = new BoardDAO();
					ArrayList<BoardBean> boardList = boardDAO.selectRecentBoardList();
					
					for(BoardBean board : boardList) {
					%>
						<!-- 게시물 행 클릭 시 notice_content.jsp 페이지로 이동(해당 게시물 표시) -->
					
							<tr onclick="location.href='../center/notice_content.jsp?num=<%=board.getNum() %>&page=1'">
							<td width="320" class="contxt">	<%=board.getSubject() %></td>
							<td width="80"><%=board.getName() %></td>
							<td width="80"><%=board.getDate() %></td>
						</tr>
					<%
					} 
					%>
				</table>

			</div>
	  	</article>
		  
		<div class="clear"></div> 
		<!-- 푸터 들어가는곳 -->
<%-- 		<jsp:include page="../inc/bottom.jsp"/>  --%>
	<%@ include file="../inc/bottom.jsp"%>
	</div>
</body>
</html>


