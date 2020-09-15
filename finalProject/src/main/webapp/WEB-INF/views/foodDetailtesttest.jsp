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
				},{
					y : parseFloat($("#nutr9").text()),
					label : "트랜스지방"
				} ]
			} ]
		};
		$("#chartContainer").CanvasJSChart(options);
	
		
		
	}
</script>

</head>
<body>
<%-- <jsp:include page="nav.jsp"></jsp:include> --%>
<%-- 	<%@ include file="nav.jsp"%> --%>

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
	<img width="200" height="200"
					src="food${f.image}" style="margin:0 auto">
		<div id="chartContainer" style="height: 370px; width: 100%;" align="center"></div>
		
	</div>
</body>
</html>