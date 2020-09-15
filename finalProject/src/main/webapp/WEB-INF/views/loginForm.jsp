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
<html>
<head>
<meta charset="utf-8">
<title>Login Form</title>
<style type="text/css">
body {
	background: #eee !important;
}

​
.wrapper {
	margin-top: 80px;
	margin-bottom: 80px;
}

​
.form-signin {
	max-width: 380px;
	padding: 15px 35px 45px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.1);
	​
	.form-signin-heading,
	.checkbox
	{
	margin-bottom
	:
	30px;
}

​
	.checkbox {
	font-weight: normal;
}

​
	.form-control {
	position: relative;
	font-size: 16px;
	height: auto;
	padding: 10px; @ include box-sizing(border-box);
	​ &: focus{
		  z-index: 2;
}

}
​
	input[type="text"] {
	margin-bottom: -1px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

​
	input[type="password"] {
	margin-bottom: 20px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
}
</style>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	​
	<div class="wrapper">
		<c:if test="${empty sessionScope.login}">
			<input type="hidden" id="_fail" value="${fail }" />
			<form action="login.do" method="post" class="form-signin">
				<h2 class="form-signin-heading">Please login</h2>
				<br> <input type="text" class="form-control" name="id" id="_id" 
					maxlength="51" onkeyup="chk(this.id, 50 )" 
					placeholder="ID" required="" autofocus="" /><br> <input
					type="password" class="form-control" name="pwd"
					placeholder="Password" required="" id="_pw" maxlength="51" onkeyup="chk(this.id, 50 )" /><br> <label
					class="checkbox"> <input type="checkbox"
					value="remember-me" id="rememberMe" name="rememberMe">
					Remember me
				</label> <input type="submit" class="btn btn-lg btn-primary btn-block"
					value="Login" />
			</form>
		</c:if>
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
	
		$(document).ready(function() {
			if($("#_fail").val() == "true"){
				alert("아이디와 비밀번호를 확인해주세요 ^^!");
			}
		});
	</script>
</body>
</html>