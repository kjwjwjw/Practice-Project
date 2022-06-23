<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String id = request.getParameter("id");
MemberDAO memberDAO = new MemberDAO();
boolean isDuplicate = memberDAO.checkId(id);

// if(isDuplicate) {
// 	out.println("중복");
// } else {
// 	out.println("사용가능 ");
// }
// = > 단, isDuplicate 변수에 이미 중복 여부가 저장되어 있으므로
// 해당 변수값을 파라밑로 전달하여 check_id.jsp 페이지로 이동
response.sendRedirect("check_id.jsp?id=" +id + "&duplicate=" + isDuplicate);

%>