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
	<table border="1" style="width: 50%; border-collapse: collapse; margin: 25px 0; font-size: 18px; font-family: Arial, sans-serif; text-align: left; justify-content:center">
	<c:forEach var="order" items="${orders}">
		<c:set var="id" value="${order.oid}" /> 
		<c:set var="fullname" value="${order.fullname}" />
		<c:set var="phone" value="${order.phone}" />
		<c:set var="date" value="${order.date}" />
		<c:set var="address" value="${order.address}" />
		<c:set var="city" value="${order.city}" />
		<c:set var="region" value="${order.region}" />
		<c:set var="zip" value="${order.zip}" />
		<c:set var="country" value="${order.country}" />

		<tr style="background-color: #ce1212; color: white;">
			<td style="padding: 10px; border: 1px solid #ddd; font-weight: bold;">Order ID</td>
			<td style="padding: 12px; border: 1px solid #ddd; text-align: center;">${order.oid}</td>
		</tr>
		<tr>
			<td style="padding: 12px; border: 1px solid #ddd; background-color: #f1f1f1; font-weight: bold;">Full Name</td>
			<td style="padding: 12px; border: 1px solid #ddd; text-align: center;">${order.fullname}</td>
		</tr>
		<tr style="background-color: #f2f2f2;">
			<td style="padding: 12px; border: 1px solid #ddd; font-weight: bold;">Phone</td>
			<td style="padding: 12px; border: 1px solid #ddd; text-align: center;">${order.phone}</td>
		</tr>
		<tr>
			<td style="padding: 12px; border: 1px solid #ddd; background-color: #f1f1f1; font-weight: bold;">Date</td>
			<td style="padding: 12px; border: 1px solid #ddd; text-align: center;">${order.date}</td>
		</tr>
		<tr style="background-color: #f2f2f2;">
			<td style="padding: 12px; border: 1px solid #ddd; font-weight: bold;">Address</td>
			<td style="padding: 12px; border: 1px solid #ddd; text-align: center;">${order.address}</td>
		</tr>
		<tr>
			<td style="padding: 12px; border: 1px solid #ddd; background-color: #f1f1f1; font-weight: bold;">City</td>
			<td style="padding: 12px; border: 1px solid #ddd; text-align: center;">${order.city}</td>
		</tr>
		<tr style="background-color: #f2f2f2;">
			<td style="padding: 12px; border: 1px solid #ddd; font-weight: bold;">Region</td>
			<td style="padding: 12px; border: 1px solid #ddd; text-align: center;">${order.region}</td>
		</tr>
		<tr>
			<td style="padding: 12px; border: 1px solid #ddd; background-color: #f1f1f1; font-weight: bold;">Zip</td>
			<td style="padding: 12px; border: 1px solid #ddd; text-align: center;">${order.zip}</td>
		</tr>
		<tr style="background-color: #f2f2f2;">
			<td style="padding: 12px; border: 1px solid #ddd; font-weight: bold;">Country</td>
			<td style="padding: 12px; border: 1px solid #ddd; text-align: center;">${order.country}</td>
		</tr>
	</c:forEach>
</table>


	<c:url value="updateorder.jsp" var="orderupdate">
		<c:param name="oid" value="${id}" />
		<c:param name="fname" value="${fullname}" />
		<c:param name="phone" value="${phone}" />
		<c:param name="date" value="${date}" />
		<c:param name="address" value="${address}" />
		<c:param name="city" value="${city}" />
		<c:param name="region" value="${region}" />
		<c:param name="zip" value="${zip}" />
		<c:param name="country" value="${country}" />

	</c:url>

	<a href="${orderupdate}"> <input type="button" name="update"
		value="Update Data">
	</a>
	
	<c:url value="deleteorder.jsp" var="orderdelete">
		<c:param name="oid" value="${id}" />
		<c:param name="fname" value="${fullname}" />
		<c:param name="phone" value="${phone}" />
		<c:param name="date" value="${date}" />
		<c:param name="address" value="${address}" />
		<c:param name="city" value="${city}" />
		<c:param name="region" value="${region}" />
		<c:param name="zip" value="${zip}" />
		<c:param name="country" value="${country}" />
	</c:url>

	<a href="${orderdelete}"> <input type="button" name="delete"
		value="Delete Account">
	</a>
	
	
</body>
</html>