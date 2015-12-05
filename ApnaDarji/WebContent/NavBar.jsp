<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="s" uri="/struts-tags" %>

<head>
<link rel="icon" type="image/png"  href="resources/favicon.png"/>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<link type="text/css" href="css/NavBar.css" rel="stylesheet"/>
<link type="text/css" href="css/bootstrap.css" rel="stylesheet"/>
<link type="text/css" href="css/bootstrap.min.css" rel="stylesheet"/>
<link type="text/css" href="css/bootstrap-theme.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="SignLogPopUp.css"/>

<script type="text/javascript" 	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/collapse.js"></script>
<script type="text/javascript" src="js/nav-js.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>

<script type="text/javascript">
$(document).ready(function () {

	$("#loginform").validate({
		 rules: {
	            emailId: {
	                required: true,
	                email: true
	            },
	            password: {
	                required: true,
	                minlength: 5
	            },
	        },
	        
	        // Specify the validation error messages
	        messages: {
	            password: 
	            {
	                required: "Please provide a password",
	                minlength: "Your password must be at least 5 characters long"
	            },
	            emailId:
	            {
	            	required: "Please enter a valid email address"
	            },
	        },
	   submitHandler: function(form, event) { 
		   $('#loader-mask').show();
			$.ajax({
				type : $('#loginform').attr('method'),
				url : $('#loginform').attr('action'),
				data : $('#loginform').serialize(),
				success : function(data) {
					$('#loader-mask').hide();
					var result  = $.trim(""+data);
					if(result == "success")
					{	
						$('#LogInBox').hide();
						$('#loginform').children('#error').text('Login Confirmed');
						location.reload();
					}
					else{
							$('#loader-mask').hide();
							$('#loginform').children('#error').text(data);
					}
				}
			});
	 return false;
	   }
	});

	jQuery.validator.addMethod("lettersonly", function(value, element) {
		  return this.optional(element) || /^[a-z]+$/i.test(value);
		}, "Only letters please!!"); 
	
	$("#signupform").validate({
		 rules: {
			 firstName: 
			 	{
		 			required: true,
		 			lettersonly: true,
		 			minlength: 2,
		 			maxlength: 20
// 		 			pattern: /^[a-zA-Z]{2,}/
// 		 			nospace: true
		 		},
		 		lastName: 
		 		{
		 			required: true,
		 			lettersonly: true,
		 			minlength: 2,
		 			maxlength: 20
// 		 			pattern: /^[a-zA-Z]{2,}/
		 		},
	            emailId: {
	                required: true,
	                email: true
// 	                pattern: /^[^@]+@[^@]+\.[a-zA-Z]{2,}/
//	                nospace: true
	            },
	            password: {
	                required: true,
	                minlength: 5
// 	                pattern:
//	                nospace: true
	            },
	            conPass: 
	            {
	            	 required: true,
		             minlength: 5
// 		             equalto: '#pswd'
//		             nospace: true
	            },
	            PrimaryContactNO: 
	            {
	            	required: true,
	            	minlength: 10,
	            	maxlength: 10,
	            	digits: true
// 	            	pattern: /^[789][0-9]{9}/
//	            	nospace: true
	            }
    	},
     
     // Specify the validation error messages
	     messages: {
	    	 firstName: 
			 	{
		 			required: "Please provide your First Name",
// 					numbers: "Name can not contain numbers, Sorry!!",
// 		 			minlength: "Atleast 2 characters",
// 		 			maxlength: "Please provide a small name, Sorry!!"
		 		},
		 		lastName: 
		 		{
		 			required: "Please provide your Last Name",
// 					digits: "No numbers, Sorry!!",
// 		 			minlength: "Atleast 2 characters",
// 		 			maxlength: "Too Long, Sorry!!"
		 		},
		 		PrimaryContactNO: 
	            {
		 			required: "Please provide your Last Name",
// 					digits: "No numbers, Sorry!!",
// 		 			minlength: "Atleast 2 characters",
// 		 			maxlength: "Too Long, Sorry!!"
//	            	nospace: true
	            },
	         password: 
	         {
		             required: "Please provide a password",
// 		             minlength: "Your password must be at least 5 characters long"
	//              nospace: "white spaces are not allowed"
	         },
	         emailId: {
	         		required: "Please enter a valid email address"
	//          	nospace: "white spaces are not allowed"
	         },
	         conPass: {
	         	 	required: "Please provide a password",
	         	 	equaltopass: true
// 		             minlength: "Your password must be at least 5 characters long",
// 		             equalto: "Password Mismatch"
	//	             nospace: "white spaces are not allowed"
	         }
	},
	        
		   submitHandler: function(form, event) { 
			   $('#loader-mask').show();
				$.ajax({
					type : $('#signupform').attr('method'),
					url : $('#signupform').attr('action'),
					data : $('#signupform').serialize(),
					success : function(data) {
						var result = $.trim(""+data);
						$('#loader-mask').hide();
//						alert("test");
						if (result == "success") 
						{
							
							$('#SignUpBox').fadeOut(1000);
							document.getElementById("signUpSubmit").disabled = false;
							var idc = $("#Con-Id");
							var winH = $(window).height();
							var winW = $(window).width();
							//Set the popup window to center
							$(idc).css('top', winH / 3 - $(idc).height() / 2);
							$(idc).css('left', winW / 2.2 - $(idc).width() / 2);
							
							$(idc).fadeIn(1200);
							sessTime = 15;
							document.getElementById('confstatus').innerHTML = "Your Session will timeout in "
									+ sessTime + " Minutes.";

							if (sessTime > 0) {
								window.setTimeout(SessCount, 60000);
								window.setTimeout(TimeCount, 60000);
							}
						}
						else 
						{
							document.getElementById("signUpSubmit").disabled = false;
							$('#signupform').children('.d-header').children('#error').text(result);
						}
					}

				});
				return false;
		   }
		});
	
	$("#CodeConfirmform").validate({
		   rules: {},
		   submitHandler: function(form, event) { 
			   $('#loader-mask').show();
			   $.ajax({
					type : $("#CodeConfirmform").attr('method'),
					url : $("#CodeConfirmform").attr('action'),
					data : $("#CodeConfirmform").serialize(),
					success : function(data) 
					{
						$('#loader-mask').hide();
						if (data.trim() == "success") 
							{
								sessTime = -1;
								$('#home-mask').fadeOut(1000);
								$('#Con-Id').fadeOut(1000);
								location.reload();
							} 
						else
							{
								document.getElementById('confstatus').innerHTML = data;
							}
					}
				});
		return false;
		   }
		});

	var FPassform = $('#FPassform');
	FPassform.validate({
		   rules: {
			   emailId: {
	                required: true,
	                email: true
			   }
	        },
	 		messages: {
		         emailId: {
		         		required: "Please enter a valid email address"
		         }
			},
		   submitHandler: function(form, event) { 
			   document.getElementById("FPSubmit").disabled = true;
			   $('#loader-mask').show();	
			   $.ajax({
							type : FPassform.attr('method'),
							url : FPassform.attr('action'),
							data : FPassform.serialize(),
							success : function(data) 
							{
								var result = data;
								document.getElementById("FPSubmit").disabled = false;
								alert(result);
								if (result == "success") 
								{
									$('#loader-mask').hide();
									$('#FPassBox').fadeOut(500);
									var idc = $("#welcome-dialog");
									$(idc).children('#wel-head').text('Password has been successfully sent to your mail box.');
									var winH = $(window).height();
									var winW = $(window).width();
									//Set the popup window to center
									$(idc).css('top', winH / 2.3 - $(idc).height() / 2);
									$(idc).css('left', winW / 2 - $(idc).width() / 2);
									$(idc).fadeIn(500);
									$(idc).fadeIn(2500);
									$(idc).children('#wel-head').text('');
								}
								else 
								{
									document.getElementById('error').innerHTML = result;
								}
							}

					});
			   return false;
		   	}
			
		});
}); 



