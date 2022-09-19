<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	
	<%
		request.setCharacterEncoding("EUC-KR");
	%>
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>
	<%
		String id = request.getParameter("id");
	
		MemberDAO mdao = new MemberDAO();
		//스트링타입의로 저장되어있는 패스워드를 가져옴(데이터 베이스에서 가져온 pass값이 저장)
		String pass = mdao.getPass(id);
		//수정하기 위해서 작성한 패스워드 값고 기존 데이터 베이스에서 가져온 패스워드 값을 비교
		if(mbean.getPass().equals(pass)){	//기존 패스와 데이터베이스 패스가 같다면 member테이블을 수정
			
			//MemberDao클래스의 회원 수정메소드를 호출
			mdao.updateMember(mbean);
			response.sendRedirect("MemberList.jsp");
			
		}else{
	%>	
		<script type="text/javascript">
			alert("패스워드가 맞지 않습니다. 다시 확인해주세요");
			history.go(-1);
		</script>
	<%	
		}
	%>
	
</body>
</html>