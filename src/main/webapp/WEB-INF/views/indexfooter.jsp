<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Cake Template">
<meta name="keywords" content="Cake, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Cake | Template</title>

<!-- Google Font -->
<link
	href="<c:url value="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"/>"
	rel="stylesheet">
<link
	href="<c:url value="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"/>"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/flaticon.css"/>" type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/barfiller.css"/>" type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/magnific-popup.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/font-awesome.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/elegant-icons.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/nice-select.css"/>" type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/owl.carousel.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/slicknav.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"
	type="text/css">

<link rel="stylesheet"
	href="<c:url value="/resources/css/feedback.css"/>" type="text/css">


</head>

<body>

	<!-- Footer Section Begin -->
	<footer class="footer set-bg"
		data-setbg="<c:url value="/resources/img/footer-bg.jpg"/>">
		<div class="container">
			<div class="row">

				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__logo">
							<a href="#"><img
								src="<c:url value="/resources/img/footer-logo.png"/>" alt=""></a>
						</div>

					</div>
				</div>

				<c:if test="${sessionLogin==true}">
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="footer__newslatter">
							<h6>Rate Your Experiences</h6>
							<form:form
								action="${pageContext.request.contextPath}/user/feedback"
								method="post" modelAttribute="give" id="feedbackform">
								
									<div class="rating" style="margin-top: 10px; font-size: 10px;" id="ratinginput">
										<form:radiobutton path="rating" id="star5" name="rating"
											value="5" />
										<label class="star" for="star5" title="Awesome"
											aria-hidden="true"></label>
										<form:radiobutton path="rating" id="star4" name="rating"
											value="4" />
										<label class="star" for="star4" title="Great"
											aria-hidden="true"></label>
										<form:radiobutton path="rating" id="star3" name="rating"
											value="3" />
										<label class="star" for="star3" title="Very good"
											aria-hidden="true"></label>
										<form:radiobutton path="rating" id="star2" name="rating"
											value="2" />
										<label class="star" for="star2" title="Good"
											aria-hidden="true"></label>
										<form:radiobutton path="rating" id="star1" name="rating"
											value="1" />
										<label class="star" for="star1" title="Bad" aria-hidden="true"></label>
									</div><br><br>
									
									<form:input type="text" path="comment"
										class="form-control border-0" id="feedbackinput"
										name="newsletter" placeholder="" />
									<span class="error-message" id="feedbackerror"
										style="color: red;"></span>
									<span class="error-message" id="ratingerror" style="color: red;"></span>
									
									
									<button type="submit">
										<i class="fa fa-send-o" style="margin-top: 55px;"></i>
									</button>
								
							</form:form>

						</div>
					</div>
				</c:if>
			</div>
		</div>
		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-lg-7">
						<p class="copyright__text text-white">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

						</p>
					</div>
					<div class="col-lg-5">
						<div class="copyright__widget">
							<ul>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Terms & Conditions</a></li>
								<li><a href="#">Site Map</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Search Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.barfiller.js"/>"></script>
	<script
		src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.slicknav.js"/>"></script>
	<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.nicescroll.min.js"/>"></script>
	<script src="<c:url value="/resources/js/main.js"/>"></script>
	<script src="<c:url value="/resources/js/feedback.js"/>"></script>


</body>
</html>