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
<body>
	<jsp:include page="nav.jsp"></jsp:include>
						<c:choose>
						<c:when test="${login.auth eq '1' }">
							<c:set var="img1" value="./images/banner_student_1.png" />
							<c:set var="img2" value="./images/banner_obes_1.png" />
							<c:set var="img3" value="./images/banner_obes_2.png"  />
							<c:set var="link1" value="https://rankingnews.tistory.com/173"  />
							<c:set var="link2" value="http://general.kosso.or.kr/html/?pmode=obesityCause"  />
							<c:set var="link3" value="http://www.amc.seoul.kr/asan/healthinfo/mealtherapy/mealTherapyList.do?searchCondition=all&searchKeyword=%EB%B9%84%EB%A7%8C"  />
						</c:when>
						<c:when test="${login.primaryop eq '유아'}">
							<c:set var="img1" value="./images/banner_baby_1.png" />
							<c:set var="img2" value="./images/banner_baby_2.png" />
							<c:set var="img3" value="./images/banner_baby_3.png"  />
							<c:set var="link1" value="https://www.youtube.com/user/PororoTV"  />
							<c:set var="link2" value="https://www.youtube.com/channel/UC0SVqB_1E2Kgh3cx3Y8xtfA"  />
							<c:set var="link3" value="https://www.youtube.com/user/pinkfongko"  />
						</c:when>
						<c:when test="${login.primaryop eq '임산부'}">
							<c:set var="img1" value="./images/banner_pragnent_1.png" />
							<c:set var="img2" value="./images/banner_pragnent_2.png" />
							<c:set var="img3" value="./images/banner_pragnent_3.png"  />
							<c:set var="link1" value="https://www.mfds.go.kr/brd/m_99/view.do?seq=35746"  />
							<c:set var="link2" value="http://www.10000recipe.com/bbs/788"  />
							<c:set var="link3" value="http://danmee.chosun.com/site/data/html_dir/2017/01/20/2017012001946.html"  />
						</c:when>
						<c:when test="${login.primaryop eq '고혈압'}">
							<c:set var="img1" value="./images/banner_hytension_1.png" />
							<c:set var="img2" value="./images/banner_hytension_2.png" />
							<c:set var="img3" value="./images/banner_hytension_3.png"  />
							<c:set var="link1" value="https://nown2210.tistory.com/186"  />
							<c:set var="link2" value="http://health.cdc.go.kr/health/HealthInfoArea/HealthInfo/View.do?idx=2710"  />
							<c:set var="link3" value="http://www.amc.seoul.kr/asan/healthinfo/mealtherapy/mealTherapyDetail.do?mtId=29"  />
						</c:when>
						<c:when test="${login.primaryop eq '당뇨'}">
							<c:set var="img1" value="./images/banner_dia_1.png" />
							<c:set var="img2" value="./images/banner_dia_2.png" />
							<c:set var="img3" value="./images/banner_dia_3.png"  />
							<c:set var="link1" value="https://nown2210.tistory.com/109"  />
							<c:set var="link2" value="https://www.diabetes.or.kr/general/health/sub01.php"  />
							<c:set var="link3" value="http://www.amc.seoul.kr/asan/healthinfo/mealtherapy/mealTherapyList.do?searchCondition=all&searchKeyword=%EB%8B%B9%EB%87%A8"  />
						</c:when>
						<c:when test="${login.primaryop eq '비만'}">
							<c:set var="img1" value="./images/banner_obes_1.png" />
							<c:set var="img2" value="./images/banner_obes_2.png" />
							<c:set var="img3" value="./images/banner_obes_3.png"  />
							<c:set var="link1" value="http://general.kosso.or.kr/html/?pmode=obesityCause"  />
							<c:set var="link2" value="http://www.amc.seoul.kr/asan/healthinfo/mealtherapy/mealTherapyList.do?searchCondition=all&searchKeyword=%EB%B9%84%EB%A7%8C"  />
							<c:set var="link3" value="https://www.youtube.com/watch?v=OWzpfnV8kRU"  />
						</c:when>
						<c:when test="${login.primaryop eq '학생'}">
							<c:set var="img1" value="./images/banner_student_1.png" />
							<c:set var="img2" value="./images/banner_student_2.png" />
							<c:set var="img3" value="./images/banner_student_3.png"  />
							<c:set var="link1" value="https://brunch.co.kr/@ulfit/26"  />
							<c:set var="link2" value="http://www.korea.kr/news/healthView.do?newsId=148785456"  />
							<c:set var="link3" value="https://rankingnews.tistory.com/173"  />
						</c:when>
						<c:when test="${login.primaryop eq '남자'}">
							<c:set var="img1" value="./images/banner_hytension_1.png" />
							<c:set var="img2" value="./images/banner_obes_1.png" />
							<c:set var="img3" value="./images/banner_student_2.png"  />
							<c:set var="link1" value="https://nown2210.tistory.com/186"  />
							<c:set var="link2" value="http://general.kosso.or.kr/html/?pmode=obesityCause"  />
							<c:set var="link3" value="http://www.korea.kr/news/healthView.do?newsId=148785456"  />
						</c:when>
						<c:when test="${login.primaryop eq '여자'}">
							<c:set var="img1" value="./images/banner_student_1.png" />
							<c:set var="img2" value="./images/banner_pragnent_1.png" />
							<c:set var="img3" value="./images/banner_hytension_3.png"  />
							<c:set var="link1" value="https://brunch.co.kr/@ulfit/26"  />
							<c:set var="link2" value="https://www.mfds.go.kr/brd/m_99/view.do?seq=35746"  />
							<c:set var="link3" value="http://www.amc.seoul.kr/asan/healthinfo/mealtherapy/mealTherapyDetail.do?mtId=29"  />
						</c:when>
						<c:otherwise>
						<c:set var="img1" value="./images/banner_student_1.png" />
							<c:set var="img2" value="./images/banner_obes_1.png" />
							<c:set var="img3" value="./images/banner_obes_2.png"  />
							<c:set var="link1" value="https://rankingnews.tistory.com/173"  />
							<c:set var="link2" value="http://general.kosso.or.kr/html/?pmode=obesityCause"  />
							<c:set var="link3" value="http://www.amc.seoul.kr/asan/healthinfo/mealtherapy/mealTherapyList.do?searchCondition=all&searchKeyword=%EB%B9%84%EB%A7%8C"  />
						</c:otherwise>
					</c:choose>
	<div id="_grid" style="max-width: 1700px; margin: 0 auto;">
	
		<div id="_wrap" style="width: 80%; float: left;">
			<div id="_advertise"
				style="overflow: hidden; display: block; margin: 3px 0; white-space: nowrap;">
				<a href="${link1 }"><img src="${img1 }"
					style="width: 33%; margin-right: 2px;" /></a> <a href="${link2 }"><img
					src="${img2 }" style="width: 33%; margin-right: 2px;" /></a>
				<a href="${link3 }"><img src="${img3 }" style="width: 33%;" /></a>
			</div>	

			<section id="home-section" class="hero" style="width: 100%;">
				<div class="home-slider owl-carousel">
					<div class="slider-item"
						style="background-image: url(images/bg_1.jpg);">
						<div class="overlay"></div>
						<div class="container">
							<div
								class="row slider-text justify-content-center align-items-center"
								data-scrollax-parent="true">

								<div class="col-md-12 ftco-animate text-center">
