<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Food Search Form</title>

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
	
	<div align="center">
		<div  style="width: 430px; margin: 15px auto; background-color: ${myBackColor}; color:${myColor}">
			<font size="15px;" color="White"><b>조회수 Top 5 식품</b></font><br/>
		</div>	
			<c:if test="${empty auth}">
		<div style="width:430px; margin : 10px auto;">
			로그인 후 이름을 클릭하여 상세 정보를 보실 수 있습니다.
		</div>
		</c:if>
		<br/><br/>
		<table class="list_table" style="width: auto; text-align: center;">
			<tr >
				<th></th>
				<c:forEach items="${foods}" var="f">
					<td width="200"><img width="200" height="200"
						src="food${f.image}"></td>
				</c:forEach>
			</tr>
			<tr style="border: 3px solid white">
				<th style="background-color: ${myColor}; color:white;">이름</th>
				<c:forEach items="${foods}" var="f">
					<td width="200"><b><a style="color: ${myBackColor}"
						<c:if test="${not empty auth}">  href="javascript:fooddetail('${f.code }')" </c:if>>
							${f.name}</a></b></td>
				</c:forEach>
			</tr>
			<tr style="border: 3px solid white">
				<th style="background-color: ${myColor}; color:white;">브랜드</th>
				<c:forEach items="${foods}" var="f">
					<td width="200">${f.maker}</td>
				</c:forEach>
			</tr>
			<tr style="border: 3px solid white">
				<th style="background-color: ${myColor}; color:white;">조회수</th>
				<c:forEach items="${foods}" var="f">
					<td width="200">${f.count}</td>
				</c:forEach>
			</tr>
		</table>
	</div>

	<script type="text/javascript">
		function fooddetail(code) {
			window.open("./foodDetail.do?code=" + code,'상세정보','width=1310, height=800, left='+((document.body.offsetWidth / 2) - (1310 / 2))+', top='+((document.body.offsetHeight / 2) - (800/ 2)) + ', menubar=no, status=no, toolbar=no');
		}

 		$("#_btnSearch").click(function() {
			$("#_frmFormSearch").attr({
 				"target" : "_self"
 			}).submit();
 		});
	</script>
</body>
</html>