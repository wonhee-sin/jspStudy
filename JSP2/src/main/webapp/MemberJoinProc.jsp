<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{text-align: center;}
</style>
</head>
<body>
	<h2> 회원 정보 보기 </h2>
	
	<!-- request로 넘어온 데이터를 자바 빈즈랑 맵핑 시켜주는 useBean -->
	<jsp:useBean id="mbean" class="bean.MemberBean" >
	<!-- jsp내용을 자바빈 클래스(MemberBean의미)에 데이터를 맵핑(넣어 준다.) -->
		<jsp:setProperty name="mbean" property="*" />	<!-- 자동으로 모두 매핑시켜 주시오 라는 뜻 -->
	</jsp:useBean>
	
	<h2>당신의 아이디는 <jsp:getProperty property="id" name="mbean"/></h2>
	<h2>당신의 비밀번호는 <jsp:getProperty property="pass" name="mbean"/></h2>
	<h2>당신의 이메일은 <jsp:getProperty property="email" name="mbean"/></h2>
	
	<h2>당신의 전화는
		<%=mbean.getTel() %>
	</h2>
</body>
</html>