<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png"  href="resources/favicon.png"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ApnaDarji</title>
<link rel="stylesheet" type="text/css" href="Details.css">
<!-- <link rel="import" href="NavBar.jsp"> -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript" language="javascript">


	$(document).ready(
			function() {
				
			        function GetParameterValues(param) 
			        {  
			            var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');  
			            for (var i = 0; i < url.length; i++)
			            {  
			                var urlparam = url[i].split('=');  
			                if (urlparam[0] == param) {  
			                    return urlparam[1];  
			                }  
			            }  
			        }   
			        var id = GetParameterValues('id');  
			        var tabnum = id.substring(2,3);
			       	
			    	$(".detail-content").removeClass("show-detail-content");
					$("#" +  $("#detailing-header-tabs li:nth-child("+tabnum+")").attr('id') + "-details").addClass("show-detail-content");

					$(".yellow-line").removeClass("selected-tab-line");
					 $("#detailing-header-tabs li:nth-child("+tabnum+")").children('span').addClass("selected-tab-line");
					 
					$(".tabs").removeClass("selected-tab");
					 $("#detailing-header-tabs li:nth-child("+tabnum+")").addClass("selected-tab");
					
				$('.tabs').click(
						function() {
							$(".detail-content").removeClass("show-detail-content");
							$("#" + $(this).attr('id') + "-details").addClass("show-detail-content");
							$(".yellow-line").removeClass("selected-tab-line");
							$(this).children('span').addClass("selected-tab-line");
							$(".tabs").removeClass("selected-tab");
							$(this).addClass("selected-tab");
							$('html,body').animate({
														scrollTop : 0
													}, 'slow');

						});
				$('.que').click(function(){
					$(this).parent('.que-ans').children('.ans').slideToggle(500);
					$(this).children('img').toggleClass('img-clicked');
					
				});

			});
</script>
</head>

