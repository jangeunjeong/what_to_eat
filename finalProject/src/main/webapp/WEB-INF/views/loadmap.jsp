<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="utf-8">
<title>NOTICE</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery.cookie.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/table.css" />

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
			<c:set var="myBackColor" value="#82ae46" />
			<c:set var="myColor" value="#6bac12" />
		</c:otherwise>
	</c:choose>
	<div id="body_wrap">
		<div id="main_wrap"
			style="align-content: center; width: 90%; margin: 0 auto" align="center">
			<div id="header_wrap">
			<div style="width: 320px; margin: 15px auto; background-color: ${myBackColor}; color:${myColor}">
					<font size="15px;" color="White"><b>홈페이지 안내</b></font>
				</div><br /><br/>
			</div>
			<div class="content_wrap" style="float: top; width: 1200px" >

			<!-- 				여기서부터~ -->
				<div class="_ComponentBound" style=" height: 250px;">
					<div >
						<img style="margin-right: 25px;" src="./images/loadmap1.png" align="left" width="605px" height="225px" />
					</div>
					<div>
					<h2>1. 메인 화면</h2>
					<span>
						&nbsp;<b>오늘 뭐먹지</b>의 메인 페이지입니다.<br />회원 가입 시 체크한 개인별 <b>특이사항</b>에
							따른 사용자 <b>맞춤형 정보</b>를 제공합니다.<br />배너를 클릭하면 이동할 수 있습니다.<br />&nbsp; 그리고 홈페이지의 <b>테마 컬러</b>도 특이사항에 맞추어 변경 됩니다!<br />특이
							사항은 언제나 변경할 수 있으며, <b>유아>임산부>비만>당뇨>고혈압>학생>남자,여자</b> 순으로 우선순위를 가지고 있습니다.
					</span>	
					</div>
				</div>
				<hr/>
			<!-- 				여기까지가 한 단위 -->
				<!-- 				여기서부터~ -->
				<div class="_ComponentBound" style=" height: 250px;">
					<div >
						<img style="margin-right: 25px;" src="./images/loadmap2.png" align="left" width="605px" height="225px" />
					</div>
					<div>
					<br>
					<h2>2. 검색하기</h2>
					<span><br/>
						&nbsp;원하는 정보가 있다면 <b>상품명, 제조사명, 원재료명</b>으로 검색할 수 있습니다.<br/>다른 이용자들의 <b>리뷰</b>가 얼마나 있는지도 확인 할 수 있습니다.
						<br/><b>로그인</b>한 상태라면 <b>식품 상세 정보</b>로 이동하여 더 자세한 정보를 열람하거나,<br/><b>식품 섭취</b>를 통해 내 정보에 기록 할 수 있습니다.
					</span>	
					</div>
				</div>
				<hr/>
			<!-- 				여기까지가 한 단위 -->
			<!-- 				여기서부터~ -->
				<div class="_ComponentBound" style=" height: 250px;">
					<div >
						<img style="margin-right: 25px;" src="./images/loadmap3.png" align="left" width="605px" height="225px" />
					</div>
					<div>
					<br>
					<h2>3. 상세보기</h2>
					<span>
						&nbsp;해당 식품의 <b>영양 성분, 리뷰, 제조사</b> 등을 열람할 수 있습니다. <br/>
						다른 유저가 작성한 <b>리뷰</b>와 <b>평점</b>, <b>조회수</b>를 알 수 있으며,<br/>자유롭게 리뷰를 작성할 수 있습니다.<br/>
						식품을 <b>섭취</b>하기 전에 나의 <b>특이사항</b>과 관련하여 영양 성분을 다시 한 번 되물어봅니다.
					</span>	
					</div>
				</div>
				<hr/>
			<!-- 				여기까지가 한 단위 -->
			<!-- 				여기서부터~ -->
				<div class="_ComponentBound" style=" height: 250px;">
					<div >
						<img style="margin-right: 25px;" src="./images/loadmap4.png" align="left" width="605px" height="225px" />
					</div>
					<div>
					<h2>4. 내 정보</h2>
					<span>
						&nbsp;내 정보를 확인하거나, 수정할 수 있습니다.<br/>
						<b>BMI 지수</b>를 볼 수 있으며 결과에 따라 다른 색으로 알려줍니다.<br/>
						<br/>나의 <b>알레르기 정보</b>를 편집하거나<br/><b>비만, 당뇨, 고혈압</b>등의 <b>특이사항</b>을 등록할 수 있습니다. <br/>
						<br/>그리고 나의 <b>히스토리</b>를 볼 수 있습니다!
						
					</span>	
					</div>
				</div>
				<hr/>
			<!-- 				여기까지가 한 단위 -->
			<!-- 				여기서부터~ -->
				<div class="_ComponentBound" style=" height: 250px;">
					<div >
						<img style="margin-right: 25px;" src="./images/loadmap5.png" align="left" width="605px" height="225px" />
					</div>
					<div>
					<br>
					<h2>5. 히스토리</h2>
					<span>
						&nbsp;내 정보에서 <b>달력</b>을 통해 <b>내가 섭취한 식품 정보</b>를 확인할 수 있습니다.<br/><br/>
						해당 날짜의 <b>[섭취내역]</b>을 눌러 볼 수 있으며<br/>
						 <b>일일 권장 섭취량</b>을 초과하지는 않았는지, <b>균형 잡힌 식사</b>를 하고있는지 알려줍니다.
						 <br/> 또한 제일 많이 섭취한 식품의 정보도 알려줍니다.
						
					</span>	
					</div>
				</div>
				<hr/>
			<!-- 				여기까지가 한 단위 -->
				<!-- 				여기서부터~ -->
				<div class="_ComponentBound" style=" height: 250px;">
					<div >
						<img style="margin-right: 25px;" src="./images/loadmap6.png" align="left" width="605px" height="225px" />
					</div>
					<div>
					<br>
					<h2>6. Top5 식품 리스트</h2>
					<span><br/><br/>
						&nbsp;<b>이용자들이 가장 많이 조회한 식품 5개를 보여줍니다!</b>
						
					</span>	
					</div>
				</div>
				<hr/>
			<!-- 				여기까지가 한 단위 -->
							<!-- 				여기서부터~ -->
				<div class="_ComponentBound" style=" height: 250px;">
					<div >
						<img style="margin-right: 25px;" src="./images/loadmap7.png" align="left" width="605px" height="225px" />
					</div>
					<div>
					<br>
					<h2>7. 오늘 뭐먹지? '36 뷔페'</h2>
					<span><br/>
						&nbsp;<b>오늘 뭐먹지?</b><br/>고민이 되는 날엔 <b>36 뷔페</b>를 이용해주세요.<br/>
						<b>주사위 2개</b>를 굴려 결과 값에 따라 각기 다른 식품을 추천 해줍니다.<br/>
						<b>다시하기</b>를 눌러 게임판을 초기화 할 수 있습니다. 
						
					</span>	
					</div>
				</div>
				<hr/>
			<!-- 				여기까지가 한 단위 -->
						<!-- 				여기서부터~ -->
				<div class="_ComponentBound" style=" height: 250px;">
					<div >
						<img style="margin-right: 25px;" src="./images/loadmap8.png" align="left" width="605px" height="225px" />
					</div>
					<div>
					<br>
					<h2>8. 오늘 뭐먹지? '점심! 인생극장'</h2>
					<span>
						&nbsp;<b>오늘 뭐먹지?</b><br/>카테고리는 정했지만 메뉴를 못정했을 때!<br/>
						<b>점심! 인생극장</b>을 이용해주세요.<br/>
						해당 <b>카테고리</b>에 속하는 음식들을 보여줍니다.<br/><br/>귀찮게 검색하러가지마세요.. 시간은 소중하니까요! 
						
					</span>	
					</div>
				</div>
				<hr/>
			<!-- 				여기까지가 한 단위 -->
				<!-- 				여기까지가 한 단위 -->
							<!-- 				여기서부터~ -->
				<div class="_ComponentBound" style=" height: 250px;">
					<div>
					<br>
					<h2><b>오늘 뭐먹지?</b> 에 오신 것을 환영합니다!</h2>
					<span><br/>
						&nbsp;이 외에도 다양한 기능을 준비 중에 있으며 식품 정보에 대해 궁금한 사항이 있다면<br/>
						<b>Q&A 게시판</b>을 이용 해주세요!<br/>
						전문가 외에는 그 누구도 답변을 달 수 없는 게시판입니다.<br/>
						(로그인은 필요 없지만 수정/삭제 시 게시물을 작성 할 때 등록한 <b>비밀번호</b>가 필요합니다.) 
					</span>	
					</div>
				</div>
				<hr/>
			<!-- 				여기까지가 한 단위 -->
				
			</div>
		</div>
	</div>
</body>
</html>