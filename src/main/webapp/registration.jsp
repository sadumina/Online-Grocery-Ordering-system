<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Smart cart</title>
  

<script type="text/javascript">
      window.onload = function() {
    	  var deleteStatus = '<%=request.getAttribute("deleteStatus")%>';
    	  var updateStatus = '<%=request.getAttribute("updateStatus")%>
	';

		if (updateStatus == "success") {
			alert("You have updated data successfully!");
		}
		if (deleteStatus == "success") {
			alert("Customer account deleted successfully!");
		}
	}
</script>
<style>
.animated {
	animation: up-down 4s ease-in-out infinite alternate-reverse both;
}

@keyframes up-down { 
  0% {
	transform: translateY(0px);
}
100% {
    transform : translateY(-10px);
    }
 }
</style>

	

<!--  <script>
        function validatePhoneNumber() {
            var phoneNumber = document.getElementById("pnum").value;
            var cleanedPhoneNumber = phoneNumber.replace(/\D/g, '');

            if (cleanedPhoneNumber.length !== 9) {
                alert("Please enter a 10-digit phone number.");
                return false;
            }

            if (!/^\d+$/.test(cleanedPhoneNumber)) {
                alert("Please enter a valid phone number.");
                return false;
            }

            alert("Phone number is valid.");
            return true;
        }
ss
        function validateAge() {
            var age = parseInt(document.getElementById("age").value);
            var errorMessage = document.getElementById("age-error");

            if (isNaN(age)) {
                errorMessage.innerText = "Please enter a valid age.";
                return false;
            }

            if (age < 20 || age > 50) {
                errorMessage.innerText = "Age must be between 20 and 50.";
                return false;
            }

           // errorMessage.innerText = ""; // Clear error message if age is valid
           // alert("Age is valid.");
            //return true;
        }
    </script>
    -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
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
					<form action="insert" method="post">
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
								class="form-control form-control-lg" placeholder="First name"
								name="fname" />
						</div>

						<!-- Password input -->
						<div data-mdb-input-init class="form-outline mb-3">
							<input type="text" id="form3Example4"
								class="form-control form-control-lg" placeholder=" Last name"
								name="lname" />

						</div>


						<div data-mdb-input-init class="form-outline mb-3">
							<input type="email" id="form3Example4"
								class="form-control form-control-lg" placeholder="Email"
								name="email" />
						</div>
						<div data-mdb-input-init class="form-outline mb-3">
							<input type="text" id="form3Example4"
								class="form-control form-control-lg" placeholder="Phonenumber"
								name="pnum" />
						</div>

						<div data-mdb-input-init class="form-outline mb-3">
							<input type="password" id="form3Example4"
								class="form-control form-control-lg" placeholder="Password"
								name="pwd" />
						</div>



						<div class="text-center text-lg-start mt-4 pt-2">
							<a href="login.jsp"><input type="submit" data-mdb-button-init
								data-mdb-ripple-init class="btn btn-danger btn-md"
								style="padding-left: 2.5rem; padding-right : 2.5rem; background-color: #ce1212"
								value="Register" /></a>
						</div>

					</form>
				</div>
			</div>
		</div>
	</section>

	<!--  <section class="vh-100">
  <div class="container h-30" style = "width : 1650px;">
    <div class="row d-flex justify-content-center align-items-left">
      <div class="col-lg-6 col-xl-9">
        <div class="card text-black" style="border-style : none; width : 900px; height : 500px;">
          <div class="card-body p-md-3">
            <div class="row justify-content-center">
              <div class="col-md-4 col-lg-4 col-xl-5 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                <form  action="insert" method="post" class="mx-1 mx-md-3">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div data-mdb-input-init class="form-outline flex-fill mb-0">
                      <input type="text" id="form3Example1c" class="form-control" name = "fname" />
                      <label class="form-label" for="form3Example1c">First Name</label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div data-mdb-input-init class="form-outline flex-fill mb-0">
                      <input type="email" id="form3Example3c" class="form-control" name = "lname" />
                      <label class="form-label" for="form3Example3c">Last Name</label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div data-mdb-input-init class="form-outline flex-fill mb-0">
                      <input type="password" id="form3Example4c" class="form-control" name = "email" />
                      <label class="form-label" for="form3Example4c">Email</label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                    <div data-mdb-input-init class="form-outline flex-fill mb-0">
                      <input type="password" id="form3Example4cd" class="form-control" name = "pnum" />
                      <label class="form-label" for="form3Example4cd">Phone Number</label>
                    </div>
                  </div>
                   <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                    <div data-mdb-input-init class="form-outline flex-fill mb-0">
                      <input type="password" id="form3Example4cd" class="form-control"  name = "pwd"/>
                      <label class="form-label" for="form3Example4cd">Password</label>
                    </div>
                  </div>

                  

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                 <a href = "login jsp"><button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg">Register</button></a>       
                  </div>

                </form>

              </div>
              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                  class="img-fluid" alt="Sample image">

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section> -->


	<!--   <div class="container">
        <form action="insert" method="post" >

            <h2 style = "color : black;">Registration</h2>
            <div class="content">
                <div class="input-box">
                    <label for="name">First Name</label>
                    <input type="text" placeholder="Enter the first name" name="fname" required>
                </div>
                <div class="input-box">
                    <label for="Address">Last Name</label>
                    <input type="text" placeholder="Enter the last name" name="lname" required>
                </div>
                <div class="input-box">
                    <label for="Email">Email</label>
                    <input type="email" placeholder="Enter the email" name="email" required>
                </div>
                <div class="input-box" >
                    <label for="phone Number">Phone Number</label>
                    <input type="text" placeholder="Enter your Phone Number" id="pnum" name="pnum" required>
                </div>
                
                <div class="input-box">
                    <label for="Password">Password</label>
                    <input type="text" placeholder="Enter the Password" id="password" name="pwd" required>
                    <div class="error-message" id="age-error"></div>
                </div>
                  
            </div>
            <div class="alert">
                <p>Already have an account?<a href="login.jsp">login</a></p>
            </div>
            <div class="button-container">
                <a href="${cus}"><button type="submit" name="insert" style = "background-color : #ce1212">Register</button></a>
            </div>
        </form>
    </div>  -->
</body>
</html>