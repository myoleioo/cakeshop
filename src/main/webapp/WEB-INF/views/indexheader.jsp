<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Cake Template">
    <meta name="keywords" content="Cake, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cake | Template</title>
    
    <link rel="stylesheet" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>">
    <!-- Google Font -->
    <link href="<c:url value="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"/>"
    rel="stylesheet">
    <link href="<c:url value="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"/>"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/flaticon.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/barfiller.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/elegant-icons.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/nice-select.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/slicknav.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
    
    <link rel="stylesheet" href="<c:url value="/resources/css/cart.css"/>" type="text/css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
   <style>
   #usernameError,#emailError,#passwordError,#confirmPasswordError{color:red}
   
   #loginnameError,#loginpasswordError{color:red}
   
   
	.error,.error-message{color:red;}


   
   </style> 
    
    <script>
        function goToCart() {
            window.location.href = '<c:url value="/shoppingcart"/>';
        }
    </script>
    
</head>

<body>

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__cart">
            <div class="offcanvas__cart__item">
                <div class="cart-btn">
				    <i id="cart" class="fa-shopping-cart"></i>
				      <span class ="cart-quantity">0</span>
				 </div>
            </div>
        </div>
        <div class="offcanvas__logo">
            <a href="./index.html"><img src="<c:url value="/resources/img/logo.png"/>" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        
    </div>
    <!-- Offcanvas Menu End -->
    
    
    
    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="header__top__inner">
                            
                            <div class="header__logo">
                                <a href="./index.html"><img src="<c:url value="/resources/img/logo.png"/>" alt=""></a>
                            </div>
                            <div class="header__top__right">
                                <div class="header__top__right__cart">
                                    <div class="cart-btn" onclick="goToCart()" style="bottom: 20px;">
									    <i id="cart" class="fas fa-shopping-cart"></i>
									      <span class ="cart-quantity">0</span>
									 </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="canvas__open"><i class="fa fa-bars"></i></div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href='<c:url value="/"/>'>Home</a></li>
                            <li><a href='<c:url value="/about"/>'>About</a></li>
                            <li><a href='<c:url value="/shop"/>'>Shop</a></li>
                            <li><a href=".#">Pages</a>
                                <ul class="dropdown" style="width: 125.5px;">
                                    <li><a href='<c:url value="/shoppingcart"/>'>Shopping Cart</a></li>
                                    <li><a href='<c:url value="/checkout"/>'>Check Out</a></li>
                                </ul>
                            </li>
                            
                           <c:choose>
								<c:when test="${sessionLogin == true}">
									<li>
										<div >
											<a href="<c:url value="/profile" />"> <img
												src="<c:url value="/resources/img/profilephoto/defaultprofile.jpg"/>"
												name="aboutme" width="30" height="30" class="img-circle"
												style="border-radius: 25px; object-fit: cover">
											</a>
										</div>
									</li>
		                            
								</c:when>
								<c:otherwise>
									
									<li class="nav-item"><a class="nav-link"
										href="<c:url value="#loginModal" />" data-toggle="modal"
										data-target="#loginModal">login</a>
									</li>
		
									<li class="nav-item"><a class="nav-link"
										href="<c:url value="#signupModal" />" data-toggle="modal"
										data-target="#signupModal">register</a>
									</li>
									
								</c:otherwise>
							</c:choose>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    
    <div class="modal fade" id="signupModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content rounded-0 border-0 p-4" style="background:#fdf3ea;">
				<div class="modal-header border-10">
					<h3 style="font-style: inherit; font-weight: bold;">Register</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="login">
						<span>${success}</span> <span class="error mb-4">${error}</span>
				
						<form:form action="${pageContext.request.contextPath}/user/register"
							class="row" id="registrationForm" method="post" modelAttribute="registerbean">
							<div class="col-12">
								<span id="usernameError"  class="error"></span>
								<form:input type="text"  class="form-control mb-3" path="name"
									id="username" name="signupName" placeholder="Name" />
							</div>
							<div class="col-12">
								<span id="emailError" class="error"></span><br>
								<form:input type="email"  class="form-control mb-3" path="email"
									id="email" name="signupEmail" placeholder="Email" />
							</div>
							<div class="col-12">
								<span id="passwordError" class="error"></span><br>
								<form:input type="password" class="form-control mb-3" path="password" 
								id="password" name="signupPassword"	placeholder="Password" />
							</div>

							<div class="col-12">
								<span id="confirmPasswordError" class="error"></span><br>
								<form:input type="password" 
									class="form-control mb-3" id="confirmPassword" path="conpassword"
									name="signupConPassword" placeholder="ComfirmPassword" />
							</div>

							<div class="col-12">
								<button type="submit" class="btn btn-primary" style="background:#f08632;border-color:#f08632;" >SIGN UP</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	
	
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content rounded-0 border-0 p-4" style="background:#fdf3ea;">
				<div class="modal-header border-0">
					<h3	style="font-style: inherit; font-weight: bold;">Login</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="error-message">
						<span>${emailerror}</span>
					</div>
					<form:form action="${pageContext.request.contextPath}/user/login"
						class="row" id="loginForm" modelAttribute="loginbean"
						method="post">

						<div class="col-12">

							<span class="error-message" id="loginnameError"></span>
							<form:input type="text" class="form-control mb-3" path="email"
								id="loginname" name="loginName" placeholder="Email" value="${loginbean.email }"/>
						</div>
						<c:if test="${passworderror1==true}">
						<div class="error-message">						
							<span style="font-size: 15px;margin-left: 20px;">${passworderror}</span>						
						</div>
						</c:if>
						<div class="col-12">
							<span class="error-message" id="loginpasswordError"></span>
							<form:input type="password" 
								class="form-control mb-3" id="loginpassword" path="password"
								name="loginPassword" placeholder="Password" value="${loginbean.password }"/>
						</div>
						
						<div class="col-12" style="margin: 10px 10px;">
							<a href="./forgotPassword">forgot password?</a>
						</div>
						<div class="col-12">
							<button type="submit" class="btn btn-primary" style="background:#f08632;border-color:#f08632;">LOGIN</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
    <script>
		$(document).ready(
				function() {
					if (window.location.hash === "#loginModal"
							&& '${loginerror}' !== '') {
						$('#loginModal').modal('show');
					}
				});
	</script>
	
	<c:if test="${loginError}">
		<script>
			$(document).ready(function() {
				$('#loginModal').modal('show');
			});
		</script>
	</c:if>
    
    
 
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.nice-select.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.barfiller.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.slicknav.js"/>"></script>
<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.nicescroll.min.js"/>"></script>
<script src="<c:url value="/resources/js/main.js"/>"></script>


<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<!-- Main Script -->

<script src="<c:url value="/resources/js/register.js"/>"></script>
<script src="<c:url value="/resources/js/login.js" />"></script>
<script src="<c:url value="/resources/js/cart.js" />"></script>


</body>

</html>