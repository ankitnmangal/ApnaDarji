<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="SignLogPopUp.css">
<link rel="stylesheet" type="text/css" href="NavBar.css">
<script type="text/javascript" 	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">


var sessTime = -1;
	function logout(){
// 		alert("logout");
		$.ajax({

			type :'post',
			url : 'LogoutAction',
// 			data : loginform.serialize(),
			success : function(data) {
				var name = data;
// 				alert(name);
				location.reload();
			}
		});
	}
	var loginform = $('#loginform');
	loginform.on('submit', function(e) {
		e.preventDefault();
		alert(loginform.attr('action')+loginform.attr('method'));
		$.ajax({
			
			type : loginform.attr('method'),
			url : loginform.attr('action'),
			data : loginform.serialize(),
			success : function(data) {
				var name = data;
// 				alert(name);
				location.reload();

				$('#LogInBox').hide();
				$('#userNamep').fadeIn(0);
				
				
				var id = $("#welcome-dialog");
				var winH = $(window).height();
				var winW = $(window).width();

				document.getElementById('wel-head').innerHTML = "Welcome " ;
				//Set the popup window to center
				$(id).css('top', winH / 2.3 - $(id).height() / 2);
				$(id).css('left', winW / 2 - $(id).width() / 2);

				$(id).fadeIn(1200);
				$(id).fadeOut(2000);
				$('#home-mask').fadeOut(1500);
			}
		});

		return false;
	});

	var signupform = $('#signupform');
	signupform.submit(function() {
				document.getElementById("signUpSubmit").disabled = true;
				var maskHeight = $(document).height();
				var maskWidth = $(document).width();
				$('#loader-mask').css({
					'width' : maskWidth,
					'height' : maskHeight
					
				});
				$('#loader-mask').fadeIn(100);
				$.ajax({
							type : signupform.attr('method'),
							url : signupform.attr('action'),
							data : signupform.serialize(),
							success : function(data) {
								var result = data;
								alert(result);
								if (result == "Password Mismatch") {
									document.getElementById("signUpSubmit").disabled = false;
									document.getElementById('error').innerHTML = result;
								} else {
									$('#SignUpBox').fadeOut(1000);
									$('#loader-mask').fadeOut(100);
									document.getElementById("signUpSubmit").disabled = false;
// 									$('#home-mask').fadeOut(1000);
									alert("hi");
									var idc = $("#Con-Id");
									var winH = $(window).height();
									var winW = $(window).width();
									//Set the popup window to center
									$(idc).css('top', winH / 2.3 - $(idc).height() / 2);
									$(idc).css('left', winW / 2 - $(idc).width() / 2);
									$(idc).fadeIn(1200);
									document.getElementById("code").value = result;
									sessTime = 5;
									document.getElementById('confstatus').innerHTML = "Your Session will timeout in "
											+ sessTime + " Minutes.";

									if (sessTime > 0) {
										window.setTimeout(SessCount, 6000);
										window.setTimeout(TimeCount, 6000);
									}
								}

							}

						});
				return false;
			});

	function SessCount() {
		sessTime = sessTime - 1;
		if (sessTime > 0) {
			window.setTimeout(SessCount, 6000);
		}
	}
	
	function TimeCount() {
		document.getElementById('confstatus').innerHTML = "Your Session will timeout in "
				+ sessTime + " Minutes.";
		if (sessTime == 0) {
			var id = $("#Con-Id");
			$(id).hide();
			$('#home-mask').fadeOut(1000);
			$('#code').val(null);
			var idw = $("#welcome-dialog");
			var winH = $(window).height();
			var winW = $(window).width();
			//Set the popup window to center
			$(idw).css('top', winH / 2.0 - $(id).height() / 2);
			$(idw).css('left', winW / 1.45 - $(id).width() / 2);
			document.getElementById('wel-head').innerHTML = "Time Out!! <br> SignUp again.";
			$(idw).fadeIn(1);
			$(idw).fadeOut(4500);
		} else {
			if (sessTime > 0) {
				window.setTimeout(TimeCount, 6000);
			}
		}
	}
	
	var CodeConfirmform = $('#CodeConfirmform');
	CodeConfirmform.submit(function() {
				$.ajax({
							type : CodeConfirmform.attr('method'),
							url : CodeConfirmform.attr('action'),
							data : CodeConfirmform.serialize(),
							success : function(data) 
							{
								var result = data;
								if (result == "session") 
									{
										sessTime = -1;
										$('#code').val(null);
										var id = $("#welcome-dialog");
										var winH = $(window).height();
										var winW = $(window).width();
										//Set the popup window to center
										$(id).css('top', winH / 2.3 - $(id).height() / 2);
										$(id).css('left', winW / 2 - $(id).width() / 2);
										document.getElementById('wel-head').innerHTML = "Welcome Arpit!!";
										$('#home-mask').fadeOut(1000);
										$('#Con-Id').fadeOut(1000);
										$(id).fadeIn(1200);
										$(id).fadeOut(1200);
										$('#userNamep').fadeIn(0);
										document.getElementById('userNamep').innerHTML = "Hi Arpit";
										$('#home-enrl-crse-icon, #home-chng-pass-icon, #home-log-out-icon').fadeIn(0);
	
									} 
								else
									{
										document.getElementById('confstatus').innerHTML = result;
									}
							}
						});
				return false;
			});
	
	var FPassform = $('#FPassform');
	FPassform.submit(function() {
				$.ajax({
							type : FPassform.attr('method'),
							url : FPassform.attr('action'),
							data : FPassform.serialize(),
							success : function(data) 
							{
								var result = data;
								alert(result);
								if (result == "Please check your email address") 
								{
									document.getElementById("FPSubmit").disabled = false;
									document.getElementById('error').innerHTML = result;
								}
								else 
								{
									$('#FPassBox').fadeOut(1000);
									document.getElementById("FPSubmit").disabled = false;
		//								$('#home-mask').fadeOut(1000);
									alert("hi");
									var idc = $("#Con-Id");
									var winH = $(window).height();
									var winW = $(window).width();
									//Set the popup window to center
									$(idc).css('top', winH / 2.3 - $(idc).height() / 2);
									$(idc).css('left', winW / 2 - $(idc).width() / 2);
									$(idc).fadeIn(1200);
									document.getElementById("code").value = result;
									sessTime = 5;
									document.getElementById('confstatus').innerHTML = "Your Session will timeout in "
											+ sessTime + " Minutes.";
		
									if (sessTime > 0) 
									{
										window.setTimeout(SessCount, 6000);
										window.setTimeout(TimeCount, 6000);
									}
								}
		
							}
						});
				return false;
			});
	

