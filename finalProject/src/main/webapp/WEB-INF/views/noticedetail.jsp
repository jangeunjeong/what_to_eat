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
<title>book</title>
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
				<div align="center">
					<a href="./noticelist.do"><img src="images/alertlist.png"
						width="140px" height="70px" alt="공지사항 바로가기" style=""></a>
				</div>
			</div>					
<div id="content_wrap" align="center">	

<form style="width: 85% " action="noticeupdate.do">
	<div style="width:85%; margin: 0 auto; "><h4 style="padding-top:7px; padding-bottom:7px; background-color: #eeeeee">&nbsp;&nbsp;[공지] ${notice.title}</h4></div>
	<div style="width:80%; margin: 0 auto"><pre  style="border:1px; border-color:olive; font-size: 16px">${notice.wcontents}</pre></div>
	<input type="hidden" value="${notice.seq }" name="seq"/>
	<c:if test="${login.auth eq 1}"><div style="width:85%; margin: 0 auto"><button type="submit"><img src="images/alertupdate.png" width="80" height="40px" alt="공지수정" style="align" /></button></div></c:if>
</form>
<br><br>
<div align="center">
<h5>댓글</h5>
	<c:set var="auth" value="${login.auth}" /> <c:if test="${not empty auth}">
	<form style="width: 85%" method="post" action="addcomment.do">
	<span><input type="text" value="${login.name}" name="writer" size="10" readonly></span>
	<span><input type="text" id="_content" maxlength="1001" onkeyup="chk(this.id, 1000  )" name="content" size="100" placeholder=" 욕설과 비방은 상처가 됩니다."></span>
	<span><button type="submit"><img src="images/alertinsert.png" width="50" height="25px" alt="댓글입력" style="align" /></button></span>
	<div align="right">
	<input style="width:80px" type="hidden" value="${notice.seq }" name="notice_seq"/></div>
	</form>
	</c:if>
	</div>
	<hr/>
	<jsp:include page="commentlist.jsp"></jsp:include>
	<hr/>
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