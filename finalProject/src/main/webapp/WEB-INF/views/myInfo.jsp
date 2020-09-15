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
			<c:set var="myBackColor" value="#E1B643" />
			<c:set var="myColor" value="#E09C43" />
		</c:otherwise>
	</c:choose>

	<div id="body_wrap">
		<div id="main_wrap">
			<div id="header_wrap" align="center">
				<div
					style="width: 250px; margin: 15px auto; background-color: ${myBackColor}; color:${myColor}">
					<font size="15px;" color="White"><b>내 정보</b></font><br />
				</div>
			</div>
			<div id="content_wrap" align="center">
				<form action="" method="post" id="_frmForm" name="frmForm">
					<table class="content_table" style="width: 25%;">
						<tr align="center">
							<th>아이디</th>
							<td><input style="background-color: #e2e2e2;"
								readonly="readonly" data-msg="아이디" type="text"
								value="${requestScope.myself.id}" name="id" id="_userid"
								size="30" /></td>
						</tr>
						<tr align="center">
							<th>패스워드</th>
							<td><input data-msg="패스워드" readonly="readonly"
								type="password" name="pwd" value="${requestScope.myself.pwd}"
								id="_pwd" size="30" /></td>
						</tr>
						<tr  align="center">
				<th>찾기 질문&nbsp;</th>
					<c:set var="quiz" value="${requestScope.myself.quiz}" />
				<td>&nbsp;<select name="quiz" id="_quiz" style="width:185px;" onFocus='this.initialSelect = this.selectedIndex;'
onChange='this.selectedIndex = this.initialSelect;'>
						<option value="내가 태어난 곳은?" <c:if test="${quiz eq '내가 태어난 곳은?'}"> selected </c:if> >내가 태어난 곳은?</option>
						<option value="출신 초등학교 이름은?" <c:if test="${quiz eq '출신 초등학교 이름은?'}"> selected</c:if>>출신 초등학교 이름은?</option>
						<option value="아버지 성함은?" <c:if test="${quiz eq '아버지 성함은?'}"> selected </c:if>>아버지 성함은?</option>
						<option value="나의 비밀은?" <c:if test="${quiz eq '박정은?'}">selected</c:if>>나의 비밀은?</option>
				</select></td>
				</tr>
				<tr  align="center">
				<th>나의 답변&nbsp;</th>
				<td>&nbsp;<input type="text" id="_answer" name="answer" size="30" value="${requestScope.myself.answer}" readonly></td>
				</tr>
						<tr align="center">
							<th>이 름</th>
							<td><input data-msg="이름" readonly="readonly" type="text"
								name="name" value="${requestScope.myself.name}" id="_name"
								size="30" /></td>
						</tr>
						<tr align="center">
							<th>성 별</th>
							<td><input data-msg="성별" readonly="readonly" type="text"
								name="gender" value="${requestScope.myself.gender}" id="_gender"
								size="30" /></td>
						</tr>
						<tr align=center>
							<th>나 이</th>
							<td><input data-msg="나이" readonly="readonly" type="text"
								name="age" value="${requestScope.myself.age}" id="_age"
								style="text-align: center;" size="5" />
								살&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr align="center">
							<th>키 / 몸무게</th>
							<td><input data-msg="키" readonly="readonly" type="text"
								name="height" value="${requestScope.myself.height}" id="_height"
								style="text-align: center;" size="8" /> cm / <input
								data-msg="몸무게" readonly="readonly" type="text" name="weight"
								value="${requestScope.myself.weight}" id="_weight"
								style="text-align: center;" size="8" /> kg</td>
						</tr>
						<tr align="center">
							<c:set var="bmiScore"
								value="${requestScope.myself.weight / ((requestScope.myself.height*requestScope.myself.height)/10000)}" />
							<c:choose>
								<c:when test="${bmiScore >= 30}">
									<c:set var="bmiResult" value="고도비만" />
									<c:set var="bmiColor" value="#FF007F" />
								</c:when>
								<c:when test="${(bmiScore >= 25) && (bmiScore<30)}">
									<c:set var="bmiResult" value="비만" />
									<c:set var="bmiColor" value="#DF4D4D" />
								</c:when>
								<c:when test="${(bmiScore >= 23) && (bmiScore<25)}">
									<c:set var="bmiResult" value="과체중" />
									<c:set var="bmiColor" value="#7D78FF" />
								</c:when>
								<c:when test="${(bmiScore >= 18.5) && (bmiScore<23)}">
									<c:set var="bmiResult" value="정상체중" />
									<c:set var="bmiColor" value="#5586EB" />
								</c:when>
								<c:otherwise>
									<c:set var="bmiResult" value="저체중" />
									<c:set var="bmiColor" value="#5AB1C0" />
								</c:otherwise>
							</c:choose>
							<th>BMI 지수</th>
							<td><input data-msg="BMI" readonly="readonly" type="text"
								name="bmi"
								style="color:white; background-color: ${bmiColor}; text-align:center;"
								value="<fmt:formatNumber value="${bmiScore}" pattern=".00"/>&nbsp;(${ bmiResult})"
								id="_bmi" size="30" /></td>
						</tr>
						<tr align="center">
							<th>주 소</th>
							<td><input data-msg="주소" readonly="readonly" type="text"
								name="address" value="${requestScope.myself.address}"
								id="_address" size="30" /></td>
						</tr>
						<tr align="center">
							<th>전화번호</th>
							<td><input data-msg="전화번호" readonly="readonly" type="text"
								name="phone" value="${requestScope.myself.phone}" id="_phone"
								size="30" /></td>
						</tr>
						<tr align="center">
							<th>알레르기</th>
							<td><input data-msg="알레르기" readonly="readonly" type="text"
								name="allergy" value="${requestScope.myself.allergy}"
								id="_allergy" size="30" /></td>
						</tr>
						<tr align="center">
							<th>특이사항</th>
							<td><input data-msg="특이사항" readonly="readonly" type="text"
								name="special" value="${requestScope.myself.special}"
								id="_special" size="30" /></td>
						</tr>
						<tr align="center">
							<td colspan="2" style="height: 50px; text-align: center;">
								<button type="button" class="btn btn-success" id="_btnUpdate">회원수정</button>
								<button type="button" class="btn btn-danger" id="_btnDelete">회원탈퇴</button>
								<button type="button" class="btn btn-warning" id="_btnIndex">돌아가기</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<hr />
			<c:if test="${login.auth == '3'}">
				<div style="width: 100%">
					<jsp:include
						page="calendar.jsp?year=${year}&month=${month}&eatten=${eatten }"></jsp:include>
					<c:set var="able" value="${able}" />
					<c:if test="${able == '7'}">
						<jsp:include page="EattenTest.jsp"></jsp:include>
						<jsp:include page="BestEatten.jsp"></jsp:include>
						<jsp:include page="foodDetailtesttest.jsp"></jsp:include>
						<br/><br/>
					</c:if>
				</div>
			</c:if>

		</div>
	</div>
	<hr/>
	<script type="text/javascript">
		$("#_btnUpdate").click(function() {
			location.href = "./edit.do";
		});

		$("#_btnDelete").click(function() {
			var result = confirm("정말로 탈퇴하시겠습니까?");
			if (result) {
				alert("안녕히가세요..");
			} else {
				alert("잘생각하셨어용");
				return false;
			}
			$("#_frmForm").attr({
				"target" : "_self",
				"action" : "./delete.do"
			}).submit();
		});

		$("#_btnIndex").click(function() {
			location.href = "./index.do";
		});
	</script>
</body>
</html>