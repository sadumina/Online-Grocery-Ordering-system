<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Dashboard</title>
<meta name="description" content="">
<meta name="keywords" content="">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Fonts -->
<!--<link href="https://fonts.googleapis.com" rel="preconnect">
          <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
          <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Amatic+SC:wght@400;700&display=swap" rel="stylesheet">

          <!-- Vendor CSS Files-->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Main CSS File-->
<link href="assets/css/main.css" rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
<link href="assets/css/dashboard.css" rel="stylesheet">


</head>

<body class="index-page">

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
		<div
			class="container position-relative d-flex align-items-center justify-content-between">

			<a href="index.jsp"
				class="logo d-flex align-items-center me-auto me-xl-0"> <!-- Uncomment the line below if you also wish to use an image logo -->
				<img src="assets/img/logo1.png" alt="logo">
			</a>

			<%
			HttpSession Session_s = request.getSession(false);
			String Email = (String) session.getAttribute("email");
			Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");

			if (isLoggedIn != null && isLoggedIn) {
			%>

			<a href="logout" id="btn-logout" class="btn-getstarted">Logout</a>
			<!-- redirect after 3 minutes when user is inactive -->

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

	<c:choose>
		<c:when test="${role == 'manager'}">
			<section id="sidebar">
				<ul class="side-menu top">
					<li class="active"><a href="viewcustomer">Account Details</a></li>
					<li><a href="productinsert.jsp">Add Products</a></li>
					<!-- <li><a href="#">Message</a></li> -->
					<li><a href="viewproducts">View Products</a></li>
					<li><a href="productsmanage.jsp">Manage Products</a></li>
				</ul>
			</section>
		</c:when>
	
		<c:when test="${role == 'customer'}">
		    <section id="sidebar">
				<ul class="side-menu top">
					<li class="active"><a href="viewcustomer">Account Details</a></li>
					<li><a href="ViewPayment">Payment details</a></li>
					<li><a href="viewcart">Cart</a></li>
					<li><a href="viewproducts">View Products</a></li>
					
				</ul>
			</section>
		</c:when>
	</c:choose>

	<!-- CONTENT -->
	<section id="content">
		<!-- MAIN -->
		<main>
			<div class="head-title">
				<div class="left">
					<%
					if (isLoggedIn != null && isLoggedIn)
					%>
					<h1>
						Welcome, <span style='color: #ce1212'><%=email%></span>
					</h1>
				</div>

			</div>

		</main>
		<!-- MAIN -->
	</section>


	<!-- CONTENT -->

	<footer>
		<div class="container copyright text-center mt-4">
			<p>
				© <span>Copyright</span> <strong class="px-1 sitename">Shopping</strong>
				<span>All Rights Reserved</span>
			</p>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you've purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
			</div>
		</div>
	</footer>
	<!-- Scroll Top -->
	<a href="#" id="scroll-top"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files 
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