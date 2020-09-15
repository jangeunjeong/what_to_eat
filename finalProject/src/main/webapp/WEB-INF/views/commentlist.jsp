<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="functions"  uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="utf-8">
<title>NOTICE</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.cookie.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css"/>

</head>
<body>
<div id="body_wrap">
<div id="main_wrap" style="align-content: center;">
<div id="header_wrap">
</div>					
<div id="content_wrap">	

<table class="list_table" style="width:55%; margin: 0 auto" align="center">
<colgroup>
<col style="width:10%;" />
<col style="width:90%;" />
</colgroup>

<c:if test='${empty comments}'>
<tr>
<td colspan="4"align="center">댓글이 없습니다.</td>
</tr>
</c:if>
<c:forEach items="${comments}" var="n" varStatus="vs" >
	<tr>
	<td align="center">${n.writer}</td>
	<td >${n.content}
	
	<c:set var="wrtier" value="${n.writer}" />
	<c:set var="name" value="${login.name}" />
									<c:if test="${name == wrtier || name == 'admin'}">
										<a href="#" onclick="commentdelete('${n.notice_seq}','${n.seq}')"> x </a>
									</c:if></td>
	</tr>
</c:forEach>
</table>
</div>
</div>
</div>

<script type="text/javascript">
function commentdelete(nseq, seq,writer) {
	location.href="commentdelete.do?notice_seq="+nseq+"&seq="+seq;
}
</script>
</body>
</html>