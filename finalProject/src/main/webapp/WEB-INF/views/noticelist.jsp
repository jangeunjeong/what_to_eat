<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="utf-8">
<title>NOTICE</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery.cookie.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/table.css" />

</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div id="body_wrap">
		<div id="main_wrap" style="align-content: center;">
			<div id="header_wrap">
				<div align="center">
					<a href="./noticelist.do"><img src="images/alertlist.png"
						width="140px" height="70px" alt="공지사항 바로가기" style=""></a>
				</div>
			</div>
			<div id="content_wrap">

				<table class="list_table" border="1px"
					style="width: 70%; margin: 0 auto">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: 60%;" />
						<col style="width: 30%;" />
						<col style="width: 10%;" />
					</colgroup>

					<tr>
						<c:if test='${empty notices}'>
							<tr>
								<td colspan="4">알림글이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${notices}" var="n" varStatus="vs">
							<tr height="44px">
								<td align="center" style="background-color: #ececec"
									onclick="noticedetail('${n.seq}')">${vs.count}</td>
								<td onclick="noticedetail('${n.seq}')">&nbsp;&nbsp;${n.title}</td>
								<td align="center" onclick="noticedetail('${n.seq}')">${n.wdate}</td>
								<c:set var="auth" value="${login.auth}" />
								<c:if test="${auth == '1'}">
									<td width="50px" onclick="noticedelete('${n.seq}')"><img
										src="images/alertdelete.png" width="80" height="40px"
										alt="공지수정" style="" /></td>
								</c:if>
							</tr>
						</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<c:set var="auth" value="${login.auth}" />
	<form method="get" action="./addnotice.do">
		<c:if test="${auth == '1'}">
			<br>
			<div style="width: 70%; margin: 0 auto" align="right">
				<button type="submit">
					<img src="images/alertadd.png" width="80" height="40px" alt="공지추가"
						style="" />
				</button>
			</div>
		</c:if>
	</form>

	<script type="text/javascript">
		function noticedetail(_seq) {
			location.href = "./noticedetail.do?seq=" + _seq;
		}

		function noticedelete(_seq) {
			location.href = "./noticedelete.do?seq=" + _seq;
		}
	</script>
</body>
</html>