<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h2>회원 정보 보기</h2>
	<%
		//post방식으로 데이터가 넘어올 때 한글이 깨질수 있기에
		request.setCharacterEncoding("EUC-KR");
		//각종 사용자로부터 넘어온 데이터를 저장해줌
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String pass_cnf = request.getParameter("pass_cnf");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		
		//[]타입으로 리턴
		String[] hobby = request.getParameterValues("hobby");
		
		String job = request.getParameter("job");
		String age = request.getParameter("age");
		String info = request.getParameter("info");	
	
		if(!pass.equals(pass_cnf)){
	%>
		<script type="text/javascript">
			alert("비밀번호가 틀립니다.");//경고창
			history.go(-1);//이전 페이지로 이동
		</script>
	<%	
		}
	%>
	
	<table>
		<tr>
			<td>아이디 : <%=id %></td>
		</tr>
		<tr>
			<td>비밀번호 : <%=pass %></td>
		</tr>
		<tr>
			<td>이메일 : <%=email %></td>
		</tr>
		<tr>
			<td>전화번호 : <%=tel %></td>
		</tr>
		<tr>
			<td>관심분야 : 
			<% 
				for(int i=0; i<hobby.length; i++){
					out.write(hobby[i] + " ");
				}
			%>
			</td>
		</tr>
		<tr>
			<td>직업 : <%=job %></td>
		</tr>
		<tr>
			<td>연령 : <%=age %></td>
		</tr>
		<tr>
			<td>하고싶은말 : <%=info %></td>
		</tr>
		
		<%= request.getProtocol() %>
		<%= request.getRemoteAddr() %>
		<%= request.getMethod() %>
		<%= request.getServerName() %>
	</table>
	
</body>
</html>