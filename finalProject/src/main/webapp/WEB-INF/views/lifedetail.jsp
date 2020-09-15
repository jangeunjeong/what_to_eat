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
	
	<style type="text/css">
		#test  {
		    margin-top: 25px;
		    font-size: 21px;
		    text-align: center;
		    animation: fadein 2s;
		    -moz-animation: fadein 2s; /* Firefox */
		    -webkit-animation: fadein 2s; /* Safari and Chrome */
		    -o-animation: fadein 2s; /* Opera */
		}
		@keyframes fadein {
		    from {
		        opacity:0;
		    }
		    to {
		        opacity:1;
		    }
		}
		@-moz-keyframes fadein { /* Firefox */
		    from {
		        opacity:0;
		    }
		    to {
		        opacity:1;
		    }
		}
		@-webkit-keyframes fadein { /* Safari and Chrome */
		    from {
		        opacity:0;
		    }
		    to {
		        opacity:1;
		    }
		}
		@-o-keyframes fadein { /* Opera */
		    from {
		        opacity:0;
		    }
		    to {
		        opacity: 1;
		    }
		}		

		img.opac:hover { opacity: 0.5;  transform: scale( 1.5 );} 

	</style>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
<div id="test">
	<div align="center">
	<table class="list_table" style="width: auto; text-align: center;">
		<tr>
<%-- 				<c:forEach items="${foods}" var="f" varStatus="vs"> --%>
<%-- 					<c:if test="${vs.index % 4 == 0}"> --%>
<!-- 						</tr><tr height="300"> -->
<%-- 					</c:if> --%>
<%-- 					<td width="300" onclick="fooddetail('${f.code}')" ><img class="opac" width="200" height="200" src="food${f.image}"></td> --%>
<%-- 				</c:forEach> --%>
			<td width="300"<c:if test="${not empty auth}"> onclick="fooddetail('${foods[0].code}')" </c:if>><img class="opac" width="200" height="200" src="food${foods[0].image}"></td>
			<td width="300" <c:if test="${not empty auth}"> onclick="fooddetail('${foods[1].code}')"</c:if> ><img class="opac" width="200" height="200" src="food${foods[1].image}"></td>
			<td width="300" <c:if test="${not empty auth}"> onclick="fooddetail('${foods[2].code}')"</c:if> ><img class="opac" width="200" height="200" src="food${foods[2].image}"></td>
		</tr>
		<tr>
			<td width="300"><img width="350" height="350" src="images/lightening.png"></td>
			<td width="300" <c:if test="${not empty auth}"> onclick="fooddetail('${foods[3].code}')"</c:if> ><img class="opac" width="200" height="200" src="food${foods[3].image}"></td>
			<td width="300" <c:if test="${not empty auth}"> onclick="fooddetail('${foods[4].code}')"</c:if> ><img class="opac" width="200" height="200" src="food${foods[4].image}"></td>
		</tr>
	</table>
	</div>
</div>
<script type="text/javascript">
 	
	
		function fooddetail(code) {
			window.open("./foodDetail.do?code=" + code,'상세정보','width=1310, height=800, left='+((document.body.offsetWidth / 2) - (1310 / 2))+', top='+((document.body.offsetHeight / 2) - (800/ 2)) + ', menubar=no, status=no, toolbar=no');
		}
		$("#_btnIndex").click(function() {
			location.href = "./index.do";
		});
	</script>
</body>
</html>