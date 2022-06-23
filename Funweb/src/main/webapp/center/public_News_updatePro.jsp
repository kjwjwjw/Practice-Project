<%@page import="publicNews.publicNewsDAO"%>
<%@page import="publicNews.publicNewsBean"%>
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
publicNewsBean publicNews = new publicNewsBean();
publicNews.setNum(num);
publicNews.setName(name);
publicNews.setPass(pass);
publicNews.setSubject(subject);
publicNews.setContent(content);


// BoardDAO 객체의 updateBoard() 메서드를 호출하여 게시물 수정 작업 요청
// 파라미터
publicNewsDAO publicnewsDAO = new publicNewsDAO();

int updateCount = publicnewsDAO.updatepublicNews(publicNews);

if(updateCount >0) {
	response.sendRedirect("publicNews_content.jsp?num=" + num +"&page=" + pageNum );
} else {
	%>
	alert("글 수정 실패!");
	history.back();
	<% } %>


%>    