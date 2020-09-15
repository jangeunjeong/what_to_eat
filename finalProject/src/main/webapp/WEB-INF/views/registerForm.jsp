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

<script type="text/javascript">
	// var maleClick = function(){
	// //		$("#_male").click(function() {
	// 	$("#_pregnant").css("display") = none;
	// 	$("#_pregnant").attr("checked", false);
	// 	$("#_pregnantText").css("display") = none;
	// }

	// 	var femaleClick = function(){
	// //		$("#_female").click(function() {
	// 	$("#_pregnant").css("display") = inlineblock;
	// 	$("#_pregnant").attr("checked", true);
	// 	$("#_pregnantText").css("display") = inlineblock;
	// }
</script>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div align="center">
		<input type="hidden" id="_duplresult" value="yet" />
		<form action="" method="post" id="_frmForm" name="frmForm">
			<table class="content_table" style="margin: 0 auto">

				<tr>
					<th>아이디&nbsp;</th>
					<td>&nbsp;<input data-msg="아이디" type="text" name="id" maxlength="51" onkeyup="chk(this.id, 50 )"
						id="_userid" size="30" /> <a href="#none" id="_dupl">중복체크</a></td>
				</tr>
				<tr>
					<th>중복 체크&nbsp;</th>
					<td><span id="_able">&nbsp;아이디 중복 체크를 해주세요!</span></td>
				</tr>
				<tr>
					<th>패스워드&nbsp;</th>
					<td>&nbsp;<input data-msg="패스워드" type="password" name="pwd" maxlength="51" onkeyup="chk(this.id, 50 )"
						id="_pwd" size="30" /></td>
				</tr>
				<tr>
					<th>찾기 질문&nbsp;</th>
					<td>&nbsp;<select name="quiz" id="_quiz" style="width: 285px;">
							<option value="내가 태어난 곳은?">내가 태어난 곳은?</option>
							<option value="출신 초등학교 이름은?">출신 초등학교 이름은?</option>
							<option value="아버지 성함은?">아버지 성함은?</option>
							<option value="나의 비밀은?">나의 비밀은? (아무한테도 말 안함!)</option>
					</select></td>
				</tr>
				<tr>
					<th>나의 답변&nbsp;</th>
					<td>&nbsp;<input type="text" id="_answer" name="answer" maxlength="41" onkeyup="chk(this.id, 40 )"
						style="width: 285px;"></td>
				</tr>
				<tr>
					<th>이 름&nbsp;</th>
					<td>&nbsp;<input data-msg="이름" type="text" name="name" maxlength="51" onkeyup="chk(this.id, 50 )"
						id="_name" size="30" /></td>
				</tr>
				<tr>
					<th>주 소&nbsp;</th>
					<td>&nbsp;<input data-msg="주소" type="text" name="address" maxlength="101" onkeyup="chk(this.id, 100 )"
						id="_address" size="30" /></td>
				</tr>
				<tr>
					<th>전화번호&nbsp;</th>
					<td>&nbsp;<input data-msg="폰" type="text" name="phone" maxlength="20" onkeyup="chk(this.id, 20 )"
						id="_phone" size="30" /></td>
				</tr>
				<tr>
					<th>성 별&nbsp;</th>
					<td>&nbsp;<input data-msg="성별" type="radio" name="gender"
						id="_male" value="남자" checked>남자 &nbsp; <input
						data-msg="성별" type="radio" name="gender" id="_female" value="여자">여자
						<span id="_pregnant"></span>
					</td>
				</tr>
				<tr>
					<th>나 이&nbsp;</th>
					<td>&nbsp;<input data-msg="나이" type="number" name="age" max=999 maxlength="4" onkeyup="chk(this.id, 3 )"
						id="_age" min=1  style="width: 100px"> 세
				</tr>
				<tr>
					<th>키&nbsp;</th>
					<td>&nbsp;<input data-msg="키" type="number" name="height" maxlength="4" onkeyup="chk(this.id, 3 )"
						id="_height" min=1 max=999 style="width: 100px"> cm
				</tr>
				<tr>
					<th>몸무게&nbsp;</th>
					<td>&nbsp;<input data-msg="몸무게" type="number" name="weight" maxlength="4" onkeyup="chk(this.id, 3 )"
						id="_weight" min=1 max=999 style="width: 100px"> kg
				</tr>
				<tr>

					<th>특이사항&nbsp;</th>
					<td>&nbsp; <input type="checkbox" name="options" value="유아" />
						유아 <input type="checkbox" name="options" value="고혈압" /> 고혈압 <input
						type="checkbox" name="options" value="당뇨" /> 당뇨 <input
						type="checkbox" name="options" value="비만" /> 비만 <input
						type="checkbox" name="options" value="학생" /> 학생

					</td>
				</tr>
				<tr>
					<td colspan="2" style="height: 50px; text-align: center;">
						<hr /> <b>알레르기</b>
						<hr />
						<fieldset>
							<input type="checkbox" name="box" value="대두" /> 대두 &nbsp; <input
								type="checkbox" name="box" value="땅콩" /> 땅콩 &nbsp; <input
								type="checkbox" name="box" value="우유" /> 우유 &nbsp; <input
								type="checkbox" name="box" value="게" /> 게 &nbsp; <br />

							<!-- 						</td> -->
							<!-- 				</tr> -->
							<!-- 				<tr> -->
							<!-- 					<td colspan="2" style="height: 50px; text-align: center;"> -->
							<input type="checkbox" name="box" value="새우" /> 새우 &nbsp; <input
								type="checkbox" name="box" value="참치" /> 참치 &nbsp; <input
								type="checkbox" name="box" value="연어" /> 연어 &nbsp; <input
								type="checkbox" name="box" value="쑥" /> 쑥 &nbsp; <br />
							<!-- 						</td> -->
							<!-- 				</tr> -->
							<!-- 				<tr> -->
							<!-- 					<td colspan="2" style="height: 50px; text-align: center;"> -->
							<input type="checkbox" name="box" value="소고기" /> 소고기 &nbsp; <input
								type="checkbox" name="box" value="닭고기" /> 닭고기 &nbsp; <input
								type="checkbox" name="box" value="돼지고기" /> 돼지고기 &nbsp; <br />
							<!-- 						</td> -->
							<!-- 				</tr> -->
							<!-- 				<tr> -->
							<!-- 					<td colspan="2" style="height: 50px; text-align: center;"> -->
							<input type="checkbox" name="box" value="복숭아" /> 복숭아 &nbsp; <input
								type="checkbox" name="box" value="민들레" /> 민들레 &nbsp; <input
								type="checkbox" name="box" value="계란휜자" /> 계란휜자 &nbsp; <br />
						</fieldset>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="height: 50px; text-align: center;">
						<button type="button" class="btn btn-success" id="_btnRegi">회원가입</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<script type="text/javascript">
		function chk(thisid, lim) { //바이트 제한 숫자를 매개변수로 받음
			var id = "#" + thisid;
			var v = $(id).val();

			re0 = /[a-z]|[0-9]/gi; //영숫자 패턴
			re1 = /[ㄱ-힣]/g; //한글패턴
			english = v.match(re0); //매치확인
			korean = v.match(re1); //매치확인

			if (english != null)
				english = english.length; //바이트 구함
			if (korean != null)
				korean = korean.length; //바이트 구함

			tot = english + (korean * 2); //합을 구함
			if (tot <= lim) { //한계수치이내인경우 바이트표시
				// f.t1.value=tot;
			} else { //한계를 초과하면 경고문 출력
				alert('글자수 제한은 '+lim+'바이트 입니다.');
				$(id).val($(id).val().slice(0,-1));
			}
		};

		// 	var maleClick = function(){
		var preg = '<input type="checkbox" name="options" value="임산부"/> 임신 중';
		$("#_male").click(function() {
			$('#_pregnant').empty();
			// 			return false;
		})

		$("#_female").click(function() {
			$('#_pregnant').html(preg);
		})

		$("#_dupl").click(function() {
			if ($("#_userid").val() == "") {
				alert("아이디를 입력해주세요.");
			} else {
				$.ajax({
					type : "POST",
					url : "./idCheck.do",
					async : true,
					data : "id=" + $("#_userid").val(),
					success : function(msg) {
						$("#_able").text(msg);
						$("#_duplresult").val(msg);
					}
				});
			}
		})

		$("#_btnRegi")
				.click(
						function() {

							var values = document.getElementsByName("box");
							var str = "";
							for (var i = 0; i < values.length; i++) {
								if (values[i].checked) {
									str = str + values[i].value + " ";
								}
							}

							if ($("#_duplresult").val() == "yet") {
								alert("아이디 중복 체크를 해주세요~");
								$("#_userid").focus();
								return false;
							} else if ($("#_duplresult").val() == "사용이 불가능합니다.") {
								alert("중복되지 않는 아이디를 사용해주세요.");
								$("#_userid").focus();
								return false;
							} else if ($("#_userid").val() == "") {
								alert($("#_userid").attr("data-msg")
										+ "를 제대로 입력해 주십시요.");
								$("#_userid").focus();
								return false;
							} else if ($("#_pwd").val() == "") {
								alert($("#_pwd").attr("data-msg")
										+ "를 제대로 입력해 주십시요.");
								$("#_pwd").focus();
								return false;
							} else if ($("#_answer").val() == "") {
								alert("비밀번호 찾기 답변을 제대로 선택해주세요.");
								$("#_answer").focus();
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
								alert("전화번호를 제대로 입력해 주십시요.");
								$("#_phone").focus();
								return false;
							} else if (!$("#_age").val()
									|| $("#_age").val() > 1000) {
								alert("나이를 제대로 입력해 주십시요.\n(최대 1000)");
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
							} else {
								$("#_frmForm").attr({
									"target" : "_self",
									"action" : "./regi.do"
								}).submit();
							}
						});
	</script>
</body>
</html>