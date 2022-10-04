<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String center = request.getParameter("center");
	//처음 실행시에는 center값이 넘어오지 않기에
	if(center==null){//null 처리해줌
		center = "Center.jsp";	//디폴트 center값을 부여
	}
%>
<div align="center">
<table style="width:1000px">
	<!-- Top 부분 -->
	<tr height="140px" align="center">
		<td align="center" width="1000"><jsp:include page="Top.jsp" /></td>
	</tr>
	
	<!-- Center 부분 -->
	<tr height="600" align="center">
		<td align="center" width="1000"><jsp:include page="<%=center %>" /></td>
	</tr>
	
	<!-- Bottom 부분 -->
	<tr height="140px" align="center">
		<td align="center" width="1000"><jsp:include page="Bottom.jsp" /></td>
	</tr>
</table>
</div>
</body>
</html>