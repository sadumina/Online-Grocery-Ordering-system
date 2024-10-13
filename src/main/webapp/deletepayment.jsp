<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     
        <%
       String pid = request.getParameter("pid");
       String email = request.getParameter("email");
       String cnum = request.getParameter("cardnum");
       String expiredate = request.getParameter("expiredate");
       String cvc = request.getParameter("cvc");
      
       
      %>

      <%  
              HttpSession Session = request.getSession(false); 
              if (Session==null || session.getAttribute("email")==null) {
                  response.sendRedirect("login.jsp"); return; } 
          %>

          <% 
              HttpSession session_s = request.getSession(false); 
              String role =(String) session_s.getAttribute("role"); 
              String Email1 =(String) session_s.getAttribute("email"); 

          %>
 
           <%  HttpSession Session_s = request.getSession(false); 
                      String Email = (String) session.getAttribute("email"); 
                      Boolean isLoggedIn=(Boolean) session.getAttribute("isLoggedIn");
         
                      if (isLoggedIn !=null && isLoggedIn) { 
                  %> 
                  
                  <a href="logout" id="btn-logout" class="btn-getstarted">Logout</a>
                    <!-- redirect after 3 minutes when user is inactive -->
                    
                    <script>
                        setTimeout(function() {
                        	alert("Your session has exprired. Please log in again.");
                        	window.location.href = "login.jsp";
                        }, 180000);
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
                  
     

      <div class="container">
      <div class="logo"></div>

      <div class="payment-details">
        <span> <strong>Merchant:</strong> EXUUS LIMITED </span>
        <span>
          <strong>Service: </strong> 250780712761 / Donation to the cause 200114
        </span>
        <span> <strong>Ref ID:</strong> A15441615193307 </span>
        <span> <strong>Amount:</strong> 500 RWF </span>
      </div>
  
     
      <h2 class="title">Secure payment powered by ESICIA Kpay</h2>
      <form action="paymentdelete" method="post">
      <div class="form">
        <div class="form-group">
          <div class="outlined-input-field">
            <input
              type="hidden"
              id="name"
              class="outlined-text-field"
              
              placeholder="email"
              name="pid"
              value="<%= pid %>" 
              readonly
              
            />
            <label for="name"> </label>
            <div class="helper-text"></div>
          </div>
        </div>
        <div class="form-group">
          <div class="outlined-input-field">
            <input
              type="text"
              id="name"
              class="outlined-text-field"
              
              placeholder="email"
              name="email"
              value="<%= email %>" 
              readonly
            />
            <label for="name"> </label>
            <div class="helper-text"></div>
          </div>
        </div>

        <div class="form-group">
          <div class="outlined-input-field">
            <input
            type="text"
            id="cardnumber"
            class="outlined-text-field"
            placeholder="card Number"
            name="cnumber"
            value="<%= cnum %>" 
            readonly
           
            />
            <label for="cardnumber"></label>
            <i></i>
            <div class="helper-text"></div>
          </div>
        </div>

        <div class="form-group">
          <div class="inline-form-group">
            <div class="outlined-input-field">
              <input
                type="text"
                id="expirationdate"
                class="outlined-text-field"
                placeholder="expire date"
                name="expiredate"
                value="<%= expiredate %>" 
                readonly
                
              />
              <label for="expirationdate"></label>
              <div class="helper-text"></div>
            </div>

            <div class="outlined-input-field">
              <input
                type="text"
                id="securitycode"
                class="outlined-text-field"
                placeholder="cvv"
                name="cvc"
                value="<%= cvc %>" 
                readonly
                
              />
              </div>
             
              <label for="securitycode"></label>
              <div class="helper-text"></div>
          </div>
        </div>
        <div class="form-group">
     <input class="button" type="submit" value="delete" name="deletepay"/> 
        </div>
      </div>
      </form>
      <div class="verified">
        <div class="visa"></div>
        <div class="mastercard"></div>
      </div>
    </div>
    
   
</body>
</html>