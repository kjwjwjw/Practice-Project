<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String isDuplicate = request.getParameter("duplicate");
String id = request.getParameter("id");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function useId(id) {
		// 자식창에서 부모창을 제어하려면 window.opener.xxx 형태로 제어
		window.opener.document.fr.id.value = id;
		// 2. 부모차의 전역변수 값을 checkIdResult 값을 true로 변경
		window.opener.checkIdResult = true;
		
		window.close();
	}
	
	function checkId(id) {
		var divCheckIdResult = document.getElementById("checkIdResult");
		// 정규표현식을 통해 id 규칙 판별
		var regex = /^[A-Za-z0-9]{4,16}$/;
		if(!regex.exec(id)) {
			divCheckIdResult.innerHTML
			divCheckIdResult.style.color = "RED";
		} else {
			divCheckIdResult.innerHTML = "";
		}
	}
	
	
	// onsubmit 을 통해 아이디 검증을 수행할 경우
	function checkId2() {
		var divCheckIdResult = document.getElementById("checkIdResult");
		var id = document.getElementById("id").value;
		// 정규표현식을 통해 id 규칙 판별
		var regex = /^[A-Za-z0-9]{4,16}$/;
		if(!regex.exec(id)) {
			divCheckIdResult.innerHTML = "4 ~ 16자리 영문자, 숫자 조합!";
			divCheckIdResult.style.color = "RED";
			return false; // submit 동작 취소
		} else {
			divCheckIdResult.innerHTML = "";
			return true; // submit 동작 수행
		}
		
	}
</script>
</head>
<body>
	<h1>아이디 중복 체크</h1>
	<form action = "check_id_pro.jsp" onsubmit="return checkId2()">
		
		<input type="text" name="id" <% if(id != null) { %> value="<%=id %>" <%} %>required="required" placeholder="영문,숫자 4~16글자" >
		
		<input type="submit" value="중복확인">
	</form>
	<div id="checkIdResult">
	<!-- 중복체크 결과 표시 위치 --> 
	<%if (isDuplicate != null && isDuplicate.equals("true")) {%>
		<br>이미 사용중인 아이디입니다.
	<%} else if (isDuplicate != null && isDuplicate.equals("false")) { %>
		 <br>사용 가능한 아이디.
		 <!-- 버튼 클릭 시 useId() 함수 호출(파라미터로 자바의 변수 id값을 문자로 전달) -->
		 <input type="button" value="아이디 사용" onclick="useId('<%=id%>')">
	<%} %>
	</div>

</body>
</html>