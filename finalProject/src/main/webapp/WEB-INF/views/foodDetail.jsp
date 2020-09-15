<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Food Detail</title>

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

<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>

<script type="text/javascript">
	window.onload = function() {

		var options = {
			title : {
				text : ""
			},
			subtitles : [ {
				text : ""
			} ],
			animationEnabled : true,
			data : [ {
				type : "pie",
				startAngle : 40,
				toolTipContent : "<b>{label}</b>: {y}",
				showInLegend : "true",
				legendText : "{label}",
				indexLabelFontSize : 16,
				indexLabel : "{label} - {y}",
				dataPoints : [ {
					y : parseFloat($("#nutr1").text()),
					label : "칼로리"
				}, {
					y : parseFloat($("#nutr2").text()),
					label : "탄수화물"
				}, {
					y : parseFloat($("#nutr3").text()),
					label : "단백질"
				}, {
					y : parseFloat($("#nutr4").text()),
					label : "지방"
				}, {
					y : parseFloat($("#nutr5").text()),
					label : "당류"
				}, {
					y : parseFloat($("#nutr6").text()),
					label : "나트륨"
				}, {
					y : parseFloat($("#nutr7").text()),
					label : "콜레스테롤"
				}, {
					y : parseFloat($("#nutr8").text()),
					label : "포화지방산"
				}, {
					y : parseFloat($("#nutr9").text()),
					label : "트랜스지방"
				} ]
			} ]
		};
		$("#chartContainer").CanvasJSChart(options);

	}
	
	deleteReview = function(id, seq, code){
		if(${login.auth}==1){
			// 운영자니까 지울 수 있다.
		}
		else if(${login.id} != id){
			alert("작성자만 지울 수 있습니다!");
			return false;
		}
		location.href = "reviewDelete.do?review_seq=" +seq+"&food_code="+code;
		return false;
	}
	
</script>

