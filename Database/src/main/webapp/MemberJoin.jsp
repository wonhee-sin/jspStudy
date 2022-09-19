<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<h2>회원 가입</h2>
	<form action="MemberJoinProc.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" placeholder="id 넣으세요"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" placeholder="비밀번호는 영문과 숫자만 넣어주세요"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pass_cnf"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td>전화 번호</td>
				<td><input type="tel" name="tel"></td>
			</tr>			
			<tr>
				<td>당신의 관심분야</td>
				<td>
					<input type="checkbox" name="hobby" value="캠핑" >캠핑 &nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="등산" >등산 &nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="영화" >영화 &nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="독서" >독서 &nbsp;&nbsp;					
				</td>
			</tr>			
			<tr>
				<td>당신의 직업은</td>
				<td>
					<select name="job">
						<option value="교사">교사</option>
						<option value="변호사">변호사</option>
						<option value="의사">의사</option>
						<option value="기술사">기술사</option>
					</select>				
				</td>
			</tr>
			<tr>
				<td>당신의 연령은</td>
				<td>
					<input type="radio" name="age" value="10">10대 &nbsp;&nbsp;		
					<input type="radio" name="age" value="20">20대 &nbsp;&nbsp;
					<input type="radio" name="age" value="30">30대 &nbsp;&nbsp;
					<input type="radio" name="age" value="40">40대 &nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td>하고 싶은 말</td>
				<td><textarea rows="5" cols="40" name="info"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="회원가입"></td>
				<td><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>