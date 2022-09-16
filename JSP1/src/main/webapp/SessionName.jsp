<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 네임 페이지 입니다.</h2>
	
	<%
		String name1 = (String)session.getAttribute("name1"); 	//object타입이므로 String타입으로 캐스팅해 주어야함.
	%>
	
	<%=name1 %>님 반갑습니다.
</body>
</html>