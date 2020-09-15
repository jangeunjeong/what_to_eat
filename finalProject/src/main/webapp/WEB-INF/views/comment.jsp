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

<div id="body_wrap">
<div id="main_wrap">
<div id="header_wrap">
<h3 style="text-align: center">공지추가</h3>	
</div>					
<div id="content_wrap">	

<form method="post" action="addcomment.do">
	<table class="content_table" style="width:85%;">
	<colgroup>
		<col style="width:30%;" />
		<col style="width:70%;" />							
	</colgroup>	

	<tr>
		<td><input type="text" value="${login.name}" name="writer" size="10" readonly></td>
		<td><input type="text" name="content" size="100" placeholder="욕설과 비방은 상처가 됩니다." id="_content" maxlength="1001" onkeyup="chk(this.id, 1000 )"></td>
		<td colspan="2"><input type="submit" value="입력"></td>
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