<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");

int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("page");
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

// BoardBean 객체 생성하여 폼 파라미터 데이터(페이지번호 제외) 저장
BoardBean board = new BoardBean();
board.setNum(num);
board.setName(name);
board.setPass(pass);
board.setSubject(subject);
board.setContent(content);


// BoardDAO 객체의 updateBoard() 메서드를 호출하여 게시물 수정 작업 요청
// 파라미터
BoardDAO boardDAO = new BoardDAO();

int updateCount = boardDAO.updateBoard(board);

if(updateCount >0) {
	response.sendRedirect("notice_content.jsp?num=" + num +"&page=" + pageNum );
} else {
	%>
	alert("글 수정 실패!");
	history.back();
	<% } %>


%>    
    
