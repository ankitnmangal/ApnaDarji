<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png"  href="resources/favicon.png"/>
<link rel="stylesheet" type="text/css" href="addToCart.css">
<!-- <link rel="import" href="NavBar.jsp"> -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">

	$(document).ready(function() {
		$('#nav-bar-include').load('NavBar.jsp');
	});
</script>
</head>
<body>
	<div id="nav-bar-include"></div>
	<div id="prd-conatainer">
		<div id="prd-img-cont">
			<img class="floating-arw" src="resources/arrowleft.png" /> 
			<img id="obj-img" src="resources/mario1.jpg" 
				 onmouseover="this.src='resources/mario2.jpg'"
				 onmouseout="this.src='resources/mario3.jpg'" /> 
			<img class="floating-arw" src="resources/arrowright.png" />
		</div>
		<div id="prd-info-cont">
			<div id="prd-content1" class="prd-info-child-cont">
				<span>Brand</span> <br>
				<span>Cloth Details</span> <br> 
				<span> <strike>$345</strike></span>
				&nbsp;&nbsp;<span>$245</span> 
				&nbsp;&nbsp;<span style="color: red;">(-25%)</span><br>
				<input type="button" value="COUPONS" />
			</div>
			<div id="prd-content2" class="prd-info-child-cont">
				<span>Select Color</span>
				<div id="clr-box-div">
					<div class="clr-box"></div>
					<div class="clr-box"></div>
				
				</div>
			</div>
			<div id="prd-content3" class="prd-info-child-cont">
				<input type="button" value="BUY NOW" /> <br> 
				<input type="button" value="ADD TO CART" /> <br>
				<input type="button" value="SAVE FOR LATER" />
			</div>
		</div>
	</div>

</body>
</html>