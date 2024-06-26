<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Cake Template">
    <meta name="keywords" content="Cake, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cake | Template</title>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.bundle.min.js"/>"></script>
	<!-- Google Font -->
</head>

<body>

    <jsp:include page="indexheader.jsp" />

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h2>Shop</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.html">Home</a>
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
            <c:forEach items="${productList}" var="pl">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                    	<input type="hidden" id=product_id value="${pl.productId}">
                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}${'//'}${pl.filePath}">
                            <div class="product__label">
                                <span>${pl.productName}</span>
                            </div>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">${pl.description}</a></h6>
                            <div class="product__item__price">${pl.price}</div>
                            <div class="cart_add">
                                <a href="<c:url value="/shoppingcart/${pl.productId}"/>" class="btn_add_to_cart">Add to cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
              </div> 
         </div>
    </section>
    
    <%@ include file="indexfooter.jsp"%>

   <script src="<c:url value="/resources/js/cart.js" />"></script>

</body>
</html>
