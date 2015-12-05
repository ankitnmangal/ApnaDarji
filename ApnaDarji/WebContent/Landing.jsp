<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="icon" type="image/png"  href="resources/favicon.png"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="Landing.css">
<!-- <link rel="import" href="NavBar.jsp"> -->
<title>Apna Darji</title>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="javas/global.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
<div id="temp"></div>
	<div id="nav-bar-include">
		<s:include value="NavBar.jsp"></s:include>
	</div>

	<div id="slider-box">
		<div id="slider" class="inline-items"></div>
		<!-- 			<div id="quote-div"> -->
		<!-- 				<p> -->
		<!-- 					 If you are out to describe the truth, leave elegance to the tailor. -->
		<!-- 				</p> -->
		<!-- 			</div>	 -->
	</div>


	<div class="page-box">
		<div id="linker-box">
			<ul id="linker-box-ul">
				<a href='FabricDisplayAction' onclick="ShowLoader()">
					<li id="linker-box-li1" class="linker-box-li">
						<div id="linker-box-bottom-name">
							<p id="box-purpose-name">Men's Formal Shirts Fabrics</p>
						</div>
						<div id="linker-details"></div>
					</li>
				</a>
				<a href='FabricDisplayAction' onclick="ShowLoader()">
					<li id="linker-box-li2" class="linker-box-li">
						<div id="linker-box-bottom-name" >
							<p id="box-purpose-name" >Men's Formal Trouser Fabrics</p>
						</div>
						<div id="linker-details"></div>
					</li>
				</a>
			</ul>
			<ul id="linker-box-ul">
				<a href='FabricDisplayAction' onclick="ShowLoader()">
					<li id="linker-box-li3" class="linker-box-li">
						<div id="linker-box-bottom-name">
							<p id="box-purpose-name">All Fabrics</p>
						</div>
						<div id="linker-details"></div>
					</li>
				</a>
				<a href='FabricDisplayAction' onclick="ShowLoader()">
					<li id="linker-box-li4" class="linker-box-li">
						<div id="linker-box-bottom-name">
							<p id="box-purpose-name">Others</p>
						</div>
						<div id="linker-details"></div>
					</li>
				</a>
			</ul>
		</div>
	</div>
	<div id="how-it-works">
		<p>How It Works</p>
		<div id="how-it-works-img-div">
			<div class="arrow">
				<img src="resources/arrow.png">
			</div>
			<div id="how-it-works-img-inline-div1"
				class="inline-items how-it-works-img-inline-div">
				<img alt="Choose" id="how-it-works-img" src="resources/choose.png">
				<br> <abbr>CHOOSE</abbr>
				<h1 id="how-it-works-text">Something goes here for Choosing.</h1>
			</div>
			<div id="how-it-works-img-inline-div2"
				class="inline-items how-it-works-img-inline-div">
				<img alt="Choose" id="how-it-works-img"
					src="resources/customize.png"> <br> <abbr>CUSTOMIZE</abbr>
				<h1 id="how-it-works-text">Something goes here for
					customization........</h1>
			</div>
			<div id="how-it-works-img-inline-div3"
				class="inline-items how-it-works-img-inline-div">
				<img alt="Choose" id="how-it-works-img" src="resources/measured.png">
				<br> <abbr>GET MEASURED</abbr>
				<h1 id="how-it-works-text">Something goes here
					measurement........</h1>
			</div>
			<div id="how-it-works-img-inline-div4"
				class="inline-items how-it-works-img-inline-div">
				<img alt="Choose" id="how-it-works-img"
					src="resources/manufacture.png"> <br> <abbr>MANUFACTURED</abbr>
				<h1 id="how-it-works-text">Something goes here for
					Manufacturing........</h1>
			</div>
			<div id="how-it-works-img-inline-div5"
				class="inline-items how-it-works-img-inline-div">
				<img alt="Choose" id="how-it-works-img" src="resources/deliver.png">
				<br> <abbr>DELIVERY ON TIME</abbr>
				<h1 id="how-it-works-text">Something goes here for
					delivery........</h1>
			</div>
		</div>
	</div>
	<div id="faq-div">
			<p>Frequently Asked Questions</p>
		<div class="faq-page-box">
			<ul>
				<li class="que-ans">
					<div id="que1-div" class="que">
						<img src="resources/plus.png">
						<h3 id="que1">what is your name and your age and your last
							name ?</h3>
					</div>
	
					<div id="ans1" class="ans">
						<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi
							oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne
							oinweiofnwioefn winefiowenf udbfiusdb fiusbdf
							sfsbudfiusbdfiusbdfuib</p>
					</div>
				</li>
				<li class="que-ans">
					<div id="que1-div" class="que">
						<img src="resources/plus.png">
						<h3 id="que1">what is your name and your age and your last
							name ?</h3>
					</div>
	
					<div id="ans1" class="ans">
						<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi
							oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne
							oinweiofnwioefn winefiowenf udbfiusdb fiusbdf
							sfsbudfiusbdfiusbdfuib</p>
					</div>
				</li>
				<li class="que-ans">
					<div id="que1-div" class="que">
						<img src="resources/plus.png">
						<h3 id="que1">what is your name and your age and your last
							name ?</h3>
					</div>
	
					<div id="ans1" class="ans">
						<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi
							oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne
							oinweiofnwioefn winefiowenf udbfiusdb fiusbdf
							sfsbudfiusbdfiusbdfuib</p>
					</div>
				</li>
				<li class="que-ans">
					<div id="que1-div" class="que">
						<img src="resources/plus.png">
						<h3 id="que1">what is your name and your age and your last
							name ?</h3>
					</div>
	
					<div id="ans1" class="ans">
						<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi
							oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne
							oinweiofnwioefn winefiowenf udbfiusdb fiusbdf
							sfsbudfiusbdfiusbdfuib</p>
					</div>
				</li>
				<li class="que-ans">
					<div id="que1-div" class="que">
						<img src="resources/plus.png">
						<h3 id="que1">what is your name and your age and your last
							name ?</h3>
					</div>
	
					<div id="ans1" class="ans">
						<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi
							oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne
							oinweiofnwioefn winefiowenf udbfiusdb fiusbdf
							sfsbudfiusbdfiusbdfuib</p>
					</div>
				</li>
				<li class="que-ans">
					<div id="que1-div" class="que">
						<img src="resources/plus.png">
						<h3 id="que1">what is your name and your age and your last
							name ?</h3>
					</div>
	
					<div id="ans1" class="ans">
						<p>my name is arpit lihio hio hoihoih oihoi h uidsbhfsi
							oiewfjwo wiojf wiojf wfiowenfiownefionw weofnoiwnefio wnne
							oinweiofnwioefn winefiowenf udbfiusdb fiusbdf
							sfsbudfiusbdfiusbdfuib</p>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<div id="service-satisfying-item-box">
		<div id="service-satisfying-item1" class="service-satisfying-item">
		</div>
		<div id="service-satisfying-item2" class="service-satisfying-item">
		</div>
		<div id="service-satisfying-item3" class="service-satisfying-item">
		</div>
	</div>
	<div id="fotter"></div>
</body>
</html>