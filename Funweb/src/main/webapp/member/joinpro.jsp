<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

   
<%
	request.setCharacterEncoding("UTF-8");

	String id= request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String postcode = request.getParameter("postcode");
	String address = request.getParameter("address") + request.getParameter("detailAddress");
	String phone = request.getParameter("phone");
	String mobile = request.getParameter("mobile");
	
	
	MemberBean member = new MemberBean();
	member.setId(id);
	member.setPass(pass);
	member.setName(name);
	member.setEmail(email);
	member.setPostcode(postcode);
	member.setAddress(address);
	member.setPhone(phone);
	member.setMobile(mobile);
	
	MemberDAO memberdao = new MemberDAO();
	
	int insertCount = memberdao.insertMember(member);
			 
	if(insertCount > 0) {
		response.sendRedirect("joinSuccess.jsp");
	} else { %>
		
		<script>
		
		alert("회원 가입 실패!");
		history.back();
        </script>
	<% } %>
	
%>
