<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Contact Us</title>
<meta name="description" content="">
<meta name="keywords" content="">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">


<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Main CSS File -->
<link href="assets/css/main.css" rel="stylesheet">


</head>
<body class="index-page">

	<header id="header" class="header d-flex align-items-center sticky-top">
		<div
			class="container position-relative d-flex align-items-center justify-content-between">

			<a href="index.jsp"
				class="logo d-flex align-items-center me-auto me-xl-0"> 
				<img src="assets/img/logo1.png" alt="logo">
			</a>

			<nav id="navmenu" class="navmenu">
				<ul>
					<li><a href="aboutus.jsp">About Us</a></li>
					<li><a href="contactus.jsp" class="active">Contact Us</a></li>
				</ul>
				<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
			</nav>
			
			<a href="login.jsp" id="btn-login" class="btn-getstarted">Login</a>


		</div>
	</header>
	<main class="main">
		<!-- Contact Section -->
		<section id="contact" class="contact section">

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
				<h2>Contact</h2>
				<p>
					<span>Need Help?</span> <span class="description-title">Contact
						Us</span>
				</p>
			</div>
			<!-- End Section Title -->

			<div class="container" data-aos="fade-up" data-aos-delay="100">

				<div class="row gy-4">

					<div class="col-md-6">
						<div class="info-item d-flex align-items-center"
							data-aos="fade-up" data-aos-delay="200">
							<i class="icon bi bi-geo-alt flex-shrink-0"></i>
							<div>
								<h3>Address</h3>
								<p>A108 Adam Street, New York, NY 535022</p>
							</div>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-md-6">
						<div class="info-item d-flex align-items-center"
							data-aos="fade-up" data-aos-delay="300">
							<i class="icon bi bi-telephone flex-shrink-0"></i>
							<div>
								<h3>Call Us</h3>
								<p>+1 5589 55488 55</p>
							</div>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-md-6">
						<div class="info-item d-flex align-items-center"
							data-aos="fade-up" data-aos-delay="400">
							<i class="icon bi bi-envelope flex-shrink-0"></i>
							<div>
								<h3>Email Us</h3>
								<p>info@example.com</p>
							</div>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-md-6">
						<div class="info-item d-flex align-items-center"
							data-aos="fade-up" data-aos-delay="500">
							<i class="icon bi bi-clock flex-shrink-0"></i>
							<div>
								<h3>
									Opening Hours<br>
								</h3>
								<p>
									<strong>Mon-Sat:</strong> 11AM - 23PM; <strong>Sunday:</strong>
									Closed
								</p>
							</div>
						</div>
					</div>
					<!-- End Info Item -->

				</div>

				<form action="feedinsert" method="post">
					<div class="row gy-4">

						<div class="col-md-6">
							<input type="text" name="name" class="form-control"
								placeholder="Your Name">
						</div>

						<div class="col-md-6 ">
							<input type="email" class="form-control" name="email"
								placeholder="Your Email">
						</div>

						<div class="col-md-12">
							<input type="text" class="form-control" name="subject"
								placeholder="Subject">
						</div>

						<div class="col-md-12">
							<textarea class="form-control" name="message" rows="6"
								placeholder="Message"></textarea>
						</div>

						<div class="col-md-12 text-center">

							<div class="error-message"></div>
							` <a href="Viewfeed"><button type="submit">Send
									Message</button></a>
						</div>

					</div>
				</form>
				<!-- End Contact Form -->
				<!-- End Contact Form -->

			</div>

		</section>
		<!-- /Contact Section -->
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
							<strong>Phone:</strong> <span>+1 5589 55488 55</span><br> <strong>Email:</strong>
							<span>info@example.com</span><br>
						</p>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 d-flex">
					<i class="bi bi-clock icon"></i>
					<div>
						<h4>Opening Hours</h4>
						<p>
							<strong>Mon-Sat:</strong> <span>11AM - 23PM</span><br> <strong>Sunday</strong>:
							<span>Closed</span>
						</p>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<h4>Follow Us</h4>
					<div class="social-links d-flex">
						<a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a> <a
							href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
							href="#" class="instagram"><i class="bi bi-instagram"></i></a> <a
							href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
					</div>
				</div>

			</div>
		</div>

		<div class="container copyright text-center mt-4">
			<p>
				© <span>Copyright</span> <strong class="px-1 sitename"
					style="color: var(--accent-color)">SmartCart</strong> <span>All
					Rights Reserved</span>
			</p>
			<div class="credits">
				
			</div>
		</div>

	</footer>

	<!-- Scroll Top -->
	<a href="#" id="scroll-top"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Preloader -->
	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Main JS File -->
	<script src="assets/js/main.js"></script>
</body>
</html>