function Login() {
	
					var id = $("#LogInBox");
					$("#chngPassBox").fadeOut(0);
					$("#SignUpBox").fadeOut(0);
					$("#FPassBox").fadeOut(0);
					$("#LogRegPopUp").fadeOut(0);
					$('#mask').fadeOut(1000);
// 					Get the window height and width
					var winH = $(window).height();
					var winW = $(window).width();

					//Set the popup window to center
					$(id).css('top', winH / 2.3 - $(id).height() / 2);
					$(id).css('left', winW / 2 - $(id).width() / 2);

					//transition effect
					$(id).fadeIn(1000);

					//Get the screen height and width
					var maskHeight = $(document).height();
					var maskWidth = $(document).width();

					//Set heigth and width to home-mask to fill up the whole screen
					$('#home-mask').css({
						'width' : (maskWidth * 6),
						'height' : maskHeight
					});

					//transition effect		
					$('#home-mask').fadeIn(1000);
						$('#mask').fadeTo("slow", 0.7);
			}
			
function ForgotPass() {
				var id = $("#FPassBox");
				$("#chngPassBox").fadeOut(0);
				$("#LogInBox").fadeOut(0);
				$("#SignUpBox").fadeOut(0);
				//Get the window height and width
				var winH = $(window).height();
				var winW = $(window).width();
			
				//Set the popup window to center
				$(id).css('top', winH / 2.3 - $(id).height() / 2);
				$(id).css('left', winW / 2 - $(id).width() / 2);
			
				//transition effect
				$(id).fadeIn(1000);
			
				//Get the screen height and width
				var maskHeight = $(document).height();
				var maskWidth = $(document).width();
			
				//Set heigth and width to home-mask to fill up the whole screen
				$('#home-mask').css({
					'width' : (maskWidth * 6),
					'height' : maskHeight
				});
			
				//transition effect		
				$('#home-mask').fadeIn(1000);
				//	$('#mask').fadeTo("slow", 0.7);

}

