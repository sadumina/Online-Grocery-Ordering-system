<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ page import="javax.servlet.http.HttpSession"%>
      <%@ page import="java.util.List"%>
        <!DOCTYPE html>
        <html>

        <head>
          <meta charset="utf-8">
          <meta content="width=device-width, initial-scale=1.0" name="viewport">
          <title>Products</title>
          <meta name="description" content="">
          <meta name="keywords" content="">

          <!-- Favicons -->
          <link href="" rel="icon">
          <link href="" rel="apple-touch-icon">

          
          <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
          <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
          <link href="assets/vendor/aos/aos.css" rel="stylesheet">
          <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
          <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

          <!-- Main CSS File -->
          <link href="assets/css/main.css" rel="stylesheet">
          
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

          <script type="text/javascript">
                window.onload = function() {
    	             var deleteStatus = '<%=request.getAttribute("deleteStatus")%>';

		            if (deleteStatus == "success") {
			          alert("Product deleted successfully!");
			          
		            } 
	            }
         </script>

</head>

        <body class="product-view-page">
        
          <header id="header" class="header d-flex align-items-center sticky-top">
            <div class="container position-relative d-flex align-items-center justify-content-between">

              <a href="#" class="logo d-flex align-items-center me-auto me-xl-0">
               
                <img src="assets/img/logo1.png" alt="logo">
              </a>

              <nav id="navmenu" class="navmenu">
                <ul>
                  
                  <li><a href="aboutus.jsp">About</a></li>
                  <li><a href="viewproducts" class="active">Products</a></li>
                  <li><a href="contactus.jsp">Contact</a></li>
                  <li><a href="orderplacement.jsp">Place Order</a></li>
                </ul>
                <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
              </nav>
              
              <%
                  HttpSession session_s = request.getSession(false);
                  String userEmail = (session_s != null) ? (String) session_s.getAttribute("email") : null;
                  String userRole = (session_s != null) ? (String) session_s.getAttribute("role") : null;
               %>
               <%
                  if(userEmail == null) {
               %>
                  <a href="login.jsp" id="btn-login" class="btn-getstarted">Login</a>
                  
               <% 
                  } else { 
            	   
               %> 
                
                  <a class="btn-icon" href="viewcart"><i class="fas fa-shopping-cart"></i></a>
                  <a class="btn-dash" href="dashboard.jsp"><i class="fa-solid fa-user" style="font-size:17px;"></i></a>
                  <a class="btn-logout" href="logout" style="font-size:17px;"><i class="fa-solid fa-right-from-bracket"></i></a>
                  
               <% 
                  } 
                %>
                  
            </div>
          </header>
          <section id="products" class="products section">
            <div class="product-container">
              <div class="catagories"><br><br>
                <h3>Categories</h3><br>
                <ul>
                  <c:forEach var="category" items="${categories}">
                    <li><a href="ViewProductServlet?category=${category}">${category}</a></li>
                  </c:forEach>
                </ul>
              </div>
              <!-- Section Title -->
              <div class="tab-content" data-aos="fade-up" data-aos-delay="200">

                <div class="tab-pane fade active show" id="cosmetic"><br><br><br>

                  <div class="tab-header text-center">
                    
                  </div>

                  <div class="row gy-5">
                    
                    <c:forEach var="product" items="${prodDetails}">
							<c:set var="id" value="${product.id}" />
							<c:set var="prodname" value="${product.name}" />
							<c:set var="prodprice" value="${product.price}" />
							<c:set var="prodcategory" value="${product.category}" />
							
					    <div class="col-lg-4 menu-item">
                        <a href="assets/img/producticon.png" class="glightbox"><img src="assets/img/producticon.png"
                            class="menu-img img-fluid" alt=""></a>
                        <br>
                        <h4>${product.name}</h4>
                        <p class="price">Rs.${product.price}</p>
                        
                        <%if (userRole == null || !userRole.equals("manager")) {%>
                          
                            <form action="addcart" method="post" class="cart-form">
                              <c:forEach var="cart" items="${cartItems}">
                                  <c:set var="cid" value="${cart.id}"/>
                                   <input type="hidden" name="cid" value="${cart.id}"/>
                              </c:forEach>
                                <input type="hidden" name="productid" value="${product.id}" />
                                <input type="hidden" name="prodname" value="${product.name}" />
                                <input type="hidden" name="prodPrice" value="${product.price}" />
                                <div class="quantity-controls">
                                <label for="prodQuantity"><span class="text-muted">Quantity: </span></label>
                                    <select id="prodQuantity" name="prodQuantity">
                                      <option value="1">1</option>
                                      <option value="2">2</option>
                                      <option value="3">3</option>
                                      <option value="4">4</option>
                                    </select>
                                </div><br>    
                                
							     <script>
                                    
                                    function loginAlert() {
                                    	alert("You need to log in to add products to your cart.");
                                    	window.location.href("viewproducts");
                                    }
                                   
                                 </script>
                                
                                <%if(userEmail != null) { %>
                                
                                    <button class="btn-addcart" type="submit">Add to Cart</button>
                                    
                                <%} else { %>
                                
                                    <button class="btn-addcart" type="button" onclick="loginAlert()">Add to Cart</button>
                                <%} %>
                           </form>
                          
                         <%} else { %>
								<c:url value="updateproducts.jsp" var="produpdate">
									<c:param name="id" value="${id}" />
									<c:param name="prodname" value="${prodname}" />
									<c:param name="price" value="${prodprice}" />
								    <c:param name="prodcategory" value="${prodcategory}"></c:param>

								</c:url>
								<a href="${produpdate}" class="text-success" style="padding-right: 2px; margin-right: 25px; font-size: 22px;"><i class="fas fa-edit"></i></a>

								<form action="deleteproduct" method="post" class="delete-form" style="display: inline; margin: 0;">
								     <input type="hidden" name="prodid" value="${product.id}" />
								     <button type="submit" class="text-danger" 
								        style="background: none; border: none; font-size: 22px;"><i class="fas fa-trash fa-sm"></i></button>
								</form>                  
                         <%} %>            
                      </div>
                    </c:forEach>

                  </div>
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
          <!-- Scroll Top -->
          <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i
              class="bi bi-arrow-up-short"></i></a>

          <!-- Vendor JS Files -->
          <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
          <script src="assets/vendor/php-email-form/validate.js"></script>
          <script src="assets/vendor/aos/aos.js"></script>
          <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
          <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
          <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

          <!-- Main JS File -->
          <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
          <script src="assets/js/cartpanel.js"></script>
          <script src="assets/js/quantitycounter.js"></script>
          <script src="assets/js/main.js"></script>
        </body>

        </html>