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
				text : "영양소 차트"
			},
			subtitles : [ {
				text : "nutr"
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

<div style="height: 37px; background-color: gray" >
<%-- <span style="display:block; width: 300px; margin: 0 auto; color: black; align-content: center"> ${f.name } </span> --%>
</div>

	<div style="display: none">
		<div id=nutr1>${f.nutr1}</div>
		<div id=nutr2>${f.nutr2}</div>
		<div id=nutr3>${f.nutr3}</div>
		<div id=nutr4>${f.nutr4}</div>
		<div id=nutr5>${f.nutr5}</div>
		<div id=nutr6>${f.nutr6}</div>
		<div id=nutr7>${f.nutr7}</div>
		<div id=nutr8>${f.nutr8}</div>
		<div id=nutr9>${f.nutr9}</div>
	</div>

	<div align="center">
		<input type="hidden" id="_myPrimaryop" value="${login.primaryop }">
		<input type="hidden" id="_myName" value="${login.name }">
		<img width="200" height="200"
					src="food${f.image}" style="margin: 10px">
		<font color="black">
		<table class="list_table" style="width: auto;">
			<tr>
				<th>제품명</th>
				<th>제조사</th>
				<th>1회 제공량</th>
				<th>칼로리</th>
				<th>탄수화물</th>
				<th>단백질</th>
				<th>지방</th>
				<th>당류</th>
				<th>나트륨</th>
				<th>콜레스테롤</th>
				<th>포화지방산</th>
				<th>트랜스지방</th>
			</tr>
			<tr>
				<td width="100">${f.name}</td>
				<td width="100">${f.maker}</td>
				<td width="100">${f.serving} g</td>
				<td width="100" id="_cal">${f.nutr1} kcal</td>
				<td width="100" id="_car">${f.nutr2} g</td>
				<td width="100" id="_pro">${f.nutr3} g</td>
				<td width="100" id="_fat">${f.nutr4} g</td>
				<td width="100" id="_sur">${f.nutr5} g</td>
				<td width="100" id="_nat">${f.nutr6} mg</td>
				<td width="100">${f.nutr7} mg</td>
				<td width="100">${f.nutr8} g</td>
				<td width="100">${f.nutr9} g</td>
			</tr>
		</table>
</font>
		<div id="chartContainer" style="height: 370px; width: 100%;"
			align="center"></div>

		<div>
			<h4>클릭 횟수</h4>
			<h5>${count}</h5>
			<h4>알레르기 유발 재료</h4>
			<div id="allergy" style="color: blue;">${hazard}</div>

			<h4>경고</h4>
			<div id="myallergy"
				style="color: yellow; background-color: red; padding: 20px;">${myallergy}</div>
			<br />
			<button type="button" class="btn btn-warning" id="_btnEat">음식
				섭취</button>
		</div>

		<!-- 여기가 리뷰 시작 -->
		<div id="_reviews">
			<hr />
			<h2>* R E V I E W *</h2>
			<br />
			<h4>${reviewInfo.count }개리뷰 / 평균 평점 : ${reviewInfo.avgScore }</h4>
			<!-- 		입력창 시작 -->
			<div id="_writeReview">
				<form action="" method="post" id="_reviewSubmit">
					<input type="hidden" name="food_code" value="${f.code }" /> <input
						type="hidden" name="food_name" value="${f.name }" />
					<table style="text-align: center">
						<tr>
							<th rowspan="1"><input name="writer" value="${login.id }"
								readonly="readonly" style="text-align: center;"
								size="${fn:length(login.id) }" />&nbsp;</th>
							<th rowspan="3"><textarea id="_contents" name="contents"
									rows="4" cols="70%" placeholder="리뷰를 입력해주세용 제발"></textarea></th>
							<th rowspan="3">&nbsp;
								<button id="_submit">제출</button>
							</th>
						</tr>
						<tr>
							<th>&nbsp;<select name="score">
									<option value="1" selected>1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
							</select>&nbsp; 점
							</th>
						</tr>
					</table>
				</form>
			</div>
			<!-- 		입력창 종료 -->

			<c:set var="reviews" value="${reviews}" />
			<c:choose>
				<c:when test='${empty reviews}'>
					<div>
						<span>리뷰가 없습니다.</span>
					</div>
				</c:when>

				<c:otherwise>
					<c:forEach items="${ reviews}" var="review" varStatus="vs">
						<div id="_reviewOne">
							<hr />
							<span>[ 작성자 : ${review.writer} &nbsp;] <br /> 별점 : <c:set
									var="nmg" value="${ 5- review.score}" /> <fmt:formatNumber
									value="${nmg}" type="number" var="numberType" /> <c:forEach
									var="i" begin="1" end="${review.score}">
									★
								</c:forEach> <c:forEach var="j" begin="1" end="${ nmg}">
									☆
								</c:forEach> <br /> <b>${review.contents}</b><br /> ${review.wdate }
							</span> <br />
							<button
								onclick="deleteReview( '${ review.writer}', ${review.review_seq}, ${review.food_code})">x</button>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<hr />
			<br />
			<div id="_recentPage" style="" align="center">
				<c:forEach var="i" begin="1" end="${totPage}">
					<a href="/ssafyvue/foodDetail.do?code=${f.code}&recentPage=${i}">
						<c:out value="${i }" />
					</a>
				</c:forEach>
				<br />
			</div>
		</div>

		<!-- 여기가 리뷰 끝 -->
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
			var cal = $("#_cal").text();
			var car = $("#_car").text();
			var pro = $("#_pro").text();
			var fat = $("#_fat").text();
			var sur = $("#_sur").text();
			var nat = $("#_nat").text();
			
			var info = "[주의] '"+name+"'님은 <"+me+">입니다.\n";
			
			if(me=="유아"){
				info += "- 당류 함량 : "+sur +", 나트륨 함량 : "+nat+" 입니다.";
			}
			else if(me=="고혈압"){
				info += "- 나트륨 함량 : "+nat+" 입니다.";
			}
			else if(me=="당뇨"){
				info += "- 탄수화물 함량 : "+car +", 당류 함량 : "+sur+" 입니다.";
			}
			else if(me=="비만"){
				info += "- 칼로리 : "+cal +", 탄수화물 함량 : "+car+"지방 함량 : "+fat+"\n"
				+ "당류 함량 : "+sur+", 나트륨 함량 : "+nat+ " 입니다.";
			}
			else if(me=="학생"){
				info += "- 칼로리 : "+cal;
			}
			else if(me=="임산부"){
				info += "-칼로리 : "+cal+", 당류 함량 : "+sur+", 나트륨 함량 : "+nat+"입니다.";
			}
			info += "\n정말 드시겠습니까?";
					
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