</head>
<body>
	<%-- <jsp:include page="nav.jsp"></jsp:include> --%>
	<%-- 	<%@ include file="nav.jsp"%> --%>
	<!-- 				여기에서 색깔 입히자 -->
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
	</c:choose>
	<div
		style="height: 33px; background-color: ${myBackColor}; margin-bottom: 15px">
		<%-- <span style="display:block; width: 300px; margin: 0 auto; color: black; align-content: center"> ${f.name } </span> --%>
	</div>

	<div style="display: none">
		<span id=nutr1>${f.nutr1}</span> <span id=nutr2>${f.nutr2}</span> <span
			id=nutr3>${f.nutr3}</span> <span id=nutr4>${f.nutr4}</span> <span
			id=nutr5>${f.nutr5}</span> <span id=nutr6>${f.nutr6}</span> <span
			id=nutr7>${f.nutr7}span <span id=nutr8>${f.nutr8}</span> <span
			id=nutr9>${f.nutr9}</span>
	</div>

	<div align="center" style="width: 100%">
	<div style="width: 270px; margin: 15px auto; background-color: ${myBackColor}; color:${myColor}">
			<font size="10px;" color="White"><b>식품 정보</b></font><br/>
		</div>
		<input type="hidden" id="_myPrimaryop" value="${login.primaryop }">
		<input type="hidden" id="_myName" value="${login.name }">
		<!-- 		<div style="border: 2px; border-color: black"> -->
		<table width="80%">
			<colgroup>
				<col width="43%">
				<col width="12%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			
			<c:choose>
			<c:when test="${f.foodgroup eq '주류' }">
			<tr height="2px">
				<td></td>
			</tr>
			<tr height="35px">
				<th rowspan="13" style="text-align: center;"><img width="300"
					height="300" src="food${f.image}" style="margin: 10px"></th>
				<th colspan="1"
					style="text-align: center; color: white;"></th>
				<td colspan="2" style="text-align: center;"></td>
			</tr>
			<tr height="2px">
				<td></td>
			</tr>
			
			<tr height="35px" style="text-align: center;">
				<th colspan="1"
					style="text-align: center; color: white; background-color: ${myColor}">제
					품 명</th>
				<td colspan="2" style="text-align: center;">${f.name }</td>
			</tr>	
			<tr height="2px">
				<td></td>
			<tr height="35px">
				<th colspan="1"
					style="text-align: center; color: white; background-color: ${myColor}">제조사</th>
				<td colspan="2" style="text-align: center;">${f.maker }</td>
			<tr height="2px">
				<td></td>
			</tr>
			<tr height="35px">
			<th colspan="1"
					style="text-align: center; color: white;"></th>
				<td colspan="2" style="text-align: center;"></td>
			</tr>
			<tr height="2px" style="text-align: center;">
				<td></td>
			</tr>
			<tr height="35px">
				<th colspan="1"
					style="text-align: center; color: white;"></th>
				<td colspan="2" style="text-align: center;"></td>
			</tr>
			<tr height="2px">
				<td></td>
			</tr>
			<th colspan="1"
					style="text-align: center; color: white;"></th>
				<td colspan="2" style="text-align: center;"></td>
			</tr>
			<th colspan="4"
					style="text-align: center; color: black;">'주류'는 영양 성분을 제공하지 않습니다.</th>
			</tr>
			</c:when>
			
			<c:otherwise>
			<tr height="2px">
				<td></td>
			</tr>
			<tr height="35px">
				<th rowspan="13" style="text-align: center;"><img width="300"
					height="300" src="food${f.image}" style="margin: 10px"></th>
				<th colspan="1"
					style="text-align: center; color: white; background-color: ${myColor}">제
					품 명</th>
				<td colspan="2" style="text-align: center;">${f.name }</td>
			</tr>
			<tr height="2px">
				<td></td>
			</tr>
			<tr height="35px">
				<th colspan="1"
					style="text-align: center; color: white; background-color: ${myColor}">제조사</th>
				<td colspan="1" style="text-align: center;">${f.maker }</td>
			</tr>
			<tr height="2px">
				<td></td>
			<tr height="35px">
				<th colspan="1"
					style="text-align: center; color: white; background-color: ${myColor}">1회
					제공량</th>
				<td colspan="1" style="text-align: center;">${f.serving }</td>
				<th colspan="1"
					style="text-align: center; color: white; background-color: ${myColor}">칼로리</th>
				<td colspan="1" style="text-align: center;">${f.nutr1}kcal</td>
			</tr>
			<tr height="2px">
				<td></td>
			</tr>
			<tr height="35px">
				<th colspan="1"
					style="text-align: center; color: white; background-color: ${myColor}">탄수화물</th>
				<td colspan="1" style="text-align: center;">${f.nutr2}g</td>
				<th colspan="1"
					style="text-align: center; color: white; background-color: ${myColor}">콜레스테롤</th>
				<td colspan="1" style="text-align: center;">${f.nutr7}mg</td>
			</tr>
			<tr height="2px" style="text-align: center;">
				<td></td>
			</tr>
			<tr height="35px">
				<th colspan="1"
					style="text-align: center; color: white; background-color: ${myColor}">단백질</th>
				<td colspan="1" style="text-align: center;">${f.nutr3}g</td>
				<th colspan="1"
					style="text-align: center; color: white; background-color: ${myColor}">포화지방산</th>
				<td colspan="1" style="text-align: center;">${f.nutr8}g</td>
			</tr>
			<tr height="2px">
				<td></td>
			</tr>
			<tr height="35px">
				<th colspan="1"
					style="text-align: center; color: white; background-color: ${myColor}">지방</th>
				<td colspan="1" style="text-align: center;">${f.nutr4}g</td>
				<th colspan="1"
					style="text-align: center; color: white; background-color: ${myColor}">트랜스지방</th>
				<td colspan="1" style="text-align: center;">${f.nutr9}g</td>
			</tr>
			<tr height="2px">
				<td></td>
			</tr>
			<tr height="35px">
				<th colspan="1"
					style="text-align: center; color: white; background-color:${myColor}">당류</th>
				<td colspan="1" style="text-align: center;">${f.nutr5}g</td>
				<th colspan="1"
					style="text-align: center; color: white; background-color: ${myColor}">나트륨</th>
				<td colspan="1" style="text-align: center;">${f.nutr6}mg</td>
			</tr>
			</c:otherwise>			</c:choose>
		</table>
		<hr />

		조회수 ${count} | 리뷰 ${reviewInfo.count }개 | 평점 ${reviewInfo.avgScore }점<br />
		<br />
		<div style="width: 80%">
			<div id="myallergy"
				style="color: yellow; background-color: red; padding: 20px;">${myallergy}</div>
				<c:if test="${user eq '임산부'}">
				<div align='center'>
					<span><b><font color=blue>임산부 주의 재료 : ${prag}</font></b></span>
				</div></c:if>
			<br />
			<button type="button" class="btn btn-warning" id="_btnEat">음식
				섭취</button>
		</div>
		<br/>

		<c:set var="reviews" value="${reviews}" />
		<c:choose>
			<c:when test='${empty reviews}'>
				<div style="height:150px">
					<span><br/>리뷰가 없습니다.</span>
				</div>
			</c:when>

			<c:otherwise>
				<c:forEach items="${ reviews}" var="review" varStatus="vs">
					<div id="_reviewOne" align="left" style="margin-left: 10px">

						<div
							style="float: left; width: 10px; height: 70px; margin-left: 10px; margin-right: 10px; background-color: ${myColor}	"></div>
						<span><b>${review.writer}</b>&nbsp;(${review.wdate })<br />
							[<c:set var="nmg" value="${ 5- review.score}" /> <fmt:formatNumber
								value="${nmg}" type="number" var="numberType" /> <c:forEach
								var="i" begin="1" end="${review.score}">★</c:forEach> <c:forEach
								var="j" begin="1" end="${ nmg}">☆</c:forEach> ] <b>${review.contents}</b></span>
						<a href="#" style="color:${myBackColor}"
							onclick="deleteReview( '${ review.writer}', ${review.review_seq}, ${review.food_code})">x</a>
						<hr />
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>

		<!-- 		입력창 시작 -->
		<div id="_writeReview">
			<form action="" method="post" id="_reviewSubmit">
				<input type="hidden" name="food_code" value="${f.code }" /> <input
					type="hidden" name="food_name" value="${f.name }" />
				<table style="text-align: center">
					<tr>
						<th rowspan="1"><input name="writer"
							value="${login.id }" readonly="readonly"
							style="text-align: center;" size="${fn:length(login.id) +8}" />&nbsp;</th>
						<th rowspan="3"><textarea id="_contents" name="contents" maxlength="1001" onkeyup="chk(this.id, 1000 )"
								rows="4" cols="70%" placeholder="리뷰를 입력해주세요~"></textarea></th>
						<th rowspan="3">&nbsp;
							<button id="_submit">제출</button>
						</th>
					</tr>
					<tr>
						<th>&nbsp;평점 : <select name="score">
								<option value="1" selected>1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
						</select>&nbsp; 점 &nbsp;&nbsp;
						</th>
					</tr>
				</table>
			</form>
		</div>
		<!-- 		입력창 종료 -->
		<div id="_recentPage" style="" align="center">
			<c:forEach var="i" begin="1" end="${totPage}">
				<a href="/ssafyvue/foodDetail.do?code=${f.code}&recentPage=${i}">
					&nbsp;<b style="color:${myBackColor}"><c:out value="${i }" /></b>&nbsp;
				</a>
			</c:forEach>
			<br />
		</div>
		<!-- 		</div> -->
		<div
			style="width: 100%; height: 5px; background-color: ${myBackColor}; margin: 20px 0;"></div>
	<div style="width: 270px; margin: 15px auto; background-color: ${myBackColor}; color:${myColor}">
			<font size="10px;" color="White"><b>세부 사항</b></font><br/>
		</div>
		
		<c:choose>
		<c:when test="${f.foodgroup eq '주류' }">
		<div id="_nochart" style="height: 20px; width: 100%;"
			align="center"><span style="padding-top: 65px">'주류'는 영양 성분 차트를 제공하지 않습니다!</span></div>
		</c:when>
		<c:otherwise>
			<div id="chartContainer" style="height: 370px; width: 100%;"
			align="center"></div>
		</c:otherwise>
		</c:choose>
		
		
	
		<div style="width: 70%">
			<br /><font color="black"><b>알레르기 유발 재료 :</b> ${hazard }<br /> <br /> <span>${f.material }</span></font><br />
			<br/> <br/>
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

		$("#_btnEat").click(function() {
			var me = $("#_myPrimaryop").val();
			var name = $("#_myName").val();
			var cal = $("#nutr1").text();
			var car = $("#nutr2").text();
			var pro = $("#nutr3").text();
			var fat = $("#nutr4").text();
			var sur = $("#nutr5").text();
			var nat = $("#nutr6").text();
			
			var info = name+"님은 <"+me+">입니다.\n";
			
			if(me=="유아"){
				info += "- 당류 함량 : "+sur +"g, 나트륨 함량 : "+nat+"mg";
			}
			else if(me=="고혈압"){
				info += "- 나트륨 함량 : "+nat+"mg";
			}
			else if(me=="당뇨"){
				info += "- 탄수화물 함량 : "+car +"g, 당류 함량 : "+sur+"g";
			}
			else if(me=="학생"){
				info += "- 칼로리 : "+cal+"kcal";
			}
			else if(me=="임산부"){
				info += "- 칼로리 : "+cal+"kcal, 당류 함량 : "+sur+"mg, 나트륨 함량 : "+nat+"g";
			}
			else{
				info += "- 칼로리 : "+cal +"kcal, 탄수화물 함량 : "+car+"g, 지방 함량 : "+fat+"g, \n"
				+ "당류 함량 : "+sur+", 나트륨 함량 : "+nat+ "";
			}
			info += "\n\n정말 드시겠습니까?";
					
			if(confirm(info)){
				location.href = "addfood.do?code=" + ${f.code};
			return false;}
			else{
				alert("잘~~생각하셨습니다.");
				return false;
			}
		});
		
		$("#_submit").click(function() {
 			if ($("#_contents").val() == "") {
				alert("내용을 입력해주세요!");
				$("#_contents").focus();
				return false;
			} 

			$("#_reviewSubmit").attr({
				"target" : "_self",
				"action" : "./writeReview.do"
			}).submit();
		});
	</script>
</body>
</html>