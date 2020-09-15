<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Food Search Form</title>

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

<style type="text/css">
      
      .a{
       	margin: 10px auto;
        text-align: center;
        font-family: Consolas, monospace;
        font-size: 15px;
        border: 4px dashed #bcbcbc;
        color: #FF6F61;
        font-size: 18px;
        width: 500px;
      }
    </style>
    
</head>
<body>
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
<hr/>
	<div align="center">
	<div style="width: 570px; margin: 15px auto; background-color: ${myBackColor};">
			<font size="15px;" color="White"><b>${foods[0].date}일 섭취 식품 </b></font><br/>
		</div>
		<c:set var = "calsum" value = "0" />
		<c:set var = "carsum" value = "0" />
		<c:set var = "prosum" value = "0" />
		<c:set var = "fatsum" value = "0" />
		<table class="list_table" style="width: auto;">
			<tr>
				<th style="text-align: center">식품명</th>
				<th style="text-align: center">섭취 횟수</th>
				<th style="text-align: center">칼로리</th>
				<th style="text-align: center">탄수화물</th>
				<th style="text-align: center">단백질</th>
				<th style="text-align: center">지방</th>
				<th style="text-align: center">삭제</th>
			</tr>
			<c:if test='${empty foods}'>
				<tr>
					<td colspan="5">목록이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${foods}" var="f">
				<tr onclick="fooddetail('${f.food_code}')">
					<td width="200"  align="center">${f.name}</td>
					<td width="100" align="center">${f.count} 회</td>
					<td width="100" align="center">${f.calorie} kcal</td>
						<td width="100" align="center">${f.car} g</td>
							<td width="100" align="center">${f.pro} g</td>
								<td width="100" align="center">${f.fat} g</td>
					<td width="50px" align="center"><a href="#" onclick="fooddelete('${f.foodmember_id}','${f.food_code}','${f.date }')">X</a></td>
					<c:set var= "calsum" value="${calsum + f.calorie}"/>
					<c:set var= "carsum" value="${carsum + f.car}"/>
					<c:set var= "prosum" value="${prosum + f.pro}"/>
					<c:set var= "fatsum" value="${fatsum + f.fat}"/>
				</tr>
				</c:forEach>
		</table>
	<b><br/> 총 섭취 칼로리: <fmt:formatNumber value="${calsum}" pattern=".00"/> kcal&nbsp; | &nbsp; 
	 총 섭취 탄수화물: <fmt:formatNumber value="${carsum}" pattern=".00"/> g&nbsp; | &nbsp;
	 총 섭취 단백질: <fmt:formatNumber value="${prosum}" pattern=".00"/> g&nbsp; | &nbsp;
	 총 섭취 지방: <fmt:formatNumber value="${fatsum}" pattern=".00"/> g</b> 
	</div>
	<c:set var= "cpf" value="${carsum+prosum+fatsum}"/>
	
	<c:set var= "metabolism" value="0"/>
	
	<c:if test="${myself.gender eq '여자'}">
	<c:set var= "weight" value="${myself.weight}"/>
	<c:set var= "height" value="${myself.height}"/>
	<c:set var= "age" value="${myself.age}"/>
	<c:set var= "metabolism" value="${655.1+(9.56*weight)+(1.85*height)-(4.68*age)}"/>
	</c:if>
	
	<c:if test="${myself.gender eq '남자'}">
	<c:set var= "weight" value="${myself.weight}"/>
	<c:set var= "height" value="${myself.height}"/>
	<c:set var= "age" value="${myself.age}"/>
	<c:set var= "metabolism" value="${66.47+(13.75*weight)+(5*height)-(6.76*age)}"/>	
	</c:if>
	
	<c:if test="${isLack eq false}">
	<c:set var= "metabolism" value="${metabolism*1.3}"/>
	</c:if>
	
	<c:if test='${calsum > metabolism}'>
		<div class="a">
			<b>일일 섭취량 초과 했습니다.</b>
		</div>
	</c:if>
	
	<c:set var= "ratio" value="false"/>
	<c:choose>
	<c:when test="${carsum < cpf*0.45 || carsum > cpf*0.55}">
	<c:set var= "ratio" value="true"/>
	</c:when>
	<c:when test="${prosum < cpf*0.25 || prosum > cpf*0.35}">
	<c:set var= "ratio" value="true"/>
	</c:when>
	<c:when test="${fatsum < cpf*0.15 || fatsum > cpf*0.25}">
	<c:set var= "ratio" value="true"/>
	</c:when>
	</c:choose>
	<c:if test="${ratio eq true}">
		<div class="a">
			<b>탄단지 비율이 나쁩니다.</b>
		</div>
	</c:if>
	
	<div id="_recentPage" style="" align = "center">
		<c:forEach var="i" begin="1" end="${totPage }">
			<a href="search.do?recentPage=${i}"> <c:out
					value="${i }" />
			</a>
		</c:forEach>
	</div>

	<script type="text/javascript">		
		function fooddelete(id, code,date) {
			location.href="./fooddelete.do?foodmember_id="+id+"&food_code="+code+"&date="+date;
		}
		function fooddetail(code) {
			window.open("./foodDetail.do?code=" + code,'상세정보','width=1310, height=800, left='+((document.body.offsetWidth / 2) - (1310 / 2))+', top='+((document.body.offsetHeight / 2) - (800/ 2)) + ', menubar=no, status=no, toolbar=no');
		}
	</script>
</body>
</html>