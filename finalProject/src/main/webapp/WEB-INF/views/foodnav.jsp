<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>SSAFY FOOD PROJECT</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<style>
	.bg-admin{ background: #E1B643}
	.btn-admin{
		color: #fff;
		background: #E09C43;
		border-color: #E09C43}
	
	.bg-baby{ background: #f0bf59}
	.btn-baby{
		color: #fff;
		background: #F0A759;
		border-color: #F0A759}
		
	.bg-pragnent{ background: #FF6F61}
	.btn-pragnent{
		color: #fff;
		background: #FFA7A7;
		border-color: #FFA7A7}
		
	.bg-hytension{ background: #9C1B31}
	.btn-hytension{
		color: #fff;
		background: #B5315D;
		border-color: #B5315D}
		
	.bg-dia{ background: #65488f}
	.btn-dia{
		color: #fff;
		background: #8670a6;
		border-color: #8670a6}
/*  */
	.bg-obes{ background: #8CA4CF}
	.btn-obes{
		color: #fff;
		background: #8CAFCF;
		border-color: #8CAFCF}

	.bg-student{ background: #88b04b}
	.btn-student{
		color: #fff;
		background: #99B04C;
		border-color: #99B04C}

	.bg-male{ background: #169c78}
	.btn-male{
		color: #fff;
		background: #169C62;
		border-color: #169C62}
		
	.bg-female{ background: #b565a7}
	.btn-female{
		color: #fff;
		background: #B565B5;
		border-color: #B565B5}
	
</style>
</head>
<body class="goto-here">
	<c:if test="${empty sessionScope.login}">
		<div class="py-1 bg-primary"> 
		<div class="container">
			<div
				class="row no-gutters d-flex align-items-start align-items-center px-md-0">
				<div class="col-lg-12 d-block">
					<div class="row d-flex">
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
							</div>
						</div>
						<div align="right">
							<button type="button" class="btn btn-success" id="_btnLogin">Login</button>
							<button type="button" class="btn btn-success" id="_btnRegister">Register</button>
							<button type="button" class="btn btn-success" id="_find">find PW</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> 
	</c:if>
	<c:if test="${not empty sessionScope.login}">
		<c:if test="${login.auth eq '1' }">
			<div class="py-1 bg-admin"> 
				<div class="container">
					<div
						class="row no-gutters d-flex align-items-start align-items-center px-md-0">
						<div class="col-lg-12 d-block">
							<div class="row d-flex">
								<div class="col-md pr-4 d-flex topper align-items-center">
									<div
										class="icon mr-2 d-flex justify-content-center align-items-center">
									</div>
									<span class="text" id="_loginstatus"> 
											<c:out value="[${login.name}]님 환영합니다."></c:out>
												&nbsp; <a href="./members.do" style="color: #ffffff;"> |  회원정보 보기 </a> &nbsp;								
									</span>
								</div>
								<div align="right">
									<button type="button" class="btn btn-admin" id="_btnLogout">Logout</button>
									<button type="button" class="btn btn-admin" id="_btnMyinfo">MyInfo</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${login.auth ne '1' }">
			<c:choose>
					<c:when test="${login.primaryop eq '유아'}">
						<div class="py-1 bg-baby"> 
							<div class="container">
								<div
									class="row no-gutters d-flex align-items-start align-items-center px-md-0">
									<div class="col-lg-12 d-block">
										<div class="row d-flex">
											<div class="col-md pr-4 d-flex topper align-items-center">
												<div
													class="icon mr-2 d-flex justify-content-center align-items-center">
												</div>
												<span class="text" id="_loginstatus"> 
													<c:out value="[${login.name}]님 환영합니다."></c:out>  						
												</span>
											</div>
											<div align="right">
												<button type="button" class="btn btn-success" id="_btnLogout">Logout</button>
												<button type="button" class="btn btn-success" id="_btnMyinfo">MyInfo</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
					</c:when>
					<c:when test="${login.primaryop eq '임산부'}">
						<div class="py-1 bg-pragnent"> 
							<div class="container">
								<div
									class="row no-gutters d-flex align-items-start align-items-center px-md-0">
									<div class="col-lg-12 d-block">
										<div class="row d-flex">
											<div class="col-md pr-4 d-flex topper align-items-center">
												<div
													class="icon mr-2 d-flex justify-content-center align-items-center">
												</div>
												<span class="text" id="_loginstatus"> 
													<c:out value="[${login.name}]님 환영합니다."></c:out>  						
												</span>
											</div>
											<div align="right">
												<button type="button" class="btn btn-pragnent" id="_btnLogout">Logout</button>
												<button type="button" class="btn btn-pragnent" id="_btnMyinfo">MyInfo</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
					</c:when>
					<c:when test="${login.primaryop eq '고혈압'}">
						<div class="py-1 bg-hytension"> 
							<div class="container">
								<div
									class="row no-gutters d-flex align-items-start align-items-center px-md-0">
									<div class="col-lg-12 d-block">
										<div class="row d-flex">
											<div class="col-md pr-4 d-flex topper align-items-center">
												<div
													class="icon mr-2 d-flex justify-content-center align-items-center">
												</div>
												<span class="text" id="_loginstatus"> 
													<c:out value="[${login.name}]님 환영합니다."></c:out>  						
												</span>
											</div>
											<div align="right">
												<button type="button" class="btn btn-hytension" id="_btnLogout">Logout</button>
												<button type="button" class="btn btn-hytension" id="_btnMyinfo">MyInfo</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
					</c:when>
					<c:when test="${login.primaryop eq '당뇨'}">
						<div class="py-1 bg-dia"> 
							<div class="container">
								<div
									class="row no-gutters d-flex align-items-start align-items-center px-md-0">
									<div class="col-lg-12 d-block">
										<div class="row d-flex">
											<div class="col-md pr-4 d-flex topper align-items-center">
												<div
													class="icon mr-2 d-flex justify-content-center align-items-center">
												</div>
												<span class="text" id="_loginstatus" style="width: 300px; margin: 0 auto"> 
													<c:out value="[${login.name}]."></c:out>  						
												</span>
											</div>
											<div align="right">
												<button type="button" class="btn btn-dia" id="_btnLogout">Logout</button>
												<button type="button" class="btn btn-dia" id="_btnMyinfo">MyInfo</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
					</c:when>
					<c:when test="${login.primaryop eq '비만'}">
						<div class="py-1 bg-obes"> 
							<div class="container">
								<div
									class="row no-gutters d-flex align-items-start align-items-center px-md-0">
									<div class="col-lg-12 d-block">
										<div class="row d-flex">
											<div class="col-md pr-4 d-flex topper align-items-center">
												<div
													class="icon mr-2 d-flex justify-content-center align-items-center">
												</div>
												<span class="text" id="_loginstatus"> 
													<c:out value="[${login.name}]님 환영합니다."></c:out>  						
												</span>
											</div>
											<div align="right">
												<button type="button" class="btn btn-obes" id="_btnLogout">Logout</button>
												<button type="button" class="btn btn-obes" id="_btnMyinfo">MyInfo</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
					</c:when>
					<c:when test="${login.primaryop eq '학생'}">
						<div class="py-1 bg-student"> 
							<div class="container">
								<div
									class="row no-gutters d-flex align-items-start align-items-center px-md-0">
									<div class="col-lg-12 d-block">
										<div class="row d-flex">
											<div class="col-md pr-4 d-flex topper align-items-center">
												<div
													class="icon mr-2 d-flex justify-content-center align-items-center">
												</div>
												<span class="text" id="_loginstatus"> 
													<c:out value="[${login.name}]님 환영합니다."></c:out>  						
												</span>
											</div>
											<div align="right">
												<button type="button" class="btn btn-student" id="_btnLogout">Logout</button>
												<button type="button" class="btn btn-student" id="_btnMyinfo">MyInfo</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
					</c:when>
					<c:when test="${login.primaryop eq '남자'}">
						<div class="py-1 bg-male"> 
							<div class="container">
								<div
									class="row no-gutters d-flex align-items-start align-items-center px-md-0">
									<div class="col-lg-12 d-block">
										<div class="row d-flex">
											<div class="col-md pr-4 d-flex topper align-items-center">
												<div
													class="icon mr-2 d-flex justify-content-center align-items-center">
												</div>
												<span class="text" id="_loginstatus"> 
													<c:out value="[${login.name}]님 환영합니다."></c:out>  						
												</span>
											</div>
											<div align="right">
												<button type="button" class="btn btn-male" id="_btnLogout">Logout</button>
												<button type="button" class="btn btn-male" id="_btnMyinfo">MyInfo</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
					</c:when>
					<c:when test="${login.primaryop eq '여자'}">
						<div class="py-1 bg-female"> 
							<div class="container">
								<div
									class="row no-gutters d-flex align-items-start align-items-center px-md-0">
									<div class="col-lg-12 d-block">
										<div class="row d-flex">
											<div class="col-md pr-4 d-flex topper align-items-center">
												<div
													class="icon mr-2 d-flex justify-content-center align-items-center">
												</div>
												<span class="text" id="_loginstatus"> 
													<c:out value="[${login.name}]님 환영합니다."></c:out>  						
												</span>
											</div>
											<div align="right">
												<button type="button" class="btn btn-female" id="_btnLogout">Logout</button>
												<button type="button" class="btn btn-female" id="_btnMyinfo">MyInfo</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</c:if>
	</c:if>

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a href="./" target="_blank"><img src="images/green_ver.png" width="100px" height="100px" alt="메인페이지 바로가기"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">오늘 뭐먹지?</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="buffet.do">36뷔페</a> 
							<a class="dropdown-item" href="life.do">점심! 인생극장</a> 
						</div>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Food</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="search.do">Food Search</a> 
							<a class="dropdown-item" href="best.do">Best Food</a> 
						</div>
					<li class="nav-item dropdown">	
					<a class="nav-link dropdown-toggle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Notice</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="noticelist.do">공지사항</a>
							<a class="dropdown-item" href=" http://192.168.210.76:8080/">QnA</a>
						</div>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->


	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

	<script type="text/javascript">
		$("#_btnLogin").click(function() {
			location.href = "loginForm.do";
		});
		
		$("#_btnRegister").click(function() {
			location.href = "registerForm.do";
		});
		
		$("#_find").click(function() {
			location.href = "findForm.do";
		});
		
		
		$("#_btnLogout").click(function() {
			location.href = "logout.do";
		});
		
		$("#_btnMyinfo").click(function() {
			location.href = "myInfo.do";
		});
		
	</script>

</body>
</html>