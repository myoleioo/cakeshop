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
    
    <style>
        .header__menu ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: space-around;
        }
        .header__menu ul li {
            flex: 1; /* Distribute space evenly */
            text-align: center;
        }
        .header__menu ul li a {
            display: block;
            text-decoration: none;
            padding: 20px;
        }
        .header__menu ul li div {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .header__menu ul li div a img {
            border-radius: 25px;
            object-fit: cover;
        }
    </style>
    
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
                <a href="#"><img src="<c:url value="/resources/img/icon/cart.png"/>" alt=""> <span>0</span></a>
                <div class="cart__price">Cart: <span>$0.00</span></div>
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
                            <li><a href='<c:url value="/adminpage"/>'>ShowAllProduct</a></li>
                            <li><a href='<c:url value="/showallorder"/>'>ShowAllOrder</a></li>
                            <li><a href='<c:url value="/product/addproduct"/>'>AddProduct</a></li>
                            <li>
								<div >
									<a href="<c:url value="/profile" />"> <img
										src="<c:url value="/resources/img/profilephoto/defaultprofile.jpg"/>"
										name="aboutme" width="30" height="30" class="img-circle"
										style="border-radius: 25px; object-fit: cover;">
									</a>
								</div>
							</li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    
    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.nice-select.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.barfiller.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.slicknav.js"/>"></script>
<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.nicescroll.min.js"/>"></script>
<script src="<c:url value="/resources/js/main.js"/>"></script>
</body>
</html>