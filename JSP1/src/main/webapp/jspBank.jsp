<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%!
		public void inCrement(){
		
	}
	
	%>
	
	<%!
	 int a = 10;		//멤버 변수
	%>
	
	<%
		int a = 100;	//지역 변수
	%>
	
	<%
		//int a = 1000;	//지역변수 에러를 발생시킴
	%>
	
</body>
</html>