function Register() {
	
					var id = $("#SignUpBox");
					$("#chngPassBox").fadeOut(0);
					$("#LogInBox").fadeOut(0);
					$("#FPassBox").fadeOut(0);
					$("#LogRegPopUp").fadeOut(0);
					$('#mask').fadeOut(1000);
					//Get the window height and width
					var winH = $(window).height();
					var winW = $(window).width();
			
					//Set the popup window to center
					$(id).css('top', winH / 2 - $(id).height() / 2);
					$(id).css('left', winW / 2 - $(id).width() / 2);
			
					//transition effect
					$(id).fadeIn(1000);
			
					//Get the screen height and width
					var maskHeight = $(document).height();
					var maskWidth = $(document).width();
			
					//Set heigth and width to home-mask to fill up the whole screen
					$('#home-mask').css({
						'width' : maskWidth,
						'height' : maskHeight
					});
					//transition effect		
					//$('#home-mask').fadeIn(1home-home-mask;
					$('#home-mask').fadeTo("slow", 0.7);
// 		}
// });
}
$('#home-mask').click(function() {
	$(this).hide();
	$('#SignUpBox').fadeOut(1000);
	
	$('#LogInBox').fadeOut(1000);
	$("#welcome-dialog").hide();
	$('#Con-Id').hide();
	$("#FPassBox").fadeOut(1000);
	$("#chngPassBox").fadeOut(1000);
	sessTime = -1;
	$('#code').val(null);
	document.getElementById("signUpSubmit").disabled = false;
});

$(window).resize(function() {

	var box = $('#boxes .window');

	//Get the screen height and width
	var maskHeight = $(document).height();
	var maskWidth = $(window).width();

	//Set height and width to home-mask to fill up the whole screen
	$('#home-mask').css({
		'width' : maskWidth,
		'height' : maskHeight
	});

	//Get the window height and width
	var winH = $(window).height();
	var winW = $(window).width();

	//Set the popup window to center
	box.css('top', winH / 2 - box.height() / 2);
	box.css('left', winW / 2 - box.width() / 2);

});
function Logout(){
	$("#SignUpBox").fadeOut(0);
	$("#chngPassBox").fadeOut(0);
	$("#LogInBox").fadeOut(0);
	$("#FPassBox").fadeOut(0);
	$("#LogRegPopUp").fadeOut(0);
	$('#mask').fadeOut(0);
	$('#home-mask').fadeOut(0);
	$('#courseDetail').fadeOut(1000);
	$("#courses-welcome-dialog").fadeOut(1000);
	
	 $.get('Logout', function(data) {
		 var name = data;
		 var id = $("#welcome-dialog");
			var winH = $(window).height();
			var winW = $(window).width();

			//Set the popup window to center
			$(id).css('top', winH / 2.3 - $(id).height() / 2);
			$(id).css('left', winW / 2 - $(id).width() / 2);
			$('#home-enrl-crse-icon, #home-chng-pass-icon, #home-log-out-icon').fadeOut(0);
			document.getElementById('userNamep').innerHTML = "";
			document.getElementById('wel-head').innerHTML = "You Are Successfully Logged Out" +name;
			$(id).fadeIn(1200);
			$(id).fadeOut(1200);
	 });
}

