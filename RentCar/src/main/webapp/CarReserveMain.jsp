<%@page import="db.CarListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<div align="center">
<!-- 데이터 베이스에 연결하여 최신순 자동차 3대만 뿌려주는 데이터를 가져옴 -->
<%
	RentcarDAO rdao = new RentcarDAO();
	//벡터를 이용하여 자동차를 저장
	Vector<CarListBean> v = rdao.getSelectCar(); 
%>

	<table style="width:1000px">
		<tr height="60px">
			<td align="center" colspan="3"><font size="6" color="gray">최신형 자동차</font></td>
		</tr>
		<tr height="240px">
			<% for(int i=0; i < v.size(); i++) {
				CarListBean bean = v.get(i);
			%>
			
			<td width="333px" align="center">
				<a href="CarReserveInfo.jsp?no=<%=bean.getNo() %>"><img src="image/<%=bean.getImg() %>" width="300px" height="200px"></a>
				<p>차량명 : <%=bean.getName() %></p>
			</td>
			<%
			}
			%>
		</tr>
	</table>
	<p>
		<font size="4" color="gray"> 차량 검색 하기</font><br><br><br>
		<form action="RentcarMain.jsp?center=CarCategoryList.jsp" method="post">
			<font size="3" color="gray"> <b>차량 검색 하기</b></font>&nbsp;&nbsp;
			<select name="category">
				<option value="1">소형</option>
				<option value="2">중형</option>
				<option value="3">대형</option>
			</select>&nbsp;&nbsp;
			<input type="submit" value="검색">&nbsp;&nbsp;
		</form>
		<button onclick="location.href='RentcarMain.jsp?center=CarAllList.jsp'">전체 검색</button>
		
</div>
</body>
</html>