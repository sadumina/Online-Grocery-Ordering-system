<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Products</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

   
    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet">
    <link href="assets/css/cart.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
</head>

<body>
      <%
	HttpSession Session = request.getSession(false);
	if (Session == null || session.getAttribute("email") == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	%>

	<%
	HttpSession session_s = request.getSession(false);
	String role = (String) session.getAttribute("role");
	String email = (String) session.getAttribute("email");
	%>
    <header id="header" class="header d-flex align-items-center sticky-top">
        <div class="container position-relative d-flex align-items-center justify-content-between">

            <a href="#" class="logo d-flex align-items-center me-auto me-xl-0">
               
                <img src="assets/img/logo1.png" alt="logo">
            </a>
            <nav id="navmenu" class="navmenu">
				<ul>
				 
				 
				  <li><a href="viewproducts" class="active">Products</a></li>
				  
				  
				</ul>
				<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
			</nav> 
			<%  HttpSession Session_s = request.getSession(false); 
                      String Email = (String) session.getAttribute("email"); 
                      Boolean isLoggedIn=(Boolean) session.getAttribute("isLoggedIn");
         
                      if (isLoggedIn !=null && isLoggedIn) { 
                  %>
                    
                    <a class="btn-dash" href="dashboard.jsp"><i class="fa-solid fa-user" style="font-size:17px;"></i></a>
                    <a class="btn-logout" href="logout" style="font-size:17px;"><i class="fa-solid fa-right-from-bracket"></i></a>
                    
                    
                    <script>
                        setTimeout(function() {
                        	alert("Your session has exprired. Please log in again.");
                        	window.location.href = "login.jsp";
                        }, 1800000);
                    </script>
        
                  <% 
                      } else {
                   %>
                     <script>
                        window.location.href = "login.jsp";
                     </script>
                  <% 
                     } 
                  %>
              
        </div>
    </header>
    <section class="h-100">
    <div class="container h-100 py-5">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12">

                <div class="d-flex justify-content-between align-items-center mb-5">
                    <h3 class="fw-normal mb-0">Your Cart</h3>
                </div>
                
                
                    <div class="cart-layout">  
                         <div class="cart-items">
                         <c:forEach var="cart" items="${cartItems}">
                         
                            <c:set var="id" value="${cart.id}" />
							<c:set var="prodname" value="${cart.name}" />
							<c:set var="prodprice" value="${cart.price}" />
							<c:set var="prodquantity" value="${cart.quantity}" />
							
                            <div class="card rounded-3 mb-4">
                                <div class="card-body p-4">
                                    <div class="row d-flex justify-content-between align-items-center">
                                            <div class="col-md-2 col-lg-2 col-xl-2">
                                                <img src="assets/img/producticon.png" class="img-fluid rounded-3">
                                            </div>
                                           
                                            <div class="col-md-3 col-lg-3 col-xl-3"> 
                                                <p class="lead fw-normal mb-2">${cart.name}</p>
                                            </div>
                                            <div class="col-md-3 col-lg-3 col-l-2 d-flex">
                                                <p><span class="text-muted">Quantity: </span><input type="text"
                                                        value="${cart.quantity}" class="quantity" readonly></p>
                                            </div>
                                            <div class="col-md-3 col-lg-2 col-l-2 offset-lg-1">
                                                <h5 class="mb-0">Rs.${cart.price}</h5>
                                            </div>
                                           
                                           <c:url value="updatecart.jsp" var="cartupdate">
                                              <c:param name="cartid" value="${id}"/>
                                              <c:param name="cartname" value="${prodname}"/>
                                              <c:param name="cartprice" value="${prodprice}"/>
                                              <c:param name="cartquantity" value="${prodquantity}"/>
                                           </c:url>
                                           
                                           <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                <a href="${cartupdate}" class="text-success" style="padding-right: 2px;"><i
                                                        class="fas fa-edit"></i></a>
                                                <a href="#!" class="text-danger"><i class="fas fa-trash fa-sm"></i></a>
                                           </div>
                                           
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                         
                        <div class="cart-summary">
                            <div class="col-md-4">
                                <div class="card mb-4">
                                    <div class="card-header py-3">
                                        <h5 class="mb-0">Summary</h5>
                                    </div>
                                    
                                    <div class="card-body">
                                      
                                        <ul class="list-group list-group-flush">
                                        <c:forEach var="cart" items="${cartItems}">
                                            <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                                
                                                ${cart.name}
                                                <span>${cart.price}</span>
                                            </li>
                                        </c:forEach>    
                                           
                                            <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                                
                                                <div>
                                                    <strong>Total amount</strong>
                                                </div>
                                                <span><strong>$53.98</strong></span>
                                            </li>
                                        </ul>
                                      
                                        <a href="orderplacement.jsp" class="checkout-btn">Go to checkout</a>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    
                <c:if test="empty ${cartItems}">
                    <h5>Your cart is empty.</h5>
                </c:if>
            </div>
        </div>
    </div>
</section>

<footer id="footer" class="footer dark-background">

            <div class="container">
              <div class="row gy-3">
                <div class="col-lg-3 col-md-6 d-flex">
                  <i class="bi bi-geo-alt icon"></i>
                  <div class="address">
                    <h4>Address</h4>
                    <p>A108 Adam Street</p>
                    <p>New York, NY 535022</p>
                    <p></p>
                  </div>

                </div>

                <div class="col-lg-3 col-md-6 d-flex">
                  <i class="bi bi-telephone icon"></i>
                  <div>
                    <h4>Contact</h4>
                    <p>
                      <strong>Phone:</strong> <span>+1 5589 55488 55</span><br>
                      <strong>Email:</strong> <span>info@example.com</span><br>
                    </p>
                  </div>
                </div>

                <div class="col-lg-3 col-md-6 d-flex">
                  <i class="bi bi-clock icon"></i>
                  <div>
                    <h4>Opening Hours</h4>
                    <p>
                      <strong>Mon-Sat:</strong> <span>11AM - 23PM</span><br>
                      <strong>Sunday</strong>: <span>Closed</span>
                    </p>
                  </div>
                </div>

                <div class="col-lg-3 col-md-6">
                  <h4>Follow Us</h4>
                  <div class="social-links d-flex">
                    <a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a>
                    <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                    <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                  </div>
                </div>

              </div>
            </div>

            <div class="container copyright text-center mt-4">
              <p>© <span>Copyright</span> <strong class="px-1 sitename"
                  style="color:var(--accent-color)">SmartCart</strong> <span>All Rights Reserved</span></p>
              <div class="credits">
              
              </div>
            </div>

          </footer>
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>