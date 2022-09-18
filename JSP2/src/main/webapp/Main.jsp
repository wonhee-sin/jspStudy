<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{margin:auto;}
</style>
</head>
<body>
	<table style="width:800" border="1">
		<!-- Top -->
		<tr height="150">
			<td colspan="2"><jsp:include page="Top.jsp" /></td>
		</tr>
		
		<!-- Left -->
		<tr height="400">
			<td align="center"><jsp:include page="Left.jsp" /></td>
		
		<!-- Center -->
			<td align="center" width="600"><jsp:include page="Center.jsp" /></td>
		</tr>
		
		<!-- Bottom -->
		<tr height="100">
			<td align="center" colspan="2"><jsp:include page="Bottom.jsp" /></td>
		</tr>
	</table>
</body>
</html>