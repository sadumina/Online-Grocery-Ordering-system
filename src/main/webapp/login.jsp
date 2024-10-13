<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grocery Store</title>
    
    <!-- MDBootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <!-- <link rel="stylesheet" href="assets/css/login.css"> -->
    <style>
       .animated {
	       animation: up-down 4s ease-in-out infinite alternate-reverse both;
        }
        @keyframes up-down {
          0% {
            transform: translateY(0px);
          }

          100% {
            transform: translateY(-10px);
          }
        }
   </style>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!--<section class="h-100 gradient-form" style="background-color: #eee;">
        <div class="container py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-xl-10">
              <div class="card rounded-3 text-black">
                <div class="row g-0">
                  <div class="col-lg-6">
                    <div class="card-body p-md-5 mx-md-4">
      
                      <div class="text-center">
                        <img src="assets/img/logo1.png"
                          style="width: 200px;" alt="logo">
                        <!--  <h4 class="mt-1 mb-5 pb-1" style="color: white;">Smart Cart</h4>
                      </div>
      
                      <form action="login" method="post">
                      
                        <br><br><br><p style="color: white;">Please login to your account</p>
      
                        <div data-mdb-input-init class="form-outline mb-4">
                          <input type="email" id="form2Example11" class="form-control"
                            placeholder="" name="email" />
                          <label class="form-label" for="form2Example11" style="color: white;">Email</label>
                        </div>
      
                        <div data-mdb-input-init class="form-outline mb-4">
                          <input type="password" id="form2Example22" class="form-control" name="pwd" />
                          <label class="form-label" for="form2Example22" style="color: white;">Password</label>
                        </div>
      
                        <div class="text-center pt-1 mb-5 pb-1">
                           <input type="submit" value="Login" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3"></a>
                        </div>
      
                        <!--  <div class="d-flex align-items-center justify-content-center pb-4">
                          <p class="mb-0 me-2" style="color: white;">Don't have an account?</p>
                          <a href="registration.jsp"><input  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-danger">Create new</a>
                           
                        </div>
      
                      </form>
      
                    </div>
                  </div>
                  <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                    <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                      <img src="" class="mb-4">We are more than just a company</h4>
                      <p class="small mb-0">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>-->
	<section class="vh-100 d-flex justify-content-center align-items-center">
		<div class="container-fluid h-custom">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-5 order-1 order-lg-2 hero-img" data-aos="zoom-out">
                      <img src="assets/img/main.png" class="img-fluid animated" alt="">
                    </div>
				<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
				    <div class="text-center">
                        <img src="assets/img/logo1.png"
                          style="width: 300px;" alt="logo">
                        <!--  <h4 class="mt-1 mb-5 pb-1" style="color: white;">Smart Cart</h4>-->
                    </div><br><br>
					<form action="login" method="post">
						<div
							class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
							<p class="lead fw-normal mb-0 me-3">Login to your account</p>
						</div><br><br>

						<!-- Email input -->
						<div data-mdb-input-init class="form-outline mb-4">
							<input type="email" id="form3Example3"
								class="form-control form-control-lg"
								placeholder="Enter a valid email address" name="email"/> <label
								class="form-label" for="form3Example3">Email address</label>
						</div>

						<!-- Password input -->
						<div data-mdb-input-init class="form-outline mb-3">
							<input type="password" id="form3Example4"
								class="form-control form-control-lg"
								placeholder="Enter password" name="pwd"/> <label class="form-label"
								for="form3Example4">Password</label>
						</div>

						<div class="text-center text-lg-start mt-4 pt-2">
							<input type="submit" data-mdb-button-init data-mdb-ripple-init
								class="btn btn-danger btn-md"
								style="padding-left: 2.5rem; padding-right: 2.5rem; background-color: #ce1212" value="Login"/>
							<p class="small fw-bold mt-2 pt-1 mb-0">
								Don't have an account? <a href="registration.jsp" class="link-danger">Register</a>
							</p>
						</div>

					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- MDBootstrap JS -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
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