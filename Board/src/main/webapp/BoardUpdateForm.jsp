<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<h2>게시글 수정</h2>
	<%
		//해당 게시글 번호를 통하여 게시글을 수정
		int num = Integer.parseInt(request.getParameter("num").trim());
	
		//하나의 게시글에 대한 정보를 리턴
		BoardDAO bdao = new BoardDAO();
		BoardBean bean = bdao.getOneUpdateBoard(num);
	%>
		<form action="BoardUpdateProc.jsp" method="post">
		<table style="width:600; background:skyblue;" border="1">
			<tr height="40">
				<td width="120" align="center">작성자</td>
				<td width="180" align="center"><%=bean.getWriter()%></td>
				<td width="120" align="center">작성일</td>
				<td width="180" align="center"><%=bean.getReg_date()%></td>
			</tr>
			<tr height="40">
				<td width="120" align="center">제목</td>
				<td width="480" colspan="3"> &nbsp;<input type="text" name="subject" value="<%=bean.getSubject()%>"></td>
			</tr>
			<tr height="40">
				<td width="120" align="center">비밀번호</td>
				<td width="480" colspan="3"> &nbsp;<input type="password" name="password"></td>
			</tr>
			<tr height="40">
				<td width="120" align="center">글 내용</td>
				<td width="480" colspan="3"> <textarea rows="10" cols="60" name="content"><%=bean.getContent() %> </textarea> </td>
			</tr>
			<tr height="40">
				<td colspan="4" align="center">
					<input type="hidden" name="num" value="<%=num %>">
					<input type="submit" value="글 수정"> &nbsp;&nbsp;
					<input type="button" value="글 목록보기" onclick="location.href='BoardList.jsp'">
				</td>
			</tr>
		</table>
		</form>
	</div>

</body>
</html>