<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%--  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
    
 <%
 
 String id = (String)session.getAttribute("sId"); // Object -> String 형변환 필요
 %>
<header>
  <div id="login">
  		<!--  세션 아이디("sId") 유무에 따라 서로 다른 링크 표시 -->
  		
  		<% if(id == null) { %>
  		<a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a>
  		<%} else { %>
  		<a href="../member/member_info.jsp"><%=id %></a> 
  		| <a href="../member/logout.jsp">logout</a>
  		<% if(id.equals("admin")) {%>
  		 | <a href="../admin/admin.jsp">관리자 페이지</a>
 		<% } %>
 		<% } %>
 		
<!--  		if~else 문 대신 c:choose, c:when, c:otherwise 태그 활용 -->
<!-- EL 사용하여 세션 객체에 접근하기 위해서는 sessionScope.속성명으로 접근 필요 -->
<%--   		<c:choose> --%>
<%--   			<c:when test="${empty sessionScope.sId }">  --%>
<!--   			<a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a> -->
<%--   			</c:when> --%>
<%--   			<c:otherwise> --%>
<!--   				<a href="#">xxx님</a> | <a href="../member/logout.jsp">logout</a> -->
<%--   			</c:otherwise> --%>
<%--   		</c:choose> --%>
  
  </div>
  <div class="clear"></div>
  <!-- 로고들어가는 곳 -->
  <div id="logo"><img src="../images/logo4.jpg" width="250" height="50" ></div>
  <!-- 메뉴들어가는 곳 -->
  <nav id="top_menu">
  	<ul>
  		<li><a href="../main/main.jsp">HOME</a></li>
  		<li><a href="../solutions/solutions.jsp">모델</a></li>
  		<li><a href="../center/notice.jsp">고객지원</a></li>
  		<li><a href="../company/welcome.jsp">회사소개</a></li>
  		<li><a href="../mail/mailForm.jsp">CONTACT US</a></li>
  	</ul>
  </nav>
</header>