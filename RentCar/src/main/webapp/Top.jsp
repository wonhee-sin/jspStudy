<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 세션을 이용한 로그인 처리 -->
<%
	String id = (String)session.getAttribute("id");

	//로그인이 되어있지 않다면
	if(id==null){
		id = "GUEST";
	}
%>

	
<table style="width:1000px">
	<tr height="70px">
		<td colspan="4"><a href="RentcarMain.jsp"><img src="image/RENT.png" height="65px"></a></td>
		<td align="center" width="200px"><%=id %>님 반갑습니다.</td>
	</tr>
	<tr height="50px">
		<td align="center" width="200px" bgcolor="pink"><font size="5"><a href="RentcarMain.jsp?center=CarReserveMain.jsp" style="text-decoration:none; color:white;"> 예약하기</a></font></td>
		<td align="center" width="200px" bgcolor="pink"><font size="5"><a href="#" style="text-decoration:none; color:white;"> 예약확인</a></font></td>
		<td align="center" width="200px" bgcolor="pink"><font size="5"><a href="#" style="text-decoration:none; color:white;"> 자유게시판</a></font></td>
		<td align="center" width="200px" bgcolor="pink"><font size="5"><a href="#" style="text-decoration:none; color:white;"> 이벤트</a></font></td>
		<td align="center" width="200px" bgcolor="pink"><font size="5"><a href="#" style="text-decoration:none; color:white;"> 고객센터</a></font></td>
	</tr>
</table>
	
</body>
</html>