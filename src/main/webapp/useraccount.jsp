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
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->
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
					<li><a href="prodinsert">Add Products</a></li>
					<!-- <li><a href="#">Message</a></li> -->
					<li><a href="viewproducts">View Products</a></li>
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
			</div><br><br>

			<div class="container">
				<div class="jumbotron">
					<div class="card" style="width: 40rem; border-style: none; margin-left: 100px;">
						<div class="card-header"><h5><strong>User Details</strong></h5></div>
						<div class="card-body">
							<table class="table">
								<c:forEach var="cus" items="${regdetails}">
									<c:set var="id" value="${cus.id}" />
									<c:set var="fname" value="${cus.fname}" />
									<c:set var="lname" value="${cus.lname}" />
									<c:set var="email" value="${cus.email}" />
									<c:set var="phonenumber" value="${cus.phonenumber}" />
									<c:set var="password" value="${cus.password}" />
									<tbody>
										<tr>
											<td style="padding-left: 70px;"><strong>First Name</strong></td>
											<td style="padding-left: 90px;">${cus.fname}</td>
										</tr>
										<tr>
											<td style="padding-left: 70px;"><strong>Last Name</strong></td>
											<td style="padding-left: 90px;">${cus.lname}</td>
										</tr>
										<tr>
											<td style="padding-left: 70px;"><strong>Email</strong></td>
											<td style="padding-left: 90px;">${cus.email}</td>
										</tr>
										<tr>
											<td style="padding-left: 70px;"><strong>Mobile</strong></td>
											<td style="padding-left: 90px;">${cus.phonenumber}</td>
										</tr>
									</tbody>
								</c:forEach>
							</table> <br><br>


							<c:url value="updateregister.jsp" var="cusupdate">
								<c:param name="id" value="${id}" />
								<c:param name="fname" value="${fname}" />
								<c:param name="lname" value="${lname}" />
								<c:param name="email" value="${email}" />
								<c:param name="phonenumber" value="${phonenumber}" />
								<c:param name="password" value="${password}" />

							</c:url>
							<a href="${cusupdate}"> <input type="submit" name="Update" value="Update" class="btn btn-outline-success" style="margin:0 10px 0 400px; "></a>
								
							<c:url value="deleteregister.jsp" var="cusdelete">
								<c:param name="id" value="${id}" />
								<c:param name="fname" value="${fname}" />
								<c:param name="lname" value="${lname}" />
								<c:param name="email" value="${email}" />
								<c:param name="phonenumber" value="${phonenumber}" />
								<c:param name="password" value="${password}" />
							</c:url>
							<a href="${cusdelete}"> <input type="submit" name="Delete" value="Delete" class="btn btn-outline-danger"></a>	

						</div>
					</div>
				</div>
			</div>

		</main>
		<!-- MAIN -->
	</section>


	<!-- CONTENT -->

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
                  <!-- All the links in the footer should remain intact. -->
                  <!-- You can delete the links only if you've purchased the pro version. -->
                  <!-- Licensing information: https://bootstrapmade.com/license/ -->
                  <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->

                </div>
              </div>

            </footer>

            <!-- Scroll Top -->
            <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

            <!-- Preloader -->
            

            <!-- Vendor JS Files -->
            <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="assets/vendor/php-email-form/validate.js"></script>
            <script src="assets/vendor/aos/aos.js"></script>
            <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
            <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
            <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

            <!-- Main JS File -->
            <script src="assets/js/main.js"></script>
	        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->

</body>

</html>