function ShowLoader(){
	   $('#loader-mask').show();
}

function showFAQ(){
	if($('#temp').length){
		$('html,body').animate({
			scrollTop : $("#faq-div").offset().top - 100
		// on Home Page --> FAQ div
		}, 500);
	}
	else{
		window.location = "Details.jsp?id=t447668hud#eew";
	}
}

function showHowItWorks(){
	if($('#temp').length){
		$('html,body').animate({
			scrollTop : $("#how-it-works").offset().top - 70
		// on Home Page --> FAQ div
		}, 500);
	}
	else{
		window.location = "Details.jsp?id=343z56iuhd#";
	}
}

</script>

<title>NavBar</title>
</head>

<body>

<div style=" position: relative;">
		<div id="black-head" class="navbar-fixed-top">
			
		</div>
		<nav class="navbar navbar-default navbar-fixed-top">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="Landing.jsp"><img src="resources/ApnaDarji.png"/></a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav navbar-left">
		        <li><a href='FabricDisplayAction' onclick="ShowLoader()">Fabrics</a></li>
		        <li><a href="javaScript:void();" onclick="showHowItWorks()">How It Works</a></li>
		        <li><a href="Details.jsp?id=l117r883sw">Why Us</a></li>
		        <li><a href="Details.jsp?id=uy276jk493kh">Contact Us</a></li>
		        <li>
		          <a href="javaScript:void();" onclick="showFAQ()">FAQ</a>          
		        </li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		        <li>
		        	<a  href="CartDisplayAction">     
		        		My Cart
		        		<span class="glyphicon glyphicon-shopping-cart"></span>
		        		<s:if test="#session.cartItemCount != null">
		        			<span id="crt-itm-cnt" class="badge"><s:property value="#session.cartItemCount"/></span>
		        		</s:if>
		        			<span id="crt-itm-cnt" class="badge">0</span>
		        	</a>
		        </li>
		        <li>
		        	<a href="FavoriteProductDisplayAction">        		
		        		My Fav
		        		<span class="glyphicon glyphicon-heart"></span>
		        		<s:if test="#session.favList == null">
		        			<span  id="fav-itm-cnt" class="badge">0</span>
		        		</s:if>
		        		<s:else>
		        			<span  id="fav-itm-cnt" class="badge"><s:property value='%{#session.favList.size()}'/></span>
		        		</s:else>
		        	</a>
		        </li>
		      <s:if test="%{#session.inSession != null && #session.inSession == true }">
		        <li class="dropdown">
		          <a href="javascript: Void();" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My Account <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="UserAccountDisplayAction">Profile</a></li>
		            <li><a href="DisplayOrdersAction">Orders</a></li>           
		            <li role="separator" class="divider"></li>
		            <li><a href="javascript:void();" onclick="logout()">Logout</a></li>
		          </ul>
		        </li>
		       </s:if>	
				<s:else>
					<li>
						<a id="login-link" href="javascript:void();" onclick="Login()" >Log In</a>
					</li>
					<li>
						<a id="signup-link" href="javascript:void();" onclick="Register()" >Sign Up</a>
					</li>
				</s:else>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