<body>
	<div id="nav-bar-include">
		<s:include value="NavBar.jsp"></s:include>
	</div>
	<div id="detail-page">
		<ul id="detailing-header-tabs">
			<li class="tabs selected-tab" id="about-us">
				<span class="yellow-line selected-tab-line"></span> ABOUT APNADARJI
			</li>
			<li class="tabs" id="contact-us">
				<span class="yellow-line"></span> CONTACT
			</li>
			<li class="tabs" id="how-it-works">
				<span class="yellow-line"></span> HOW IT WORKS
			</li>
			<li class="tabs" id="FAQ">
				<span class="yellow-line"></span>FAQ
			</li>
			<li class="tabs" id="privacy-policy">
				<span class="yellow-line"></span> PRIVACY POLICY
			</li>
			<li class="tabs" id="terms">
				<span class="yellow-line"></span> TERMS AND CONDITIONS
			</li>
			<li class="tabs" id="vendors-code">
				<span class="yellow-line"></span> VENDORS CODE OF CONDUCT
			</li>
		</ul>
		<div class="detail-content show-detail-content"  id="about-us-details" >
			<h2>ABOUT US</h2>
		</div>
		<div class="detail-content" id="contact-us-details">
			<h2>CONTACT US</h2>
		</div>
		<div class="detail-content" id="how-it-works-details">
			<h2>HOW IT WORKS</h2>
		</div>
		
		<div class="detail-content" id="FAQ-details">
			<h2>FREQUENTLY ASKED QUESTIONS</h2>
			<div id="faq-div">
				<ul>
					<li class="que-ans">
						<div id="que1-div" class="que">
							<img src="resources/plus.png">
							<h3 id="que1">
								what is your name and your age and your last name  ?
							</h3>
						</div>
					
						<div id="ans1" class="ans">
							<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne oinweiofnwioefn winefiowenf udbfiusdb fiusbdf sfsbudfiusbdfiusbdfuib</p>
						</div>
					</li>
					<li class="que-ans">
						<div id="que1-div" class="que">
							<img src="resources/plus.png">
							<h3 id="que1">
								what is your name and your age and your last name  ?
							</h3>
						</div>
					
						<div id="ans1" class="ans">
							<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne oinweiofnwioefn winefiowenf udbfiusdb fiusbdf sfsbudfiusbdfiusbdfuib</p>
						</div>
					</li>
					
					<li class="que-ans">
						<div id="que1-div" class="que">
							<img src="resources/plus.png">
							<h3 id="que1">
								what is your name and your age and your last name  ?
							</h3>
						</div>
					
						<div id="ans1" class="ans">
							<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne oinweiofnwioefn winefiowenf udbfiusdb fiusbdf sfsbudfiusbdfiusbdfuib</p>
						</div>
					</li>
					
					<li class="que-ans">
						<div id="que1-div" class="que">
							<img src="resources/plus.png">
							<h3 id="que1">
								what is your name and your age and your last name  ?
							</h3>
						</div>
					
						<div id="ans1" class="ans">
							<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne oinweiofnwioefn winefiowenf udbfiusdb fiusbdf sfsbudfiusbdfiusbdfuib</p>
						</div>
					</li>
					
					<li class="que-ans">
						<div id="que1-div" class="que">
							<img src="resources/plus.png">
							<h3 id="que1">
								what is your name and your age and your last name  ?
							</h3>
						</div>
					
						<div id="ans1" class="ans">
							<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne oinweiofnwioefn winefiowenf udbfiusdb fiusbdf sfsbudfiusbdfiusbdfuib</p>
						</div>
					</li>
					
					<li class="que-ans">
						<div id="que1-div" class="que">
							<img src="resources/plus.png">
							<h3 id="que1">
								what is your name and your age and your last name  ?
							</h3>
						</div>
					
						<div id="ans1" class="ans">
							<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne oinweiofnwioefn winefiowenf udbfiusdb fiusbdf sfsbudfiusbdfiusbdfuib</p>
						</div>
					</li>
					
					<li class="que-ans">
						<div id="que1-div" class="que">
							<img src="resources/plus.png">
							<h3 id="que1">
								what is your name and your age and your last name  ?
							</h3>
						</div>
					
						<div id="ans1" class="ans">
							<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne oinweiofnwioefn winefiowenf udbfiusdb fiusbdf sfsbudfiusbdfiusbdfuib</p>
						</div>
					</li>
					
					<li class="que-ans">
						<div id="que1-div" class="que">
							<img src="resources/plus.png">
							<h3 id="que1">
								what is your name and your age and your last name  ?
							</h3>
						</div>
					
						<div id="ans1" class="ans">
							<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne oinweiofnwioefn winefiowenf udbfiusdb fiusbdf sfsbudfiusbdfiusbdfuib</p>
						</div>
					</li>
					
					<li class="que-ans">
						<div id="que1-div" class="que">
							<img src="resources/plus.png">
							<h3 id="que1">
								what is your name and your age and your last name  ?
							</h3>
						</div>
					
						<div id="ans1" class="ans">
							<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne oinweiofnwioefn winefiowenf udbfiusdb fiusbdf sfsbudfiusbdfiusbdfuib</p>
						</div>
					</li>
					
					<li class="que-ans">
						<div id="que1-div" class="que">
							<img src="resources/plus.png">
							<h3 id="que1">
								what is your name and your age and your last name  ?
							</h3>
						</div>
					
						<div id="ans1" class="ans">
							<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne oinweiofnwioefn winefiowenf udbfiusdb fiusbdf sfsbudfiusbdfiusbdfuib</p>
						</div>
					</li>
					
				</ul>
		</div>
		</div>
		<div class="detail-content" id="privacy-policy-details">
			<h2>PRIVACY POLICY</h2>
		</div>
		<div class="detail-content" id="terms-details">
			<h2>TERMS AND CONDITIONS</h2>
		</div>
		<div class="detail-content" id="vendors-code-details">
			<h2>VENDOR CODE OF CONDUCT FOR SOCIAL COMPLIANCE & ETHICAL
				STANDARDS</h2>
		</div>
	</div>
</body>
</html>