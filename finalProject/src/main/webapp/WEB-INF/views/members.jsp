<%@page import="com.ssafy.safefood.model.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="utf-8">
<title>memebers</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/jquery/jquery-ui.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/jquery/jquery.cookie.js"></script>

</head>
<body style="margin: 0;">
	<jsp:include page="nav.jsp"></jsp:include>


	<%
		Object memobjes = request.getAttribute("members");
		List<Member> members = null;
		if (memobjes != null) {
			members = (List<Member>) memobjes;
		}
	%>
	<div id="body_wrap">
		<div id="main_wrap">
			<div id="header_wrap">
			<div style="width: 230px; margin: 15px auto; background-color: #E1B643; color:#E09C43" align="center">
					<font size="15px;" color="White"><b>회원 관리</b></font>
				</div>
			</div>
			<div id="content_wrap" style="align-content: center;" align="center">
				<table class="list_table" style="width: 85%; text-align: center">
					<colgroup>
						<col style="width: 70px;" />
						<col style="width: auto;" />
						<col style="width: 100px;" />
					</colgroup>
					<tr>
						<th style="background-color: #E09C43; color:white; margin-right: 2px">아이디</th>
						<th style="background-color: #E09C43; color:white;">이름</th>
						<th style="background-color: #E09C43; color:white;">나이</th>
						<th style="background-color: #E09C43; color:white;">성별</th>
						<th style="background-color: #E09C43; color:white;">주소</th>
						<th style="background-color: #E09C43; color:white;">전화번호</th>
						<th style="background-color: #E09C43; color:white;">알레르기</th>
						<th style="background-color: #E09C43; color:white;">특이사항</th>
					</tr>
					<%
						if (memobjes == null || members.size() == 0) {
					%>
					<tr>
						<td colspan="3">목록이 없습니다.</td>
					</tr>
					<%
						} else {
							for (Member m : members) {
					%>
					<tr height="50px" style="border: 2px">
						<td><a href="./detail.do?id=<%=m.getId()%>"><%=m.getId()%></a></td>
						<td><%=m.getName()%></td>
						<td><%=m.getAge()%></td>
						<td><%=m.getGender()%></td>
						<td><%=m.getAddress()%></td>
						<td><%=m.getPhone()%></td>
						<td><%=m.getAllergy()%></td>
						<td><%=m.getSpecial()%></td>
					</tr>
					<%
						}

						}
					%>
				</table>
			</div>
		</div>
	</div>
</body>
</html>