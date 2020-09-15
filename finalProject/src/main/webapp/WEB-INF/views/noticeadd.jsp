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
<title>공지추가</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.cookie.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css"/>

</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
<div id="body_wrap">
<div id="main_wrap">
<div id="header_wrap">
<div align="center"><a href="./noticelist.do"><img src="images/alertlist.png" width="140px" height="70px" alt="공지사항 바로가기" style="align"></a></div>
</div>					
<div id="content_wrap">	

<form method="post" action="./addnoticeaf.do">
	<table class="content_table" style="width:80%; margin: 0 auto">
	<colgroup>
		<col style="width:20%;" />
		<col style="width:80%;" />							
	</colgroup>
	<tr>
		<th style="text-align: right">작성자&nbsp;&nbsp;&nbsp;&nbsp;</th>
		<td><input type="text" value="${login.name}" name="writer" size="100" readonly></td>
	</tr>
	<tr>
		<th style="text-align: right">제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		<td><input type="text" id="_title" maxlength="201" onkeyup="chk(this.id, 200 )" name="title" size="100"></td>
	</tr>
	<tr>
		<th style="text-align: right">내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		<td><textarea id="_content" maxlength="2001" onkeyup="chk(this.id, 2000 )" rows="10" cols="103" name="wcontents"></textarea></td>
	</tr>
	<tr>
		<th></th>
		<td><button type="submit"><img src="images/alertadd.png" width="80" height="40px" alt="공지추가" style="align" /></button></td>
	</tr>
	</table>
</form>
</div>
</div>
</div>
<script type="text/javascript">
function chk(thisid , lim){ //바이트 제한 숫자를 매개변수로 받음
	  var id = "#"+thisid;
	 var v = $(id).val();

	  re0=/[a-z]|[0-9]/gi; //영숫자 패턴
	  re1=/[ㄱ-힣]/g; //한글패턴
	  english=v.match(re0); //매치확인
	  korean=v.match(re1); //매치확인

	  if(english!=null)english=english.length; //바이트 구함
	  if(korean!=null)korean=korean.length; //바이트 구함
	  
	  tot=english+(korean*2); //합을 구함
	  if(tot<= lim){ //한계수치이내인경우 바이트표시
	   // f.t1.value=tot;
	  } else { //한계를 초과하면 경고문 출력
	   alert('글자수 제한은 '+lim+'바이트 입니다.');
	   $(id).val( $(id).val().slice(0,-1)  );
	  }
	 };
	 </script>
</body>
</html>