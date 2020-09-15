<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="utf-8">
<title>My Info Form</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/jquery/jquery-ui.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/jquery/jquery.cookie.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jquery/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
	<div id="body_wrap">
		<div id="main_wrap">
			<div id="header_wrap">
				<h3 style="text-align: center">내 정보</h3>
			</div>
			<div id="content_wrap" align="center">
				<form action="" method="post" id="_frmForm" name="frmForm">
					<table class="content_table" style="width: 25%;">
						<tr>
							<th>아이디</th>
							<td><input style="background-color: #e2e2e2;" readonly="readonly" data-msg="아이디" type="text"
								value="${requestScope.myself.id}" name="id" id="_userid"
								size="30" /></td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td><input data-msg="패스워드" type="password" name="pwd"
								value="${requestScope.myself.pwd}" id="_pwd" size="30" /></td>
						</tr>
						<tr>
							<th>이 름</th>
							<td><input style="background-color: #e2e2e2;" readonly="readonly" data-msg="이름" type="text" name="name"
								value="${requestScope.myself.name}" id="_name" size="30" /></td>
						</tr>
						<tr>
							<th>주 소</th>
							<td><input data-msg="주소" type="text" name="address"
								value="${requestScope.myself.address}" id="_address" size="30" /></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input data-msg="전화번호" type="text" name="phone"
								value="${requestScope.myself.phone}" id="_phone" size="30" /></td>
						</tr>
						<tr>
							<th>알레르기</th>
							<td><input style="background-color: #e2e2e2;" readonly="readonly" data-msg="알레르기" type="text" name="allergy"
								value="${requestScope.myself.allergy}" id="_allergy" size="30" /></td>
						</tr>

						<tr>
							<td colspan="2" style="height: 50px; text-align: center;">
								<button type="button" class="btn btn-success" id="_btnUpdate">회원수정</button>
								<button type="button" class="btn btn-danger" id="_btnDelete">회원탈퇴</button>
								<button type="button" class="btn btn-warning" id="_btnIndex">돌아가기</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$("#_btnUpdate").click(function() {
			$("#_frmForm").attr({
				"target" : "_self",
				"action" : "./Main?action=update"
			}).submit();
		});

		$("#_btnDelete").click(function() {
			$("#_frmForm").attr({
				"target" : "_self",
				"action" : "./Main?action=delete"
			}).submit();
		});

		$("#_btnIndex").click(function() {
			location.href = "./";
		});
	</script>
</body>
</html>