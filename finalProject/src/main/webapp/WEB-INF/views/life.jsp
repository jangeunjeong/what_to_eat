<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" -->
<!-- 	crossorigin="anonymous"> -->
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
	<c:set var="auth" value="${login.auth}" />
	<c:choose>
		<c:when test="${login.auth eq '1' }">
			<c:set var="myBackColor" value="#E1B643" />
			<c:set var="myColor" value="#E09C43" />
		</c:when>
		<c:when test="${login.primaryop eq '유아'}">
			<c:set var="myBackColor" value="#f0bf59" />
			<c:set var="myColor" value="#F0A759" />
		</c:when>
		<c:when test="${login.primaryop eq '임산부'}">
			<c:set var="myBackColor" value="#FF6F61" />
			<c:set var="myColor" value="#FFA7A7" />
		</c:when>
		<c:when test="${login.primaryop eq '고혈압'}">
			<c:set var="myBackColor" value="#9C1B31" />
			<c:set var="myColor" value="#B5315D" />
		</c:when>
		<c:when test="${login.primaryop eq '당뇨'}">
			<c:set var="myBackColor" value="#65488f" />
			<c:set var="myColor" value="#8670a6" />
		</c:when>
		<c:when test="${login.primaryop eq '비만'}">
			<c:set var="myBackColor" value="#8CA4CF" />
			<c:set var="myColor" value="#8CAFCF" />
		</c:when>
		<c:when test="${login.primaryop eq '학생'}">
			<c:set var="myBackColor" value="#88b04b" />
			<c:set var="myColor" value="#99B04C" />
		</c:when>
		<c:when test="${login.primaryop eq '남자'}">
			<c:set var="myBackColor" value="#169c78" />
			<c:set var="myColor" value="#169C62" />
		</c:when>
		<c:when test="${login.primaryop eq '여자'}">
			<c:set var="myBackColor" value="#b565a7" />
			<c:set var="myColor" value="#B565B5" />
		</c:when>
		<c:otherwise>
			<c:set var="myBackColor" value="#82ae46" />
			<c:set var="myColor" value="#6bac12" />
		</c:otherwise>
	</c:choose>
	
	
	<div id="body_wrap">
		<div id="main_wrap">
			<div id="content_wrap" align="center">
				<form action="./life.do" method="post" id="_frmForm" name="frmForm">
					<div align='center'
					style="width: 380px; margin: 15px auto; background-color: ${myBackColor}; color:${myColor}">
					<font size="15px;" color="White"><b>점심! 인생 극장</b></font><br /></div>
					<table class="content_table" style="width: 80%;"  >
						<tr align="center" height="350">
						<td><a href="./lifedetail.do?foodgroup=간편식"><img src="images/간편식.png" width="280" height="280"/></a></td>
						<td><a href="./lifedetail.do?foodgroup=과자/간식"><img src="images/과자간식.png" width="300" height="280"/></a></td>
						<td><a href="./lifedetail.do?foodgroup=음료/커피/차"><img src="images/음료커피차.png" width="320" height="280"/></a></td>
						</tr>
						<tr align="center" height="350">
						<td><a href="./lifedetail.do?foodgroup=건강식품" ><img src="images/건강식품.png" width="280" height="280"/></a></td>
						<td><a href="./life.do" ><img src="images/thinking.png" width="300" height="300"/></a></td>
						<td><a href="./lifedetail.do?foodgroup=유아식품"><img src="images/유아식품.png"width="280" height="280"/></a></td>
						</tr>
						<tr align="center" height="350">
						<td><a href="./lifedetail.do?foodgroup=냉장/냉동/반찬"><img src="images/냉장냉동반찬.png" width="280" height="280"/></a></td>
						<td><a href="./lifedetail.do?foodgroup=편의점"><img src="images/편의점.png" width="280" height="280"/></a></td>
						<td><a href="./lifedetail.do?foodgroup=주류"><img src="images/주류.png" width="280" height="280"/></a></td>
						</tr>
					</table>
				</form>			
				<br>
					
			</div>
		</div>
	</div>
</body>
</html>