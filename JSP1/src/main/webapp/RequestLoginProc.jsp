<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- RequestLogin �Ѿ�� ���̵�� �н����带 �о���� -->
	<%
		//������� ������ ����Ǿ��ִ� ��ü request �� getParameter()�� �̿��ؼ� ������� ���� ����
		String id = request.getParameter("id"); //������� ���̵� ���� �о�鿩�� ���� id�� �����Ѵ�.
		String pass = request.getParameter("pass");
	%>
	
	<p>���̵� : <%=id %></p>
	<p>��й�ȣ : <%=pass %></p>
	
</body>
</html>