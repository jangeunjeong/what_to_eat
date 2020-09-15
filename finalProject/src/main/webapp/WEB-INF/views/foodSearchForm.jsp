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

</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	
	<c:choose>
						<c:when test="${login.auth eq '1' }">
							<c:set var="myBackColor" value="#E1B643" />
						</c:when>
						<c:when test="${login.primaryop eq '유아'}">
							<c:set var="myBackColor" value="#f0bf59" />
						</c:when>
						<c:when test="${login.primaryop eq '임산부'}">
							<c:set var="myBackColor" value="#FF6F61" />
						</c:when>
						<c:when test="${login.primaryop eq '고혈압'}">
							<c:set var="myBackColor" value="#9C1B31" />
						</c:when>
						<c:when test="${login.primaryop eq '당뇨'}">
							<c:set var="myBackColor" value="#65488f" />
						</c:when>
						<c:when test="${login.primaryop eq '비만'}">
							<c:set var="myBackColor" value="#8CA4CF" />
						</c:when>
						<c:when test="${login.primaryop eq '학생'}">
							<c:set var="myBackColor" value="#88b04b" />
						</c:when>
						<c:when test="${login.primaryop eq '남자'}">
							<c:set var="myBackColor" value="#169c78" />
						</c:when>
						<c:when test="${login.primaryop eq '여자'}">
							<c:set var="myBackColor" value="#b565a7" />
						</c:when>
						<c:otherwise>
							<c:set var="myBackColor" value="#82ae46" />
						</c:otherwise>
					</c:choose>
	
	<div align="center">
	<hr/>
		<form name="frmForm1" id="_frmFormSearch" method="post"
			action="find.do">
			<input type="hidden" id="_searchPage" name="searchPage" />
			<table
				style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px; border: 0; padding: 0;">
				<tr>
					<td><select name="type" id="_type"
						style="word-wrap: normal; height: 45px; align-items: center; border-radius: .3rem;">
							<option value="all" <c:if test="${ not empty searchInfo && searchInfo.type == 'all'}">selected </c:if>>전체검색</option>
							<option value="name" <c:if test="${ not empty searchInfo && searchInfo.type == 'name'}">selected </c:if>>상품명</option>
							<option value="maker" <c:if test="${ not empty searchInfo && searchInfo.type == 'maker'}">selected </c:if>>제조사</option>
							<option value="material" <c:if test="${ not empty searchInfo && searchInfo.type == 'material'}">selected </c:if>>원재료</option>
					</select></td>
					<td style="padding-left: 5px;"><input type="text" maxlength="51" onkeyup="chk(this.id, 50 )"
					
						id="_keyword" name="keyword"
						<c:if test="${ not empty searchInfo}"> value="${searchInfo.keyword }"</c:if> /></td>
					<td style="padding-left: 5px;"><span class="button blue"><button
								type="button" id="_btnSearch">검색</button></span></td>
				</tr>
			</table>
		</form>
		<hr/>
		<br/>
		<table class="list_table"  border="15px;" style="width: 60%; border: 15px; color: black;">
			<tr>
				<th align="center" style="width: 15%"></th>
<!-- 				<th align="center" style="width: 10%"></th> -->
				<th align="center" style="width: 70%"></th>
				<th align="center" style="width: 15%"></th>
<!-- 				<th align="center">재료</th> -->
			</tr>
			
			<c:if test='${empty foods}'>
				<tr>
					<td colspan="5">목록이 없습니다.</td>
				</tr>
			</c:if>
			<c:set var="auth" value="${login.auth}" />
			<c:forEach items="${foods}" var="f">
				<tr
					<c:if test="${not empty auth}">
										onclick="fooddetail('${f.code}')"
									</c:if> >
					<td width="100" height="125" align="center" ><img width="100" height="100"
						src="food${f.image}"></td>
<%-- 					<td width="100" align="center">${f.code}</td> --%>
					<td width="200" align="center"><br/><font size="3px">${f.name}</font><br/>
					<font size="1px">(${f.reviews}개의 리뷰가 있습니다.)</font></td>
					<td width="100" align="center">${f.maker}</td>
<%-- 					<td>${f.material}</td> --%>
				</tr>
				<tr><td></td>
				<td></td>
				<td></td>
				<td></td></tr>
			</c:forEach>
		</table>
		<br/>
	</div>
	<c:if test="${ not empty searchInfo}">
	<div id="_SearchrecentPage" style="" align="center">
		<c:forEach var="i" begin="1" end="${searchtotPage}">
			&nbsp;<a href="#none" onclick="searchpage(${i})" style="color:${myBackColor}"><c:out value="${i }" />
			</a>
		</c:forEach>
	</div>
	</c:if>
	<div id="_recentPage" style="" align="center">
		<c:forEach var="i" begin="1" end="${totPage}">
			&nbsp;<a href="search.do?recentPage=${i}" style="color:${myBackColor}"> <c:out value="${i }" />
			</a>&nbsp;
		</c:forEach>
		<br/>
		<br/>
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
		 
		function searchpage(i){
			$("#_searchPage").val(i);
			$("#_frmFormSearch").attr({
 				"target" : "_self"
 			}).submit();
		};
		function fooddetail(code) {
			window.open("./foodDetail.do?code=" + code,'상세정보','width=1310, height=800, left='+((document.body.offsetWidth / 2) - (1310 / 2))+', top='+((document.body.offsetHeight / 2) - (800/ 2)) + ', menubar=no, status=no, toolbar=no');
		};
		
		$("#_btnSearch").click(function() {
			$("#_frmFormSearch").val(1);
			$("#_frmFormSearch").attr({
 				"target" : "_self"
 			}).submit();
 		});
	</script>
</body>
</html>