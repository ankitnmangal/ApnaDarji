<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png"  href="resources/favicon.png"/>
<link rel="stylesheet" type="text/css" href="LoginCheck.css">
<!-- <link rel="import" href="NavBar.jsp"> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LogIn/SignUp</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/ext-core/3.1.0/ext-core.js"></script>

</head>


<body>
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '623743327768102',
      xfbml      : true,
      version    : 'v2.5'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
	<div id="nav-bar-include">
		<s:include value="NavBar.jsp"></s:include>
	</div>
	<div id="AD-outer-box">
		<div id="log-Sign-Box" class="inline-div super-box">
			<div id="head-text">
				<p>
					<b>LOGIN/SIGN UP</b>
				</p>
			</div>
			<div id="log-sign">
				<input type="submit" onClick="Login()" id="LogInSubmit" value="LOG IN" />
				<input type="submit"  onClick="Register()" id="LogInSubmit" value="SIGN UP" />
			</div>
			<div id="AD-fb-goog">
				<p>OR</p>
				<br>
				<input type="submit" id="LogInFB"  value="Login With Facebook"/>
				<br>
				<input type="submit" id="LogInGoog" value="Login With Google"/>
			</div>
		</div>
		<div id="seperator" class="inline-div">
			<div class="line">
			</div>
		</div>
		<div id="AD-guest-box" class="inline-div super-box">
			<div id="head-text">
				<p>
					<b>CONTINUE AS GUEST</b>
				</p>
			</div>
			<div id="AD-Guest-User">
				<input type="tel" maxlength="10" name="phNo"
							pattern='[789][0-9]{9}'
							placeholder="Phone Number" required /> 
							<br>
				<input type="email" name="email" pattern='[^@]+@[^@]+\.[a-zA-Z]{2,}'
							placeholder='Email Id'
							 required />
							 <br>
				<input type="submit" id="SendOTP" value="Send OTP"/>
			</div>
		</div>
	</div>

</body>
</html>