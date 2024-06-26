<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
   
    
</head>
<body>
    <jsp:include page="indexheader.jsp" />
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h2>Shopping cart</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.html">Home</a>
                        <span>Shopping cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${cartBean}" var="cb">
	                                <tr>
	                                    <td class="product__cart__item">
	                                        <div class="product__cart__item__pic">
	                                            <img src="${pageContext.request.contextPath}/${cb.filePath}" alt="${cb.productName}" width="100">
	                                        </div>
	                                        <div class="product__cart__item__text">
	                                            <h6>${cb.description}</h6>
	                                        </div>
	                                    </td>
	                                    <td class="quantity__item">
	                                        <div class="quantity">
	                                            <div class="pro-qty">
	                                                <input type="text" value="1" readonly="readonly">
	                                            </div>
	                                        </div>
	                                    </td>
	                                    <td class="cart__price">${cb.price}</td>
	                                    <td class="cart__close"><span class="icon_close"></span></td>
	                               </tr>
	                           	</c:forEach>
	                         </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href='<c:url value="/shop"/>'>Continue Shopping</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="cart__total">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Total <span id="cart-total">$<c:out value="${totalPrice}"/></span></li>
                        </ul>
                        <a href="#" class="primary-btn purchase-btn">Proceed to checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@ include file="indexfooter.jsp"%>
    
    <script>
function calculateTotal() {
    var total = 0;
    document.querySelectorAll('.cart__price').forEach(function(priceElement) {
        var price = parseFloat(priceElement.innerText.replace('$', ''));
        total += price;
    });
    document.getElementById('cart-total').innerText = '$' + total.toFixed(2);
}

// Call calculateTotal on page load
document.addEventListener('DOMContentLoaded', calculateTotal);

// If items are added or removed dynamically, call calculateTotal again
function addCartItem(newItem) {
    // Add new item to the cart (implementation depends on your application)
    calculateTotal();
}

function removeCartItem(productId) {
    // Remove item from the cart (implementation depends on your application)
    calculateTotal();
}
</script>
    
    
   
    
</body>
</html>
