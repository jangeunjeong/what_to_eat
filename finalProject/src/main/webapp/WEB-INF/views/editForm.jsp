<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>Register Form</title>

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
			<c:set var="myBackColor" value="#E1B643" />
			<c:set var="myColor" value="#E09C43" />
		</c:otherwise>
	</c:choose>
	<div align="center">
		<input type="hidden" id="_beforepwd"
			value="${sessionScope.login.pwd }" />
		<form action="" method="post" id="_frmForm" name="frmForm">
			<table class="content_table" style="margin: 0 auto">
				<tr align="center">
					<th
						style="background-color: ${myColor}; color:white;border: 3px solid white">아이디&nbsp;</th>
					<td>&nbsp;<input value="${sessionScope.login.id}"
						readonly="readonly" data-msg="아이디" type="text" name="id" maxlength="51" onkeyup="chk(this.id, 50 )"
						id="_userid" size="20" /></td>
				</tr>
				<tr align="center">
					<th
						style="background-color: ${myColor}; color:white;border: 3px solid white">기존
						암호&nbsp;</th>
					<td>&nbsp;<input data-msg="패스워드" type="password" maxlength="51" onkeyup="chk(this.id, 50 )"
						name="beforepwd" id="_pwd" size="20" /></td>
				</tr>
				<tr align="center">
					<th
						style="background-color: ${myColor}; color:white;border: 3px solid white">새로운
						암호&nbsp;</th>
					<td>&nbsp;<input data-msg="패스워드" = type="password" name="pwd" maxlength="51" onkeyup="chk(this.id, 50 )"
						value="" id="_newpwd" size="20" /></td>
				</tr>
				<tr align="center">
					<th style="background-color: ${myColor}; color:white;border: 3px solid white">찾기 질문&nbsp;</th>
					<c:set var="quiz" value="" />
					<td>&nbsp;<select name="quiz" id="_quiz" style="width: 205px;">
							<option value="내가 태어난 곳은?"
								<c:if test="${quiz == '내가 태어난 곳은?'}"> checked </c:if>>내가
								태어난 곳은?</option>
							<option value="출신 초등학교 이름은?"
								<c:if test="${quiz == '출신 초등학교 이름은?'}"> checked </c:if>>출신
								초등학교 이름은?</option>
							<option value="아버지 성함은?"
								<c:if test="${quiz == '아버지 성함은?'}"> checked </c:if>>아버지
								성함은?</option>
							<option value="나의 비밀은?"
								<c:if test="${quiz == '나의 비밀은?'}"> checked </c:if>>나의 비밀은?</option>
					</select></td>
				</tr>
				<tr  align="center">
				<th style="background-color: ${myColor}; color:white;border: 3px solid white">나의 답변&nbsp;</th>
				<td>&nbsp;<input type="text" id="_answer" name="answer" size="20" value="${sessionScope.login.answer}" maxlength="41" onkeyup="chk(this.id, 40 )"/></td>
				</tr>
				<tr align="center">
					<th
						style="background-color: ${myColor}; color:white;border: 3px solid white">이름&nbsp;</th>
					<td>&nbsp;<input value="${sessionScope.login.name}"
						data-msg="이름" type="text" name="name" id="_name" size="20" maxlength="51" onkeyup="chk(this.id, 50 )" /></td>
				</tr>
				<tr align="center">
					<th
						style="background-color: ${myColor}; color:white;border: 3px solid white">성별&nbsp;</th>
					<c:set var="myGender" value="${sessionScope.login.gender}" />
					<td>&nbsp; <input data-msg="성별" type="radio" name="gender"
						id="_male" value="남자"
						<c:if test="${myGender eq '남자'}">checked</c:if> />남자 &nbsp; <input
						data-msg="성별" type="radio" name="gender" id="_female" value="여자"
						<c:if test="${myGender eq '여자'}">checked</c:if> />여자
					</td>
				</tr>
				<tr align="center">
					<th
						style="background-color: ${myColor}; color:white;border: 3px solid white">나
						이</th>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input data-msg="나이"
						type="number" name="age" value="${sessionScope.login.age}"
						id="_age" size="20" min=1 max=999 maxlength="4" onkeyup="chk(this.id, 3 )" /> 살
					</td>
				</tr>
				<tr align="center">
					<th
						style="background-color: ${myColor}; color:white;border: 3px solid white">키</th>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						data-msg="키" type="number" name="height"
						value="${sessionScope.login.height}" id="_height" size="20" min=1
						max=999 maxlength="4" onkeyup="chk(this.id, 3 )" /> cm
					</td>
				</tr>
				<tr align="center">
					<th
						style="background-color: ${myColor}; color:white;border: 3px solid white">몸무게</th>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						data-msg="몸무게" type="number" name="weight"
						value="${sessionScope.login.weight}" id="_weight" size="20" min=1
						max=999 maxlength="4" onkeyup="chk(this.id, 3 )" /> kg
					</td>
				</tr>
				<tr align="center">
					<th
						style="background-color: ${myColor}; color:white;border: 3px solid white">주소&nbsp;</th>
					<td>&nbsp;<input value="${sessionScope.login.address}"
						data-msg="주소" type="text" name="address"  id="_address" size="20" /></td>
				</tr>
				<tr align="center">
					<th
						style="background-color: ${myColor}; color:white;border: 3px solid white">전화
						번호&nbsp;</th>
					<td>&nbsp;<input data-msg="폰" type="text" name="phone"
						id="_phone" value="${sessionScope.login.phone}" size="20" maxlength="12" onkeyup="chk(this.id, 11 )" /></td>
				</tr>
				<tr align="center">

					<th
						style="background-color: ${myColor}; color:white;border: 3px solid white">특이사항&nbsp;</th>
					<td>&nbsp; <c:set var="prg"
							value="${sessionScope.login.special}" /> <input type="checkbox"
						name="options" value="유아"
						<c:if test="${fn:contains(prg, '유아')}">checked</c:if> /> 유아 <input
						type="checkbox" name="options" value="고혈압"
						<c:if test="${fn:contains(prg, '고혈압')}">checked</c:if> /> 고혈압 <input
						type="checkbox" name="options" value="당뇨"
						<c:if test="${fn:contains(prg, '당뇨')}">checked</c:if> /> 당뇨 <input
						type="checkbox" name="options" value="비만"
						<c:if test="${fn:contains(prg, '비만')}">checked</c:if> /> 비만 <input
						type="checkbox" name="options" value="학생"
						<c:if test="${fn:contains(prg, '학생')}">checked</c:if> /> 학생 <c:if
							test="${myGender eq '여자'}">
							<span id="#_pregnant"> <input type="checkbox"
								name="options" value="임산부"
								<c:if test="${fn:contains(prg, '임산부')}">checked</c:if> /> 임산부
							</span>
						</c:if>
					</td>
				</tr>

				<tr align="center">
					<td colspan="2" style="height: 50px; text-align: center;">
						<hr /> <b>알레르기</b>
						<hr /> <c:set var="all" value="${sessionScope.login.allergy}" /> <input
						type="checkbox" name="box" value="대두"
						<c:if test="${fn:contains(all, '대두')}">checked</c:if> /> 대두
						&nbsp; <input type="checkbox" name="box" value="땅콩"
						<c:if test="${fn:contains(all, '땅콩')}">checked</c:if> /> 땅콩 &nbsp;
						<input type="checkbox" name="box" value="우유"
						<c:if test="${fn:contains(all, '우유')}">checked</c:if> /> 우유 &nbsp;
						<input type="checkbox" name="box" value="게"
						<c:if test="${fn:contains(all, '게')}">checked</c:if> /> 게 &nbsp;
						<br /> <input type="checkbox" name="box" value="새우"
						<c:if test="${fn:contains(all, '새우')}">checked</c:if> /> 새우
						&nbsp; <input type="checkbox" name="box" value="참치"
						<c:if test="${fn:contains(all, '참치')}">checked</c:if> /> 참치 &nbsp;
						<input type="checkbox" name="box" value="연어"
						<c:if test="${fn:contains(all, '연어')}">checked</c:if> /> 연어 &nbsp;
						<input type="checkbox" name="box" value="쑥"
						<c:if test="${fn:contains(all, '쑥')}">checked</c:if> /> 쑥 &nbsp; <br />

						<input type="checkbox" name="box" value="소고기"
						<c:if test="${fn:contains(all, '소고기')}">checked</c:if> /> 소고기
						&nbsp; <input type="checkbox" name="box" value="닭고기"
						<c:if test="${fn:contains(all, '닭고기')}">checked</c:if> /> 닭고기
						&nbsp; <input type="checkbox" name="box" value="돼지고기"
						<c:if test="${fn:contains(all, '돼지고기')}">checked</c:if> /> 돼지고기
						&nbsp; <br /> <input type="checkbox" name="box" value="복숭아"
						<c:if test="${fn:contains(all, '복숭아')}">checked</c:if> /> 복숭아
						&nbsp; <input type="checkbox" name="box" value="민들레"
						<c:if test="${fn:contains(all, '민들레')}">checked</c:if> /> 민들레
						&nbsp; <input type="checkbox" name="box" value="계란휜자"
						<c:if test="${fn:contains(all, '계란휜자')}">checked</c:if> /> 계란휜자
						&nbsp; <br />
					</td>
				</tr>
				<tr align="center">
					<td colspan="2" style="height: 50px; text-align: center;">
						<button type="button" class="btn btn-success" id="_btnUpdate">수정</button>
						<button type="button" class="btn btn-warning" id="_return">돌아가기</button>
					</td>
				</tr>
			</table>
		</form>
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
		 
		var preg = '<input type="checkbox" name="options" value="임산부"/> 임산부';

		$("#_male").click(function() {
			return false;
		})

		$("#_female").click(function() {
			return false;
		})

		$("#_return").click(function() {
			location.href = "./myInfo.do";
		})

		$("#_btnUpdate")
				.click(
						function() {
							if ($("#_userid").val() == "") {
								alert($("#_userid").attr("data-msg")
										+ "를 제대로 입력해 주십시요.");
								$("#_userid").focus();
								return false;
							} else if ($("#_pwd").val() == "") {
								alert("기존 " + $("#_pwd").attr("data-msg")
										+ "를 제대로 입력해 주십시요.");
								$("#_pwd").focus();
								return false;
							} else if ($("#_name").val() == "") {
								alert($("#_name").attr("data-msg")
										+ "을 제대로 입력해 주십시요.");
								$("#_name").focus();
								return false;
							} else if ($("#_address").val() == "") {
								alert($("#_address").attr("data-msg")
										+ "를 제대로 입력해 주십시요.");
								$("#_address").focus();
								return false;
							} else if ($("#_phone").val() == "") {
								alert($("#_phone").attr("data-msg")
										+ "를 제대로 입력해 주십시요.");
								$("#_phone").focus();
								return false;
							} else if (!$("#_age").val()
									|| $("#_age").val() > 1000) {
								alert($("#_age").attr("data-msg")
										+ "를 제대로 입력해 주십시요.\n(최대 1000)");
								$("#_age").focus();
								return false;
							} else if (!$("#_height").val()
									|| $("#_height").val() > 1000) {
								alert($("#_height").attr("data-msg")
										+ "를 제대로 입력해 주십시요.\n(최대 1000)");
								$("#_height").focus();
								return false;
							} else if (!$("#_weight").val()
									|| $("#_weight").val() > 1000) {
								alert($("#_weight").attr("data-msg")
										+ "를 제대로 입력해 주십시요.\n(최대 1000)");
								$("#_weight").focus();
								return false;
							} else if ($("#_pwd").val() != $("#_beforepwd")
									.val()) {
								alert("기존 " + $("#_pwd").attr("data-msg")
										+ "가 일치하지 않습니다.");
								$("#_pwd").focus();
								return false;
							} else {
								if ($("#_newpwd").val() == "") {
									$("#_newpwd").val($("#_beforepwd").val());
								}
								// 				 if ($("#_box").val() == "" || $("#_box").val() == null){
								// 					 $("#_box").val(" ");
								// 				 }
								// 				 if ($("#_special").val() == "" || $("#_special").val() == null){
								// 					 $("#_special").val(" ");
								// 				 }
								$("#_frmForm").attr({
									"target" : "_self",
									"action" : "./update.do"
								}).submit();
							}
						});
	</script>
</body>
</html>