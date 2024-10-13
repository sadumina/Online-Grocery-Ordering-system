<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="utf-8">
      <meta content="width=device-width, initial-scale=1.0" name="viewport">
      <title>Smart Cart</title>
      <meta name="description" content="">
      <meta name="keywords" content="">

     
      <link href=" assets/img/favicon.png" rel="icon">
     
     
      <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
      <link href="assets/vendor/aos/aos.css" rel="stylesheet">
      <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
      <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

      
      <link href="assets/css/main.css" rel="stylesheet">

   

    </head>

    <body class="index-page">
            

            <header id="header" class="header d-flex align-items-center sticky-top">
              <div class="container position-relative d-flex align-items-center justify-content-between">

                <a href="index.jsp" class="logo d-flex align-items-center me-auto me-xl-0">
               
                  <img src="assets/img/logo1.png" alt="logo">
                 
                
                </a>

                <nav id="navmenu" class="navmenu">
                <ul>
                   
                    <li><a href="aboutus.jsp">About Us</a></li>
                    
                    <li><a href="contactus.jsp">Contact Us</a></li>
                  
                      </ul>  
                  <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>
                <a href="login.jsp" id="btn-login" class="btn-getstarted">Login</a>
              </div>
            </header>

            <main class="main">

              <!-- Hero Section -->
              <section id="hero" class="hero section light-background">

                <div class="container">
                  <div class="row gy-4 justify-content-center justify-content-lg-between">
                    <div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
                      <h1 data-aos="fade-up">Enjoy Your Shopping Experience in <br>Modern way</h1>
                      <p data-aos="fade-up" data-aos-delay="100">Order your product online by creating an account</p>
                      <div class="d-flex" data-aos="fade-up" data-aos-delay="200">
                        <a href="registration.jsp" class="btn-get-started">Sign in</a>
                        <a href="viewproducts" class="btn-get-started" style="margin-left: 20px">Products</a>
                      </div>
                    </div>
                    <div class="col-lg-5 order-1 order-lg-2 hero-img" data-aos="zoom-out">
                      <img src="assets/img/main.png" class="img-fluid animated" alt="">
                    </div>
                  </div>
                </div>

              </section>
              <section id="why-us" class="why-us section light-background">

                <div class="container">

                  <div class="row gy-4">

                    <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
                      <div class="why-box">
                        <h3>Why Choose Us</h3>
                        <p>
                          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                          labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit
                          Asperiores dolores sed et. Tenetur quia eos. Autem tempore quibusdam vel necessitatibus optio
                          ad corporis.
                        </p>
                        <div class="text-center">
                          <a href="#" class="more-btn"><span>Learn More</span> <i class="bi bi-chevron-right"></i></a>
                        </div>
                      </div>
                    </div>

                    <div class="col-lg-8 d-flex align-items-stretch">
                      <div class="row gy-4" data-aos="fade-up" data-aos-delay="200">

                        <div class="col-xl-4">
                          <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                            <i class="bi bi-clipboard-data"></i>
                            <h4>Corporis voluptates officia eiusmod</h4>
                            <p>Consequuntur sunt aut quasi enim aliquam quae harum pariatur laboris nisi ut aliquip</p>
                          </div>
                        </div>

                        <div class="col-xl-4" data-aos="fade-up" data-aos-delay="300">
                          <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                            <i class="bi bi-gem"></i>
                            <h4>Ullamco laboris ladore lore pan</h4>
                            <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt</p>
                          </div>
                        </div>

                        <div class="col-xl-4" data-aos="fade-up" data-aos-delay="400">
                          <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                            <i class="bi bi-inboxes"></i>
                            <h4>Labore consequatur incidid dolore</h4>
                            <p>Aut suscipit aut cum nemo deleniti aut omnis. Doloribus ut maiores omnis facere</p>
                          </div>
                        </div><!-- End Icon Box -->

                      </div>
                    </div>

                  </div>

                </div>

              </section><!-- /Why Us Section -->



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
                <p>© <span>Copyright</span> <strong class="px-1 sitename"
                    style="color:var(--accent-color)">SmartCart</strong> <span>All Rights Reserved</span></p>
                <div class="credits">
                 
                </div>
              </div>

            </footer>

            <!-- Scroll Top -->
            <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

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
            <script src="assets/js/main.js"></script>

    </body>

    </html>