</div>
<!--   -------------------------------------------------------------------------- -->
  
  	
			<div id="SignUpBox" class="window">
				<form action="SignUpAction" id="signupform" method="post">
				<div class="d-header">
					<h2>SIGN UP</h2>
					<ul>
						<li>
							<input type="text" name="firstName" placeholder="First Name"
									pattern='[a-zA-Z]{2,}'   required/> 
						</li>
						<li>
							<input type="text" name="lastName" pattern='[a-zA-Z]{2,}'
									placeholder="Last Name" required />
						</li>
						<li>
							<input type="tel" maxlength="10" name="PrimaryContactNO"
									pattern='[789][0-9]{9}' 
									placeholder=" 10 Digit Mobile Number" required /> 
						</li>
						<li>
							<input type="email" name="emailId" pattern='[^@]+@[^@]+\.[a-zA-Z]{2,}'
									placeholder='Email Id'
									 required />
						</li>
						<li>
							<input id="pswd" type="password" name="password"
								   placeholder="Password"  required />
						</li>
						<li>
							 <input	id="confirmpassword" type="password" name="conPass"
									placeholder="Confirm Password" required />
						</li>
					</ul>
					<input type="submit" id="signUpSubmit" value="Sign Up"/> 
					<input type="button" onclick="closeWinLogSign()" value="Never Mind"/>
					<p id="error"></p>
				</div>
				</form>
			</div>
			<!-- End of sign up Dialog -->

			<div id="Con-Id" class="window">
				<form action="CodeConfirmationAction" id="CodeConfirmform" method="post">
					<h2>Confirmation Code has been sent to your Email Id</h2>
					<div id="code-confirm-div">
					<input type="text" name="codeConfirm" id="confirm-code" placeholder="Confirmation Code" required/> 
					</div>
					<input type="submit" value="Confirm!!"/> 
					<input type="button" onclick="closeWinLogSign()" value="Never Mind" />
					<p id="confstatus"></p>
				</form>
			</div>
	
			<!-- Start of Log up Dialog -->
			<div id="LogInBox" class="window">
				<h2>LOG IN</h2>
				<form action="LoginAction" id="loginform" method="post">
					<ul>
						<li>
							<input type="email" name="emailId" id="logemail"
								pattern='[^@]+@[^@]+\.[a-zA-Z]{2,}'
								placeholder="Registered Email Address" required/> 
						</li>
						<li>
						<input type="password" name="password" placeholder="Password" 
								id="logpassword"  required/>
						</li>
					</ul>
					<ul>
						<li>
							<input type="submit" value="Log In"/> 
							<input type="button" onclick="closeWinLogSign()" value="Never Mind" />
						</li>
					</ul>
					<ul>
						<li>
							<a href="javascript:void();" onclick="ForgotPass()">Forgot Password</a> 
							<a href="javascript:void();" onclick="Register()">Create Account</a>
						</li>
					</ul>
					<p id="error"></p>
				</form>
					<p>OR</p>
					<ul  id="ad-fb-goog">
						<li>
							<input type="button" id="LogInFB"  value="Login With Facebook"/>
						</li>
						<li>
							<input type="button" id="LogInGoog" value="Login With Google"/>
						</li>
					</ul>
				</div>
			<!-- End of Log up Dialog -->
			
			<!-- Start of FP Box Dialog -->
			<div id="FPassBox" class="window">
				<form action="ForgotPasswordAction" id="FPassform" method="post">
					<div class="d-header">
						<h2>Please Provide Your Registered Email Id</h2>
						<ul>
							<li><input type="email" name="emailId" id="email"
								pattern='[^@]+@[^@]+\.[a-zA-Z]{2,}'
								placeholder="Registered Email Address" required/>
							</li>
						</ul>
						<input type="submit" id="FPSubmit" value="Send OTP" /> 
						<input type="button" onclick="closeWinLogSign()" value="Never Mind" />	
						<p id="FPerror"></p>
					</div>
				</form>
			</div>
			<!-- End of FP Box Dialog -->
		
		
			<!-- Start of chngPass Dialog -->
			<div id="chngPassBox" class="window">
				<form action="chngPass" id="chngPassform" method="post">
					<div class="d-header">
						<h2>Please Confirm Your Password Change</h2>
						<ul>
							<li>
								<input type="password" name="passwordOLD" placeholder="Old Password" required />
							</li>
							<li>
								<input type="password" name="passwordNEW" placeholder="New Password" required/>
							</li>
							<li>
								<input type="password" name="passwordCNF" placeholder="Conirm Password" required/>
							</li>
						</ul>
						<input type="submit" value="Confirm" /> 
						<input type="button" onclick="closeWinLogSign()" value="Never Mind" />	
						<p id="error"></p>
					</div>
				</form>
			</div>
			<!-- End of chngPass Dialog -->
			<!-- 	</div> -->
			<div id="welcome-dialog">
				<h3 id="wel-head"></h3>
			</div>

			<!-- 	home-mask to cover the whole screen -->
			<div id="home-mask" onclick="HomeMaskClick()">
			</div>
			<div id="loader-mask">
				<img src="resources/loader.gif"/>
			</div>
			<!-------------------------------------------------------------------------------------------------------- -->
   
  
</body>

</html>
