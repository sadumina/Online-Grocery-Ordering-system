<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	<div
		style="width: 100%; display: flex; justify-content: center; padding: 20px;">
		<table border="1">
			<c:forEach var="feed" items="${feedbackDetails}">


				<tr>
					<td style="padding: 10px; border: 1px solid #ddd;">Customer ID</td>
					<td style="padding: 10px; border: 1px solid #ddd;">${feed.id}</td>
				</tr>
				<tr>
					<td style="padding: 10px; border: 1px solid #ddd;">Customer
						FName</td>
					<td style="padding: 10px; border: 1px solid #ddd;">${feed.name}</td>
				</tr>
				<tr>
					<td style="padding: 10px; border: 1px solid #ddd;">Customer
						email</td>
					<td style="padding: 10px; border: 1px solid #ddd;">${feed.email}</td>
				</tr>
				<tr>
					<td style="padding: 10px; border: 1px solid #ddd;">Feedback
						subject</td>
					<td style="padding: 10px; border: 1px solid #ddd;">${feed.subject}</td>
				</tr>
				<tr>
					<td style="padding: 10px; border: 1px solid #ddd;">Customer
						message</td>
					<td style="padding: 10px; border: 1px solid #ddd;">${feed.message}</td>
				</tr>
				

			</c:forEach>
		</table>
		
		</div>