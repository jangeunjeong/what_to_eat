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
	<div id="body_wrap">
		<div id="main_wrap">
			<div id="header_wrap" align="center">
				<div
					style="width: 320px; margin: 15px auto; background-color: #82ae46; color: #fff">
					<font size="15px;" color="White"><b>비밀번호 찾기</b></font>
				</div>
			</div>


			<div id="content_wrap" align="center">
				<form action="" method="post" id="_frmForm" name="frmForm">
					<table class="content_table" style="width: 25%;">
						<tr>
							<th>아이디</th>
							<td><input data-msg="아이디" type="text" name="id" id="_userid" maxlength="51"
								onkeyup="chk(this.id, 50)" value="" size="30" /></td>
						</tr>
						<tr>
							<th>질 문</th>
							<td><select name="quiz" id="_quiz" style="width: 285px;">
									<option value="내가 태어난 곳은?">내가 태어난 곳은?</option>
									<option value="출신 초등학교 이름은?">출신 초등학교 이름은?</option>
									<option value="아버지 성함은?">아버지 성함은?</option>
									<option value="나의 비밀은?">나의 비밀은?</option>
							</select></td>
						</tr>
						<tr>
							<th>답 변</th>
							<td><input data-msg="답변" type="text" name="answer"
								id="_answer" value="" size="30" maxlength="41"
								onkeyup="chk(this.id, 40)" /></td>
						</tr>
						<tr>
							<td colspan="2" style="height: 50px; text-align: center;">
								<button type="button" class="btn btn-success" id="_btnFind">비밀번호
									찾기</button>
								<button type="button" class="btn btn-warning" id="_btnIndex">돌아가기</button>
							</td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td><input style="background-color: #e2e2e2;"
								data-msg="패스워드" type="text" readonly="readonly" name="pwd"
								value="" id="_pwd" size="30" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
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

		$("#_btnFind").click(
				function() {
					if ($("#_userid").val() == "") {
						alert("아이디를 입력해주세요.");
						return false;
					}
					if ($("#_answer").val() == "") {
						alert("답변을 입력해주세요.");
						return false;
					}

					$.ajax({
						type : "POST",
						url : "./findPw.do",
						async : true,
						data : "id=" + $("#_userid").val() + "&answer="
								+ $("#_answer").val(),
						success : function(msg) {
							$("#_pwd").val(msg);
						}
					});

				});

		$("#_btnIndex").click(function() {
			location.href = "./";
		});
	</script>
</body>
</html>