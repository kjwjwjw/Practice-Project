<%@page import="publicNews.publicNewsBean"%>
<%@page import="publicNews.publicNewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
request.setCharacterEncoding("UTF-8");

publicNewsBean publicnews = new publicNewsBean();
publicnews.setName(request.getParameter("name"));
publicnews.setPass(request.getParameter("pass"));
publicnews.setSubject(request.getParameter("subject"));
publicnews.setContent(request.getParameter("content"));



publicNewsDAO publicnewsDAO = new publicNewsDAO();
int insertcount = publicnewsDAO.insertpublicNews(publicnews);


if(insertcount > 0) {
	response.sendRedirect("public_News.jsp");
	
} else { %>
	<script>
	alert("글쓰기 실패!");
	history.back();
	</script>



<%}%>