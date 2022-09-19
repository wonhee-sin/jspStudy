<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div align="center">
		<h2>세션 로그인 처리 1</h2>
	

	<%
		request.setCharacterEncoding("euc-kr");
	
		//사용자로부터 데이터를 읽어들임
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		//아이디와 패스워드를 저장 (세션은 내장객체)
		session.setAttribute("id", id);
		session.setAttribute("pass", pass);
		
		//세션의 유지시간
		session.setMaxInactiveInterval(60*2);	//2분간 아이디 유지
		
		response.sendRedirect("SessionMain.jsp");
	%>
	</div>
</body>
</html>