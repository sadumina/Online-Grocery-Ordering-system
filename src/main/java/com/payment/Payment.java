package com.payment;



public class Payment {

		
			private int pid;
			private String email;
			private String cnumber;
			private String expiredate;
			private String cvc;
			public Payment(int pid, String email, String cnumber, String expiredate, String cvc) {
				
				this.pid = pid;
				this.email = email;
				this.cnumber = cnumber;
				this.expiredate = expiredate;
				this.cvc = cvc;
			}
			public Payment(int pid, String cnumber, String expiredate, String cvc) {
				
				this.pid = pid;
				this.cnumber = cnumber;
				this.expiredate = expiredate;
				this.cvc = cvc;
			}
			public int getPid() {
				return pid;
			}
			
			public Payment(String email,String cnumber, String expiredate, String cvc) {
				
				this.cnumber = cnumber;
				this.expiredate = expiredate;
				this.cvc = cvc;
			}
			public String getEmail() {
				return email;
			}
			
			public String getCnumber() {
				return cnumber;
			}
		
			public String getExpiredate() {
				return expiredate;
			}
		
			public String getCvc() {
				return cvc;
			}
			
			
         
		

	}



