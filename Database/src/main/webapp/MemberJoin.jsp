<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<h2>ȸ�� ����</h2>
	<form action="MemberJoinProc.jsp" method="post">
		<table>
			<tr>
				<td>���̵�</td>
				<td><input type="text" name="id" placeholder="id ��������"></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="pass" placeholder="��й�ȣ�� ������ ���ڸ� �־��ּ���"></td>
			</tr>
			<tr>
				<td>��й�ȣ Ȯ��</td>
				<td><input type="password" name="pass_cnf"></td>
			</tr>
			<tr>
				<td>�̸���</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td>��ȭ ��ȣ</td>
				<td><input type="tel" name="tel"></td>
			</tr>			
			<tr>
				<td>����� ���ɺо�</td>
				<td>
					<input type="checkbox" name="hobby" value="ķ��" >ķ�� &nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="���" >��� &nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="��ȭ" >��ȭ &nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="����" >���� &nbsp;&nbsp;					
				</td>
			</tr>			
			<tr>
				<td>����� ������</td>
				<td>
					<select name="job">
						<option value="����">����</option>
						<option value="��ȣ��">��ȣ��</option>
						<option value="�ǻ�">�ǻ�</option>
						<option value="�����">�����</option>
					</select>				
				</td>
			</tr>
			<tr>
				<td>����� ������</td>
				<td>
					<input type="radio" name="age" value="10">10�� &nbsp;&nbsp;		
					<input type="radio" name="age" value="20">20�� &nbsp;&nbsp;
					<input type="radio" name="age" value="30">30�� &nbsp;&nbsp;
					<input type="radio" name="age" value="40">40�� &nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td>�ϰ� ���� ��</td>
				<td><textarea rows="5" cols="40" name="info"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="ȸ������"></td>
				<td><input type="reset" value="���"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>