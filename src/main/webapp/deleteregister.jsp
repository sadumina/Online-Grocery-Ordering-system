<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

     <%
       String id = request.getParameter("id");
       String fname = request.getParameter("fname");
       String lname= request.getParameter("lname");
       String email= request.getParameter("email");
       String phonenumber = request.getParameter("phonenumber");
       String password = request.getParameter("password");
       
      %>

    <section
		class="vh-100 d-flex justify-content-center align-items-center">
		<div class="container-fluid h-custom">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-5 order-1 order-lg-2 hero-img"
					data-aos="zoom-out">
					<img src="assets/img/newreg.png" class="img-fluid animated" alt=""
						style="">
				</div>
				<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
					<div class="text-center">
						<img src="assets/img/logo1.png" style="width: 300px;" alt="logo">
						<!--  <h4 class="mt-1 mb-5 pb-1" style="color: white;">Smart Cart</h4>-->
					</div>
					<br>
					<br>
					<form action="delete" method="post">
						<div
							class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
							<p class="lead fw-normal mb-0 me-2">Customer Registration
								Form</p>
						</div>
						<br>
						<br>

						<!-- Email input -->
						  <div data-mdb-input-init class="form-outline mb-3">
							<input type="text" id="form3Example3"
								class="form-control form-control-lg" placeholder="id"
								name="id" value="<%= id %>"  readonly>
						</div>
						<!-- Email input -->
						<div data-mdb-input-init class="form-outline mb-3">
							<input type="text" id="form3Example3"
								class="form-control form-control-lg" placeholder="Fisrt name"
								name="fname" value="<%= fname %>" >
						</div>

						<!-- Password input -->
						<div data-mdb-input-init class="form-outline mb-3">
							<input type="text" id="form3Example4"
								class="form-control form-control-lg" placeholder=" Last name"
								name="lname" value="<%= lname %>"/>

						</div>


						<div data-mdb-input-init class="form-outline mb-3">
							<input type="email" id="form3Example4"
								class="form-control form-control-lg" placeholder="Email"
								name="email"  value="<%= email %>"/>
						</div>
						<div data-mdb-input-init class="form-outline mb-3">
							<input type="text" id="form3Example4"
								class="form-control form-control-lg" placeholder="Phonenumber"
								name="pnum"  value="<%= phonenumber %>" />
						</div>

						<div data-mdb-input-init class="form-outline mb-3">
							<input type="password" id="form3Example4"
								class="form-control form-control-lg" placeholder="Password"
								name="pwd" value="<%= password %>" />
						</div>



						<div class="text-center text-lg-start mt-4 pt-2">
							<a href="login.jsp"><input type="submit" data-mdb-button-init
								data-mdb-ripple-init class="btn btn-danger btn-md"
								style="padding-left: 2.5rem; padding-right : 2.5rem; background-color: #ce1212"
								value="Delete" /></a>
						</div>

					</form>
				</div>
			</div>
		</div>
	</section>
<!-- <div class="container">
        <form action="delete" method="post" >

            <h2>Your Account</h2>
            <div class="content">
                <div class="input-box">
                    <label for="name">First Name</label>
                    <input type="text" placeholder="Enter the first name" name="fname" value="<%= fname %>" readonly>
                </div>
                <div class="input-box">
                    <label for="Address">Last Name</label>
                    <input type="text" placeholder="Enter the last name" name="lname" value="<%= lname %>" readonly>
                </div>
                <div class="input-box">
                    <label for="Email">Email</label>
                    <input type="email" placeholder="Enter the email" name="email" value="<%= email %>" readonly>
                </div>
                <div class="input-box" >
                    <label for="phone Number">Phone Number</label>
                    <input type="text" placeholder="Enter your Phone Number" id="pnum" name="pnum" value="<%= phonenumber %>" readonly>
                </div>
                
                <div class="input-box">
                    <label for="Password">Password</label>
                    <input type="text" placeholder="Enter the Password" id="password" name="pwd" value="<%= password %>" readonly>
                    <div class="error-message" id="age-error"></div>
                </div>
                  
            </div>
            <div class="button-container">
                <input type="submit" name="delete" value="Delete"/>
            </div>
        </form>
    </div>  -->
</body>
</html>