<!-- 								 <font face="배달의민족 한나는 열한살"> -->
									<h1 class="mb-2">Safe Food &amp; Save Me !</h1>
									<h2 class="subheading mb-4">SSAFY 대전 4반 장은정 한재석</h2> 
								</div>

							</div>
						</div>
					</div>

					<div class="slider-item"
						style="background-image: url(images/bg_2.jpg);">
						<div class="overlay"></div>
						<div class="container">
							<div
								class="row slider-text justify-content-center align-items-center"
								data-scrollax-parent="true">

								<div class="col-sm-12 ftco-animate text-center">
									<h1 class="mb-2">What is Today's menu?</h1>
									<h2 class="subheading mb-4">SSAFY 대전 4반 장은정 한재석</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<div style="margin: 0 atuo">
			<div id="_wrap2" style="width: 19%; float: left; margin-left: 2px; margin-top:auto; margin-bottom:auto;">
				<a href="http://192.168.210.76:9876/ssafyvue/loadMap.do"><img src="./images/right2.png" style=" width: 100%; margin-bottom:8px"></a>
					<a href="https://www.mangoplate.com/top_lists/1527_tteokbokki"><img src="./images/right1.png" style="margin-bottom: 2px; width: 100%"></a>
					<a href="https://www.foodsafetykorea.go.kr/portal/board/boardDetail.do?menu_no=3120&bbs_no=bbs001&ntctxt_no=1076357&menu_grp=MENU_NEW01"><img src="./images/right0.png" style="margin-bottom: 2px; width: 100%"></a>
			</div>

		</div>
	</div><br/><br/>
	<!-- <footer class="ftco-footer ftco-section"> -->
	<!-- 	<div class="container"> -->
	<!-- 		<div class="row"></div> -->
	<!-- 		<div class="row mb-5"> -->
	<!-- 			<div class="col-md"> -->
	<!-- 				<div class="ftco-footer-widget mb-4"> -->
	<!-- 					<h2 class="ftco-heading-2">SSAFYFOODS</h2> -->
	<!-- 					<p>Far far away, behind the word mountains, far from the -->
	<!-- 						countries Vokalia and Consonantia.</p> -->
	<!-- 					<ul -->
	<!-- 						class="ftco-footer-social list-unstyled float-md-left float-lft mt-5"> -->
	<!-- 						<li class="ftco-animate"><a href="#"><span -->
	<!-- 								class="icon-twitter"></span></a></li> -->
	<!-- 						<li class="ftco-animate"><a href="#"><span -->
	<!-- 								class="icon-facebook"></span></a></li> -->
	<!-- 						<li class="ftco-animate"><a href="#"><span -->
	<!-- 								class="icon-instagram"></span></a></li> -->
	<!-- 					</ul> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="col-md-4"> -->
	<!-- 				<div class="ftco-footer-widget mb-4"> -->
	<!-- 					<h2 class="ftco-heading-2">Help</h2> -->
	<!-- 					<div class="d-flex"> -->
	<!-- 						<ul class="list-unstyled mr-l-5 pr-l-3 mr-4"> -->
	<!-- 							<li><a href="#" class="py-2 d-block">Shipping -->
	<!-- 									Information</a></li> -->
	<!-- 							<li><a href="#" class="py-2 d-block">Returns &amp; -->
	<!-- 									Exchange</a></li> -->
	<!-- 							<li><a href="#" class="py-2 d-block">Terms &amp; -->
	<!-- 									Conditions</a></li> -->
	<!-- 							<li><a href="#" class="py-2 d-block">Privacy Policy</a></li> -->
	<!-- 						</ul> -->
	<!-- 						<ul class="list-unstyled"> -->
	<!-- 							<li><a href="#" class="py-2 d-block">FAQs</a></li> -->
	<!-- 							<li><a href="#" class="py-2 d-block">Contact</a></li> -->
	<!-- 						</ul> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="col-md"> -->
	<!-- 				<div class="ftco-footer-widget mb-4"> -->
	<!-- 					<h2 class="ftco-heading-2">Have a Questions?</h2> -->
	<!-- 					<div class="block-23 mb-3"> -->
	<!-- 						<ul> -->
	<!-- 							<li><span class="icon icon-map-marker"></span><span -->
	<!-- 								class="text"> ~~~~~~~~~~~~외않되? </span></li> -->
	<!-- 							<li><a href="#"><span class="icon icon-phone"></span><span -->
	<!-- 									class="text">042)820-7132</span></a></li> -->
	<!-- 							<li><a href="#"><span class="icon icon-envelope"></span><span -->
	<!-- 									class="text">ssafy@ssafy.com</span></a></li> -->
	<!-- 						</ul> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- </footer> -->


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
			location.href = "./loginForm.do";
		});

		$("#_btnRegister").click(function() {
			location.href = "./registerForm.do";
		});

		$("#_btnFindPW").click(function() {
			location.href = "./findForm.do";
		});

		$("#_btnLogout").click(function() {
			location.href = "./logout.do";
		});

		$("#_btnMyinfo").click(function() {
			location.href = "./myInfo.do";
		});
	</script>
</body>
</html>