function changePass(){
	//Get the A tag
	var id = $("#chngPassBox");
	$("#SignUpBox").fadeOut(0);
	$("#LogInBox").fadeOut(0);
	$("#FPassBox").fadeOut(0);
	$('#courses-mask').fadeOut(0);
	
	//Get the window height and width
	var winH = $(window).height();
	var winW = $(window).width();

	//Set the popup window to center
	$(id).css('top', winH / 2 - $(id).height() / 2);
	$(id).css('left', winW / 2 - $(id).width() / 2);

	//transition effect
	$(id).fadeIn(1000);

	//Get the screen height and width
	var maskHeight = $(document).height();
	var maskWidth = $(document).width();

	//Set heigth and width to home-mask to fill up the whole screen
	$('#home-mask').css({
		'width' : maskWidth,
		'height' : maskHeight
	});
	//transition effect		
	//$('#home-mask').fadeIn(1home-home-mask;
	$('#home-mask').fadeTo("slow", 0.7);
}
			
function closeWinLogSign() {
	//		alert("hi");
	$('#home-mask').fadeOut(1000);
	$('#SignUpBox').fadeOut(1000);
	$('#LogInBox').fadeOut(1000);
	$("#welcome-dialog").fadeOut(1000);
	$("#Con-Id").fadeOut(1000);
	$("#chngPassBox").fadeOut(1000);
	$("#FPassBox").fadeOut(1000);
	document.getElementById("signUpSubmit").disabled = false;
	sessTime = -1;
	$('#code').val(null);
}
</script>
</head>
<body>
	<div style="height: 115px; position: relative;">
		<div id="black-head"></div>
		<div id="side-menu"></div>

		<div id="nav-bar">
