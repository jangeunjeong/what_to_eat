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
	
	<script type="text/javascript">
	$(function(){
		$('.hidden').css('display','none');
	})
	</script>
	<style type="text/css">
		table{
			width: 900px;
			height: 900px;
			border-spacing: 25px;
		}
		
		table tr:nth-child(odd) td:nth-child(odd),
		table tr:nth-child(even) td:nth-child(even) {
    		background: #8BB359;
    		color: white;
    	}
    
		td{
			width:150px;
			height:150px;
			box-sizing: border-box;
			border: 1px solid black;
			text-align: center;
		}
	</style>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<c:forEach items="${buffet}" var="b" varStatus="vs">
	<span class="hidden hidden-name${vs.index}">${b.name}</span>
	<span class="hidden hidden-code${vs.index}">${b.code}</span>
	</c:forEach>
	
	<div id="body_wrap">
		<div id="main_wrap">
			<div id="content_wrap" align="center">
				<form action="" method="post" id="_frmForm" name="frmForm">
					<div style="width: 230px; margin: 15px auto; background-color: #8BB359; color:#E09C43" align="center">
					<font size="15px;" color="White"><b>36 뷔 페</b></font>
				</div>
					<a class="dropdown-item" href="buffet.do">다시하기</a><br/>
					<table class="content_table" style="width: 80%;" border="1px">
					<c:set var="auth" value="${login.auth}" />
						<tr>
						<td <c:if test="${not empty auth}"> onclick="fooddetail('${buffet[0].code}')"</c:if>>${buffet[0].code}<br>${buffet[0].name}</td>
						<td <c:if test="${not empty auth}"> onclick="fooddetail('${buffet[1].code}')"</c:if>>${buffet[1].code}<br>${buffet[1].name}</td>
						<td  <c:if test="${not empty auth}">onclick="fooddetail('${buffet[2].code}')"</c:if>>${buffet[2].code}<br>${buffet[2].name}</td>
						<td <c:if test="${not empty auth}"> onclick="fooddetail('${buffet[3].code}')"</c:if>>${buffet[3].code}<br>${buffet[3].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[4].code}')"</c:if>>${buffet[4].code}<br>${buffet[4].name}</td>
						<td<c:if test="${not empty auth}"> onclick="fooddetail('${buffet[5].code}')"</c:if>>${buffet[5].code}<br>${buffet[5].name}</td>
						</tr>
						<tr >
						<td <c:if test="${not empty auth}"> onclick="fooddetail('${buffet[6].code}')"</c:if>>${buffet[6].code}<br>${buffet[6].name}</td>
						<td <c:if test="${not empty auth}"> onclick="fooddetail('${buffet[7].code}')"</c:if>>${buffet[7].code}<br>${buffet[7].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[8].code}')"</c:if>>${buffet[8].code}<br>${buffet[8].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[9].code}')"</c:if>>${buffet[9].code}<br>${buffet[9].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[10].code}')"</c:if>>${buffet[10].code}<br>${buffet[10].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[11].code}')"</c:if>>${buffet[11].code}<br>${buffet[11].name}</td>
						</tr>
						<tr >
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[12].code}')"</c:if>>${buffet[12].code}<br>${buffet[12].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[13].code}')"</c:if>>${buffet[13].code}<br>${buffet[13].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[14].code}')"</c:if>>${buffet[14].code}<br>${buffet[14].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[15].code}')"</c:if>>${buffet[15].code}<br>${buffet[15].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[16].code}')"</c:if>>${buffet[16].code}<br>${buffet[16].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[17].code}')"</c:if>>${buffet[17].code}<br>${buffet[17].name}</td>
						</tr>
						<tr >
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[18].code}')"</c:if>>${buffet[18].code}<br>${buffet[18].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[19].code}')"</c:if>>${buffet[19].code}<br>${buffet[19].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[20].code}')"</c:if>>${buffet[20].code}<br>${buffet[20].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[21].code}')"</c:if>>${buffet[21].code}<br>${buffet[21].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[22].code}')"</c:if>>${buffet[22].code}<br>${buffet[22].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[23].code}')"</c:if>>${buffet[23].code}<br>${buffet[23].name}</td>
						</tr>
						<tr >
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[24].code}')"</c:if>>${buffet[24].code}<br>${buffet[24].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[25].code}')"</c:if>>${buffet[25].code}<br>${buffet[25].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[26].code}')"</c:if>>${buffet[26].code}<br>${buffet[26].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[27].code}')"</c:if>>${buffet[27].code}<br>${buffet[27].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[28].code}')"</c:if>>${buffet[28].code}<br>${buffet[28].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[29].code}')"</c:if>>${buffet[29].code}<br>${buffet[29].name}</td>
						</tr>
						<tr >
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[30].code}')"</c:if>>${buffet[30].code}<br>${buffet[30].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[31].code}')"</c:if>>${buffet[31].code}<br>${buffet[31].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[32].code}')"</c:if>>${buffet[32].code}<br>${buffet[32].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[33].code}')"</c:if>>${buffet[33].code}<br>${buffet[33].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[34].code}')"</c:if>>${buffet[34].code}<br>${buffet[34].name}</td>
						<td <c:if test="${not empty auth}">onclick="fooddetail('${buffet[35].code}')"</c:if>>${buffet[35].code}<br>${buffet[35].name}</td>
						</tr>
					</table>
				</form>			
				<br>
					<button type="button" class="btn btn-success" id="_btnDice">주사위 던지기</button>
					<br><br>
					<span id="_d1"></span>
					<span id="_d2"></span>
<!-- 					<span id="_ans"></span> -->
					<span style="position: relative; bottom: 770px;"id="_dice1"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="position: relative; bottom: 770px;"id="_dice2"></span>
					<br>
					<span style="position: relative; left:10px; top: -660px;"id="_ans"></span>
					<br/>
					<br/>
					
			</div>
		</div>
	</div>

	<script type="text/javascript">
 	
	
		function fooddetail(code) {
			window.open("./foodDetail.do?code=" + code,'상세정보','width=1310, height=800, left='+((document.body.offsetWidth / 2) - (1310 / 2))+', top='+((document.body.offsetHeight / 2) - (800/ 2)) + ', menubar=no, status=no, toolbar=no');
		}
		
		$("#_btnDice").click(function() {
			
			var val1=parseInt((Math.random()*6)+1);
			var val2=parseInt((Math.random()*6)+1);
			var val3=parseInt((val1*val2)-1);
			var dice1 = "<img src=images/dice"+val1+".png width='200px' height='200px'>";
			var dice2 = "<img src=images/dice"+val2+".png width='200px' height='200px'>";
			
			var find = '.hidden-name'+val3;
			var findCode = '.hidden-code'+val3;
			
			console.log('test:'+$(find).text());
			$('#_ans').html('<span style="font-size:30px; background-color: black; color: white;">'+"<font color='yellow'><c:if test="${not empty auth}"><a href='#' onclick='fooddetail("+ $(findCode).text() +")'></c:if>"+
					$(find).text()+'<c:if test="${not empty auth}"></a></c:if></font> 을(를) 먹어보는 것은 어때요?</span>');
			
			$("#_dice1").html(dice1);
			$("#_dice2").html(dice2);
 			
			$('html, body').animate({
                scrollTop : 0
            }, 400);
		});
		

		$("#_btnIndex").click(function() {
			location.href = "./index.do";
		});
	</script>
</body>
</html>