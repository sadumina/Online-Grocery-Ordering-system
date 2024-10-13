<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
   
    </head>
    
    <body class="order-placement-page">
    
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
          <li><a href="viewproducts">Products</a></li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>
               <%
                  HttpSession Session_s = request.getSession(false);
                  String userEmail = (Session_s != null) ? (String) Session_s.getAttribute("email") : null;
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
    <main class="main">
       <div class="page-title">
          <div class="container section-title">
          <br><hr style="color: var(--accent-color)"><br>
            <p><span>Place Your</span> <span class="description-title">Order Here</span></p>
            <h6>Enter Your placement details below</h6><br>
          <hr style="color: var(--accent-color)">  
          </div>
       </div>
    <section class="Order-place">
            <div class="order-container">
                <div class="placement">
                        <form action="OrderInsert" method="post" class="placement-form">
						<div class="col-12">
							<div class="row mt-3 mx-4">
								<div class="col-12">
									<label class="order-form-label">Full Name</label> <input
										type="text" name="fullname" class="form-control">
								</div>
							</div>

							<div class="row mt-3 mx-4">
								<div class="col-12">
									<label class="order-form-label">Mobile Number</label> <input
										type="text" name="phone" class="form-control">
								</div>
							</div>
							<div class="row mt-3 mx-4">
								<label class="order-form-label" for="date-picker">Date</label>
								<div data-mdb-input-init class="form-outline datepicker"
									data-mdb-toggle-button="false">
									<input type="date" class="form-control" name="orderdate"
										data-mdb-toggle="datepicker" required />
								</div>
							</div>

							<div class="row mt-3 mx-4">
								<label class="order-form-label">Address</label>
								<div class="col-12">
									<div data-mdb-input-init class="form-outline">
										<input type="text" name="add" class="form-control"
											placeholder="Street Address" required />
									</div>
								</div>

								<div class="col-sm-6 mt-2 pe-sm-2">
									<div data-mdb-input-init class="form-outline">
										<input type="text" name="city" class="form-control"
											placeholder="City" />
									</div>
								</div>
								<div class="col-sm-6 mt-2 ps-sm-0">
									<div data-mdb-input-init class="form-outline">
										<input type="text" name="region" class="form-control"
											placeholder="Region" />
									</div>
								</div>
								<div class="col-sm-6 mt-2 pe-sm-2">
									<div data-mdb-input-init class="form-outline">
										<input type="text" name="zip" class="form-control"
											placeholder="Postal / Zip Code" required />
									</div>
								</div>
								<div class="col-sm-6 mt-2 ps-sm-0">
									<div data-mdb-input-init class="form-outline">
										<input type="text" name="country" class="form-control"
											placeholder="Country" required />
									</div>
								</div>
							</div>

							<div class="row mt-3">
								<div class="col-12">

							<a href="payment.jsp"><input type="submit" data-mdb-button-init id="btnSubmit"
										data-mdb-ripple-init
										class="btn btn-danger d-block mx-auto btn-submit"></a>
								</div>
							</div>
						</div>
					</form>
                        </div>
                    <!--</div>
                   </div>
                </div>-->
            </div>
        </section>
        </main>
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
      <p>© <span>Copyright</span> <strong class="px-1 sitename" style="color:var(--accent-color)">SmartCart</strong> <span>All Rights Reserved</span></p>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you've purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
      </div>
    </div>

  </footer>
  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/cartpanel.js"></script>
  <script src="assets/js/main.js"></script>
  
  </body>
  </html>