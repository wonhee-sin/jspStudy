<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h2>ȸ�� ���� ����</h2>
	<%
		//post������� �����Ͱ� �Ѿ�� �� �ѱ��� ������ �ֱ⿡
		request.setCharacterEncoding("EUC-KR");
		//���� ����ڷκ��� �Ѿ�� �����͸� ��������
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String pass_cnf = request.getParameter("pass_cnf");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		
		//[]Ÿ������ ����
		String[] hobby = request.getParameterValues("hobby");
		
		String job = request.getParameter("job");
		String age = request.getParameter("age");
		String info = request.getParameter("info");	
	
		if(!pass.equals(pass_cnf)){
	%>
		<script type="text/javascript">
			alert("��й�ȣ�� Ʋ���ϴ�.");//���â
			history.go(-1);//���� �������� �̵�
		</script>
	<%	
		}
	%>
	
	<table>
		<tr>
			<td>���̵� : <%=id %></td>
		</tr>
		<tr>
			<td>��й�ȣ : <%=pass %></td>
		</tr>
		<tr>
			<td>�̸��� : <%=email %></td>
		</tr>
		<tr>
			<td>��ȭ��ȣ : <%=tel %></td>
		</tr>
		<tr>
			<td>���ɺо� : 
			<% 
				for(int i=0; i<hobby.length; i++){
					out.write(hobby[i] + " ");
				}
			%>
			</td>
		</tr>
		<tr>
			<td>���� : <%=job %></td>
		</tr>
		<tr>
			<td>���� : <%=age %></td>
		</tr>
		<tr>
			<td>�ϰ������ : <%=info %></td>
		</tr>
		
		<%= request.getProtocol() %>
		<%= request.getRemoteAddr() %>
		<%= request.getMethod() %>
		<%= request.getServerName() %>
	</table>
	
</body>
</html>