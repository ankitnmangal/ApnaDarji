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
//function loginSubmit(event) {
//	 event.preventDefault();
//			 $('#loader-mask').show();
//				$.ajax({
//					type : $('#loginform').attr('method'),
//					url : $('#loginform').attr('action'),
//					data : $('#loginform').serialize(),
//					success : function(data) {
//						$('#loader-mask').hide();
//						var result  = $.trim(""+data);
//						if(result == "success")
//						{
//							$('#loginform').children('.d-header').children('#error').text('Login Confirmed');
//							location.reload();
//						}
//						else{
//								$('#loader-mask').hide();
//								$('#loginform').children('.d-header').children('#error').text(data);
//						}
//					}
//				});
//		 return false;
//}

//function SubmitSignUp(){
////				alert("here");
////				document.getElementById("signUpSubmit").disabled = true;
//				$('#loader-mask').show();
//				$.ajax({
//					type : $('#signupform').attr('method'),
//					url : $('#signupform').attr('action'),
//					data : $('#signupform').serialize(),
//					success : function(data) {
//						var result = $.trim(""+data);
//						$('#loader-mask').hide();
////						alert("test");
//						if (result == "success") 
//						{
//							
//							$('#SignUpBox').fadeOut(1000);
//							document.getElementById("signUpSubmit").disabled = false;
//							var idc = $("#Con-Id");
//							var winH = $(window).height();
//							var winW = $(window).width();
//							//Set the popup window to center
//							$(idc).css('top', winH / 3 - $(idc).height() / 2);
//							$(idc).css('left', winW / 2.2 - $(idc).width() / 2);
//							
//							$(idc).fadeIn(1200);
//							sessTime = 5;
//							document.getElementById('confstatus').innerHTML = "Your Session will timeout in "
//									+ sessTime + " Minutes.";
//
//							if (sessTime > 0) {
//								window.setTimeout(SessCount, 6000);
//								window.setTimeout(TimeCount, 6000);
//							}
//						}
//						else 
//						{
//							document.getElementById("signUpSubmit").disabled = false;
//							$('#signupform').children('.d-header').children('#error').text(result);
//							
//						}
//
//					}
//
//				});
//				return false;
//			}

	function SessCount() {
		sessTime = sessTime - 1;
		if (sessTime > 0) {
			window.setTimeout(SessCount, 60000);
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
				window.setTimeout(TimeCount, 10000);
			}
		}
	}
	
//	var CodeConfirmform = $('#CodeConfirmform');
//	CodeConfirmform.submit(function() {
//				$.ajax({
//							type : CodeConfirmform.attr('method'),
//							url : CodeConfirmform.attr('action'),
//							data : CodeConfirmform.serialize(),
//							success : function(data) 
//							{
//								var result = data;
//								if (result == "session") 
//									{
//										sessTime = -1;
//										$('#code').val(null);
//										var id = $("#welcome-dialog");
//										var winH = $(window).height();
//										var winW = $(window).width();
//										//Set the popup window to center
//										$(id).css('top', winH / 2.3 - $(id).height() / 2);
//										$(id).css('left', winW / 2 - $(id).width() / 2);
//										document.getElementById('wel-head').innerHTML = "Welcome Arpit!!";
//										$('#home-mask').fadeOut(1000);
//										$('#Con-Id').fadeOut(1000);
//										$(id).fadeIn(1200);
//										$(id).fadeOut(1200);
//										$('#userNamep').fadeIn(0);
//										document.getElementById('userNamep').innerHTML = "Hi Arpit";
//										$('#home-enrl-crse-icon, #home-chng-pass-icon, #home-log-out-icon').fadeIn(0);
//	
//									} 
//								else
//									{
//										document.getElementById('confstatus').innerHTML = result;
//									}
//							}
//						});
//				return false;
//			});
//	
//	var FPassform = $('#FPassform');
//	FPassform.submit(function() {
//				$.ajax({
//							type : FPassform.attr('method'),
//							url : FPassform.attr('action'),
//							data : FPassform.serialize(),
//							success : function(data) 
//							{
//								var result = data;
//								alert(result);
//								if (result == "Please check your email address") 
//								{
//									document.getElementById("FPSubmit").disabled = false;
//									document.getElementById('error').innerHTML = result;
//								}
//								else 
//								{
//									$('#FPassBox').fadeOut(1000);
//									document.getElementById("FPSubmit").disabled = false;
//									alert("hi");
//									var idc = $("#Con-Id");
//									var winH = $(window).height();
//									var winW = $(window).width();
//									//Set the popup window to center
//									$(idc).css('top', winH / 2.3 - $(idc).height() / 2);
//									$(idc).css('left', winW / 2 - $(idc).width() / 2);
//									$(idc).fadeIn(1200);
//									document.getElementById("code").value = result;
//									sessTime = 5;
//									document.getElementById('confstatus').innerHTML = "Your Session will timeout in "
//											+ sessTime + " Minutes.";
//		
//									if (sessTime > 0) 
//									{
//										window.setTimeout(SessCount, 6000);
//										window.setTimeout(TimeCount, 6000);
//									}
//								}
//		
//							}
//						});
//				return false;
//			});
//	

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
					$(id).css('top', winH / 2.1 - $(id).height() / 2);
					$(id).css('left', winW / 2 - $(id).width() / 2);

					//transition effect
					$(id).fadeIn(1000);

					//Get the screen height and width
					var maskHeight = $(document).height();
					var maskWidth = $(document).width();


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
			
					//transition effect		
					//$('#home-mask').fadeIn(1home-home-mask;
					$('#home-mask').fadeTo("slow", 0.7);
// 		}
// });
}
function HomeMaskClick() {
	$('#home-mask').hide();
	$('#SignUpBox').fadeOut(1000);
	
	$('#LogInBox').fadeOut(1000);
	$("#welcome-dialog").hide();
	$('#Con-Id').hide();
	$("#FPassBox").fadeOut(1000);
	$("#chngPassBox").fadeOut(1000);
	sessTime = -1;
	$('#code').val(null);
	document.getElementById("signUpSubmit").disabled = false;
};

$(window).resize(function() {

	var box = $('#boxes .window');

	//Get the screen height and width
	var maskHeight = $(document).height();
	var maskWidth = $(window).width();


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

	//transition effect		
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