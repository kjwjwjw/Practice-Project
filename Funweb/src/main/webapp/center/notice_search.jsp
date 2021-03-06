<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String search = request.getParameter("search");
String searchType = request.getParameter("searchType");

int pageNum = 1; // 현재 페이지 번호를 저장할 변수 선언. 기본값 1설정
// 현재 페이지 번호가 저장된 page 파라미터에서 값을 가져와서 pageNum 변수에 저장
// 단, pasge 파라마터가 존재할 경우에만 가져오기
if(request.getParameter("page") != null) {
	pageNum = Integer.parseInt(request.getParameter("page")); // String -> int 형변환 필요
			
}
int listLimit = 10; // 한 페이지 당 표시할 목록(게시물) 갯수
int pageLimit = 10; // 한 페이지 당 표시할 페이지 갯수

// BoardDAO 객체의 selectBoardList 
//----------------------------------------------------------------------------------

//BoardDAO 객체의 selectBoardList() 메서드를 호출하여 게시물 목록 조회 작업 요청
//=> 파라미터 : 현재 페이지 번호(pageNum) , 표시할 목록 갯수(listLimit) ,검색어(search)
//	  리턴타입 : ArrayList<BoardBean> (boardList)
		

BoardDAO boardDAO = new BoardDAO();
int listCount = boardDAO.selectSearchListCount(search,searchType);

// => 총 게시물 수 // 페이지 당 표시할 게시물 수 + 0.9
int maxPage = (int)Math.ceil((double)listCount / listLimit );

// 2. 현재 페이지에서 보여줄 시작 페이지 번호(1,11,12 등의 시작 번호 ) 계산
int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;

// 3. 현재 페이지에서 보여줄 끝 페이지 번호(10,20,30 등의 끝 번호) 계산
int endPage = startPage + pageLimit - 1;

// 4. 만약, 끝 페이지(endPage)가 현재 페이지에서 표시할 총 페이지 수 보다 클 경우
// 	 	끝 페이지 번호를 총 페이지 수로 대체

if(endPage > maxPage) {
	endPage = maxPage;
}

ArrayList<BoardBean> boardList = boardDAO.selectSearchBoardList(pageNum,listLimit, search,searchType);


%>	
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/notice_search.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
	<h1>페이지번호 : <%=pageNum %></h1>
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
			<h1>Notice</h1>
			<table id="notice">
				<tr>
					<th class="tno">No.</th>
					<th class="ttitle">Title</th>
					<th class="twrite">Write</th>
					<th class="tdate">Date</th>
					<th class="tread">Read</th>
				</tr>
				<!-- 반복문을 사용하여 ArrayList 객체만큼 반복하면서 -->
				<!-- ArrayList 객체 내의 BoardBean 객체를 꺼내서 저장한 후 -->
				<!-- 각 레코드를 tr 태그의 td 태그에 출력하기 -->
				<%
				
				
				
				for(BoardBean board : boardList) {
					%>
				
			
				<tr onclick="location.href='notice_content.jsp?num=<%=board.getNum() %>&page=<%=pageNum %>'">
				 	<td><%=board.getNum() %></td>
					<td class="left"><%=board.getSubject() %></td>
					<td><%=board.getName() %></td>
					<td><%=board.getDate() %></td>
					<td><%=board.getReadcount() %></td>
				</tr>
				
				<% 
				}
				
				%>
				
				
			</table>
			<div id="table_search">
				<input type="button" value="글쓰기" class="btn" onclick="location.href='notice_write.jsp'">
			</div>
			<div id="table_search">
				<form action="notice_search.jsp" method="get">
				<select name="searchType">
					<option value="subject">제목</option>
					<option value="name" <%if(searchType.equals("name")) { %> selected="selected" <%} %>>작성자</option>
				</select>
					<input type="text" name="search" class="input_box" value="<%=search%>">
					<input type="submit" value="Search" class="btn">
				</form>
			</div>
			
<!-- 			페이징 처리  -->
			<div class="clear"></div>
			<div id="page_control">
<!-- 				페이징 처리 시 링크에 notice.jsp 대신 notice_search.jsp  -->
				<!-- 현재 페이지 번호(pageNum)가 1보다 클 경우에만 Prev 링크 동작
				=> 클릭 시 현재 페이지 번호(pageNum) -1 값을 파라미터로 전달
				 -->
				 <%if(pageNum>1) { %>
				 	<a href="notice_search.jsp?page=<%=pageNum -1%>&search=<%=search %>&searchType=<%=searchType%> ">Prev</a>
				 <%} else { %>
					Prev&nbsp;
				 <%} %>
				 
				 <% for(int i=startPage;i<endPage;i++) {%> 
					<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
					<%if(pageNum == i) { %>
						&nbsp;&nbsp;<%=i %> &nbsp;&nbsp;
					<%} else { %>
						<a href="notice_serach.jsp?page=<%=i%>&search=<%=search %>&searchType=<%=searchType%>"><%=i %></a>
					<%} %>

				<%} %> 
				
				
				
				<%if(pageNum<maxPage) { %>
				 	<a href="notice_search.jsp?page=<%=pageNum +1%>&search=<%=search %>&searchType=<%=searchType%> ">Next</a>
				 <%} else { %>
					&nbsp;Next
				 <%} %>
			</div>
		</article>

		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