<!-- 			<div id="side-menu-btn" onClick="showSideMenu()" class="nav-inline-items"> -->
<!-- 				<hr width="20px" color="white"> -->
<!-- 				<hr width="25px" color="white"> -->
<!-- 				<hr width="30px" color="white"> -->
<!-- 									<hr width="35px" color="white"> -->
<!-- 			</div> -->
			<div id="nav-bar-logo" class="nav-inline-items">
				<a href="Landing.jsp">APNA DARJI</a>
			</div>
			<div id="nav-bar-menus" class="nav-inline-items">

				<ul>
					<li>
						<a href="<s:url action="FabricDisplayAction"/>">Fabrics</a>
					</li>
					<li>
						<p style="cursor: pointer;">How It Works</p>
					</li>
					<li>
						<p style="cursor: pointer;">Why Us</p>
					</li>
					<li>
						<p style="cur sor: pointer;">Contact Us</p>
					</li>
					<li>
						<p style="cursor: pointer;">FAQ</p>
					</li>
				</ul>
			</div>
			<div id="nav-bar-cart" class="nav-inline-items">
				<p style="cursor: pointer;" class="nav-inline-items">My Cart</p>
				<div id="cart-count-crcl" class="nav-inline-items"><span><s:property value="0"/></span></div>
			</div>
			<div id="nav-bar-fav" class="nav-inline-items">
				<p style="cursor: pointer;" class="nav-inline-items">Fav</p>
				<div id="fav-count-crcl" class="nav-inline-items"><span><s:property value="0"/></span></div>
			</div>
			<div id="nav-bar-account" class="nav-inline-items">
				<s:if test="%{#session.inSession != null && #session.inSession == true }">
					<div id="nav-bar-my-account">					
						<span class="nav-inline-items">My Account</span>
						<img  class="nav-inline-items" src="resources/arrowblack.png">
						<div id="my-account-dropdown">
								<ul>
										<li> 
											<a href="MyAccount.jsp">My Profile</a>
										</li>
										<li> 
											<a href="<s:url action="DisplayOrdersAction"/>">My Orders</a>
										</li>
										<li> 
											<a href="javascript:void();" onClick="logout()">Log Out</a>
										</li>
								</ul>
						</div>
					</div>
				</s:if>	
				<s:else>
					<p class="nav-inline-items" onClick="Login()" alt="Log In">Log In</p>
					<p class="nav-inline-items" onClick="Register()" alt="Sign Up">Sign Up</p>
				</s:else>
			</div>
			

			<!--------------------------------------------------------------------------------------- -->
			
			
			<div id="SignUpBox" class="window">
				<form action="SignUpAction" id="signupform" method="post">
				<div class="d-header">
					<h2>Create Your CPU Account</h2>
					<ul>
						<li><input type="text" name="firstName" placeholder="First Name"
							pattern='[a-zA-Z]{2,}' required value="test" /> <input
							type="text" name="lastName" value="test" pattern='[a-zA-Z]{2,}'
							placeholder="Last Name" required /></li>

						<li><input type="tel" maxlength="10" name="phNo"
							pattern='[789][0-9]{9}' value="9999999999"
							placeholder="Phone Number(without country code)" required /> 
							<input type="email" name="emailId" pattern='[^@]+@[^@]+\.[a-zA-Z]{2,}'
							placeholder='Email Id(This will be your User Id)'
							value="test@test.com" required /></li>
						<li><input id="pswd" type="password" name="password"
							placeholder="Password" value="test" required /> <input
							id="confirmpassword" type="password" name="conPass" value="test"
							placeholder="Confirm Password" required /></li>
					</ul>
					<input type="submit" id="signUpSubmit" value="SIGN UP" /> <input
						type="button" onClick="closeWinLogSign()" value="Never Mind" />
					<p id="error"></p>
				</div>
				</form>
			</div>
			<!-- End of sign up Dialog -->

			<div id="Con-Id">
				<form action="CodeConfirm" id="CodeConfirmform" method="post">
					<input type="hidden" name="code" id="code" value="${requestScope.code}">
					<p>Confirmation Code is sent to your Email Id</p>
					<input type="text" name="confirm-code" id="code"
						placeholder="Confirmation Code" required /> 
						<br> 
					<input type="submit" value="Confirm!!" /> 
					<input type="button" onClick="closeWinLogSign()" value="Never Mind" />
					<p id="confstatus"></p>
				</form>
			</div>
	
			<!-- Start of Log up Dialog -->
			<div id="LogInBox" class="window">
				<form action="LoginAction" id="loginform" method="post">
					<div class="d-header">
						<h2>Log In To Continue With CPU</h2>
						<ul>
							<li><input type="email" name="emailId" id="email"
									value="arpitmantri@gmail.com"
									pattern='[^@]+@[^@]+\.[a-zA-Z]{2,}'
									placeholder="Registered Email Address" required /> 
								<input type="password" name="password" placeholder="Password" required
									value="arpit" />
							</li>
						</ul>
						<input type="submit" value="Log In" /> <input type="button"
							onClick="closeWinLogSign()" value="Never Mind" />

						<div id="linksdiv">
							<a href="javascript:void();" onClick="ForgotPass()">Forgot
								Password</a> 
							<a href="javascript:void();" onClick="Register()">Create
								Account</a>
						</div>

						<p id="error"></p>
					</div>
				</form>
			</div>
			<!-- End of Log up Dialog -->
			
			<!-- Start of FP Box Dialog -->
			<div id="FPassBox" class="window">
				<form action="ForgotPass" id="FPassform" method="post">
					<div class="d-header">
						<h2>Please Provide Your Registered Email Id</h2>
						<ul>
							<li><input type="email" name="email" id="email" value="arpitmantri@gmail.com"
								pattern='[^@]+@[^@]+\.[a-zA-Z]{2,}'
								placeholder="Registered Email Address" required/>
							</li>
						</ul>
						<input type="submit" id="FPSubmit" value="Send OTP" /> 
						<input type="button" onClick="closeWinLogSign()" value="Never Mind" />	
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
								<input type="password" name="oldpass" placeholder="Old Password" required value="arpit"/>
							</li>
							<li>
								<input type="password" name="newpass" placeholder="New Password" required value="arpit"/>
							</li>
							<li>
								<input type="password" name="newconpass" placeholder="Conirm Password" required value="arpit"/>
							</li>
						</ul>
						<input type="submit" value="Confirm" /> 
						<input type="button" onClick="closeWinLogSign()" value="Never Mind" />	
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
			<div id="home-mask"></div>
			<!-------------------------------------------------------------------------------------------------------- -->


		</div>
	</div>

</body>
</html>