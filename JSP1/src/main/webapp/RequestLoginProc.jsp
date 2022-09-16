<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- RequestLogin 넘어온 아이디와 패스워드를 읽어들임 -->
	<%
		//사용자의 정보가 저장되어있는 객체 request 의 getParameter()를 이용해서 사용자의 정보 추출
		String id = request.getParameter("id"); //사용자의 아이디 값을 읽어들여서 변수 id에 저장한다.
		String pass = request.getParameter("pass");
	%>
	
	<p>아이디 : <%=id %></p>
	<p>비밀번호 : <%=pass %></p>
	
</body>
</html>