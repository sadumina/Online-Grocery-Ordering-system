<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

     <table border="1">
	<c:forEach var="order" items="${orders}">
	
	
         <c:set var="oid" value="${order.}"/>
	     <c:set var="email" value="${pay.email}"/>
	     <c:set var="cnum" value="${pay.cnumber}"/>
	     <c:set var="expiredate" value="${pay.expiredate}"/>
         <c:set var="cvc" value="${pay.cvc}"/>
	    
	    <tr>
		    <td>payment ID</td>
		    <td>${pay.pid}</td>
	    </tr>
	    <tr>
		   <td>Email</td>
		   <td>${pay.email}</td>
	   </tr> 
	   <tr>
		  <td>Card Number</td>
		  <td>${pay.cnumber}</td>
	  </tr>
	  <tr>
		  <td>ExpireDate</td>
		  <td>${pay.expiredate}</td>
	  </tr>
	  <tr>
		 <td>cvc</td>
		 <td>${pay.cvc}</td>
	 </tr>
	
	  

	</c:forEach>
	</table>
	
</body>
</html>