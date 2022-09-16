<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("EUC-KR"); //사실 get방식이라 안써줘도 됨
		
		
	%>
	
	<h2><%= request.getParameter("id") %>님 반갑습니다.</h2>
</body>
</html>