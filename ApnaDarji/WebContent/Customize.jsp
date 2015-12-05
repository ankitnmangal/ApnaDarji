<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="resources/favicon.png" />
<link rel="stylesheet" type="text/css" href="quickview.css">
<link href="Customize/css/Customize.css" rel="stylesheet" type="text/css">
<link href="Customize/css/bootstrap1.css" rel="stylesheet" />
<link href="Customize/css/font-awesome.css" rel="stylesheet" />
<link href="Customize/css/accordian.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="Customize/js/owl.carousel.js"></script>
<script>
	jQuery(document).ready(function($) {
		$('#fabrics-home-mask').click(function() {
			$(this).fadeOut(500);
			$('#prd-container').hide(0);
		});
		var post_slider = $(".slider-blog");
		post_slider.owlCarousel({
			responsive : {
				0 : {
					items : 1
				},
				480 : {
					items : 2
				},
				768 : {
					items : 3
				},
				992 : {
					items : 4
				},
				1200 : {
					items : 5
				}
			},
			autoplay : false,
			loop : true,
			nav : true,
			dots : false,
			autoplaySpeed : 500,
			navSpeed : 500,
			dotsSpeed : 500,
			autoplayHoverPause : true,
			margin : 30,
		});
	});
// 	<div id="temp-prd-container">
// 	<div id="temp-prd-img-cont" style="display: inline-block;">
// 		<img id="temp-obj-img" onClick="QuickView(this)" src='<s:property value="prod.prdImg"/>' /> 
// 	</div>
// 	<div id="temp-prd-info-cont" style="display: inline-block;">
// 		<div id="temp-prd-content1" class="temp-prd-info-child-cont">
// 			<h3 id="temp-qv-prodDesc"><s:property value="prod.prodDesc"/></h3>
// 			<span id="temp-qv-fabQuality"><s:property value="prod.fabric_Quality_Type"/> </span>
// 			 <span id="temp-qv-material"><s:property value="prod.materialType"/> </span><br>
// 			<span class="temp-qv-price"> End Product Price:<b> &#x20B9;<s:property value="prod.prodPrice" /></b></span>
// 			<span class="temp-price-with-disc"><strike> &#x20B9;<b><s:property value="%{#attr.discPlusPrice}" /></b></strike></span>
// 			<span class="temp-qv-discount-prcnt">(-25%)</span>
// 			<p class="temp-qv-stock">
// 			<s:if test="prod.inStock == 'Y'">
// 				IN STOCK
// 			</s:if>
// 			<s:else>
// 				OUT OF STOCK
// 			</s:else>
// 		</p>
// 		</div>
	
	function QuickView(obj) {
		$('#prd-container').children('#prd-img-cont').children('#obj-img')
				.prop('src',$(obj).attr('src'));
		
		$('#prd-container').children('#prd-info-cont').children('#prd-content1').children('#qv-prodDesc')
				.text($(obj).parent().parent('#temp-prd-container').children('#temp-prd-info-cont')
				  					.children('#temp-prd-content1').children('#temp-qv-prodDesc').text());
	
		$('#prd-container').children('#prd-info-cont').children('#prd-content1').children('#qv-fabQuality')
				.text($(obj).parent().parent('#temp-prd-container').children('#temp-prd-info-cont')
	  					.children('#temp-prd-content1').children('#temp-qv-fabQuality').text());
		
		$('#prd-container').children('#prd-info-cont').children('#prd-content1').children('#qv-material')
				.text($(obj).parent().parent('#temp-prd-container').children('#temp-prd-info-cont')
	  					.children('#temp-prd-content1').children('#temp-qv-material').text());
	
		$('#prd-container').children('#prd-info-cont').children('#prd-content1').children('#qv-price')
				.text($(obj).parent().parent('#temp-prd-container').children('#temp-prd-info-cont')
	  					.children('#temp-prd-content1').children('.temp-qv-price').text() 
// 	  					+ $(obj).parent().parent('#temp-prd-container').children('#temp-prd-info-cont')
// 	  					.children('#temp-prd-content1').children('.temp-price-with-disc').text() 
// 	  					+$(obj).parent().parent('#temp-prd-container').children('#temp-prd-info-cont')
// 	  					.children('#temp-prd-content1').children('.temp-qv-discount-prcnt').text()
					);
		
		$('#prd-container').children('#prd-info-cont').children('#prd-content1').children('#qv-stock')
				.text($(obj).parent().parent('#temp-prd-container').children('#temp-prd-info-cont')
	  					.children('#temp-prd-content1').children('.temp-qv-stock').text());
// 		alert($(obj).parent().parent('.prd').children('#prd_id').attr('value')); 
		$('#prd-container').children('#prd-info-cont').children('#prd-content3').children('form')
				.children('#qv-prd_id').prop('value',$(obj).parent().parent('.prd').children('#prd_id').attr('value'));
		
		// alert($(obj).parent('.cstmz-ovrw-div').parent('.prd').children('.prd-img').children('img').attr('src'));
		var id = $("#prd-container");
		//Get the window height and width 
		var winH = $(window).height();
		var winW = $(window).width();

		//Set the popup window to center
		$(id).css('top', winH / 2 - $(id).height() / 2);
		// 					$(id).css('left', winW / 2 - $(id).width() / 2);

		//transition effect
		$(id).fadeIn(1000);

		//Get the screen height and width
		var maskHeight = $(document).height();
		var maskWidth = $(document).width();

		//Set heigth and width to fabrics-home-mask to fill up the whole screen
		$('#fabrics-home-mask').css({
			'width' : maskWidth,
			'height' : maskHeight,
			'z-index' : '999999999'
		});
		$('#fabrics-home-mask').fadeTo("slow", 0.7);

	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customize</title>
</head>
<body>
	<s:set var="discount" value=".75"/>
	<s:set var="discPlusPrice" value="prod.prodPrice / #discount" />
	<div id="nav-bar-include">
		<s:include value="NavBar.jsp"></s:include>
	</div>
	
	<!-- 	<div id="main-prd-container"> -->
	<!-- 		<div id="prd-img-cont"> -->
	<!-- 			<img id="obj-img" src=""/> -->
	<!-- 		</div> -->
	<!-- 		<div id="prd-info-cont"> -->
	<!-- 			<div id="prd-content1" class="prd-info-child-cont"> -->
	<%-- 				<span>Brand</span> <br> <span>Cloth Details</span> --%>
	<!-- 			</div> -->
	<!-- 			<div id="prd-content2" class="prd-info-child-cont"> -->

	<%-- 				<span>COLOR </span> --%>
	<!-- 				<div id="clr-box-div"> -->
	<!-- 					<div class="clr-box"></div> -->
	<!-- 					<div class="clr-box"></div> -->
	<!-- 					<div class="clr-box"></div> -->
	<!-- 					<div class="clr-box"></div> -->
	<!-- 					<div class="clr-box"></div> -->
	<!-- 					<div class="clr-box"></div> -->
	<!-- 					<div class="clr-box"></div> -->
	<!-- 					<div class="clr-box"></div> -->
	<!-- 					<div class="clr-box"></div> -->
	<!-- 					<div class="clr-box"></div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div id="prd-content3" class="prd-info-child-cont"> -->
	<!-- 				<input type="button" value="CHECKOUT" /> <br>  -->
	<!-- 				<input type="button" value="SAVE FOR LATER" /> -->

	<!-- 			</div> -->

	<!-- 		</div> -->
	<!-- 	</div> -->
		<!-- -------------------------------------quickView Popup---------------------------------------------------- -->

	<div id="prd-container" style="background-color: black;">
		
		<div id="prd-img-cont" style="background-color: black;">
			<img class="floating-arw" src="resources/arrowleft.png" /> 
			<img id="obj-img" src="resources/mario1.jpg" style="background-color: black;"/> 
			<img class="floating-arw" src="resources/arrowright.png" />
		</div>
		<div id="prd-info-cont" style="background-color: black;">
			<div id="prd-content1" class="prd-info-child-cont">
				<h3 id="qv-prodDesc" style="color: white;">Product Desc</h3>
				 <span id="qv-fabQuality" style="color: white;">Type: delux </span> 
				 <span id="qv-material" style="color: white;">Material: cotton</span> 
				 <h3 id="qv-price" style="color: white;">price</h3>
				 <h3 id="qv-stock">in stock</h3>
			</div>
			<!-- 			<div id="prd-content2" class="prd-info-child-cont"> -->
			<%-- 				<span>COLOR </span> --%>
			<!-- 				<div id="clr-box-div"> -->
			<!-- 					<div class="clr-box"></div> -->
			<!-- 					<div class="clr-box"></div> -->
			<!-- 					<div class="clr-box"></div> -->
			<!-- 					<div class="clr-box"></div> -->
			<!-- 					<div class="clr-box"></div> -->
			<!-- 					<div class="clr-box"></div> -->
			<!-- 					<div class="clr-box"></div> -->
			<!-- 					<div class="clr-box"></div> -->
			<!-- 					<div class="clr-box"></div> -->
			<!-- 					<div class="clr-box"></div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div id="prd-content3" class="prd-info-child-cont">
<!-- 				<form action="CustomizationAction" method='post'> -->
					<input id="qv-prd_id" type="hidden" value="" name="prodId">
<!-- 					<input type="submit" value="CUSTOMIZE" /> <br>  -->
				<input type="button" value="SAVE FOR LATER" />
<!-- 				</form> -->
			</div>

		</div>
	</div>
<!-- ----------------------------------------------------quick view endss.... -->

	
	<div class="temp-prd-info-child-cont">
		<div id="others">
			<div id="temp-prd-container">
				<div id="temp-prd-img-cont" style="display: inline-block;">
					<img id="temp-obj-img" onClick="QuickView(this)" src='<s:property value="prod.prdImg"/>' /> 
				</div>
				<div id="temp-prd-info-cont" style="display: inline-block;">
					<div id="temp-prd-content1" class="temp-prd-info-child-cont">
						<h3 id="temp-qv-prodDesc"><s:property value="prod.prodDesc"/></h3>
						<span id="temp-qv-fabQuality"><s:property value="prod.fabric_Quality_Type"/> </span>
						 <span id="temp-qv-material"><s:property value="prod.materialType"/> </span><br>
						<span class="temp-qv-price"> End Product Price:<b> &#x20B9;<s:property value="prod.prodPrice" /></b></span>
						<span class="temp-price-with-disc"><strike> &#x20B9;<b><s:property value="%{#attr.discPlusPrice}" /></b></strike></span>
						<span class="temp-qv-discount-prcnt">(-25%)</span>
						<p class="temp-qv-stock">
						<s:if test="prod.inStock == 'Y'">
							IN STOCK
						</s:if>
						<s:else>
							OUT OF STOCK
						</s:else>
					</p>
					</div>
					<!-- 			<div id="prd-content2" class="prd-info-child-cont"> -->
					<%-- 				<span>COLOR </span> --%>
					<!-- 				<div id="clr-box-div"> -->
					<!-- 					<div class="clr-box"></div> -->
					<!-- 					<div class="clr-box"></div> -->
					<!-- 					<div class="clr-box"></div> -->
					<!-- 					<div class="clr-box"></div> -->
					<!-- 					<div class="clr-box"></div> -->
					<!-- 					<div class="clr-box"></div> -->
					<!-- 					<div class="clr-box"></div> -->
					<!-- 					<div class="clr-box"></div> -->
					<!-- 					<div class="clr-box"></div> -->
					<!-- 					<div class="clr-box"></div> -->
					<!-- 				</div> -->
					<!-- 			</div> -->
					

				</div>
			</div>
		</div>
		<div id="temp-prd-content-button">
			<input type="button" value="CHECKOUT"/>
			 <br> <input type="button" value="ADD TO CART"/>
			 <br> <input type="button" value="SAVE FOR LATER"/>
		</div>
	</div>
	<div id="choose-style-title">
		<h2>DESIGN YOURSELF</h2>
	</div>

	<div id="style-list-slider-div">
		<div class="slider-latest-blog homestyle1">
			<div id="messages_product_view"></div>
			<div class="slider-blog products-grid latest-post">
				<div class="item">
					<div class="item-inner">
						<div class="box-image">
							<div class="effect-default">
								<a class="product-image" href="#" title=""> <img src=""
									alt="">
								</a>
							</div>
							<div class="pro-grid animated bounceIn">
								<div class="viewproduct">
									<a href="#">SELECT</a>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="item">
					<div class="item-inner">
						<div class="box-image">
							<div class="effect-default">
								<a class="product-image" href="#" title=""> <img src=""
									alt="">
								</a>
							</div>
							<div class="pro-grid animated bounceIn">
								<div class="viewproduct">
									<a href="#">SELECT</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="item">
					<div class="item-inner">
						<div class="box-image">
							<div class="effect-default">
								<a class="product-image" href="#" title=""> <img src=""
									alt="">
								</a>
							</div>
							<div class="pro-grid animated bounceIn">
								<div class="viewproduct">
									<a href="#">SELECT</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="item">
					<div class="item-inner">
						<div class="box-image">
							<div class="effect-default">
								<a class="product-image" href="#" title=""> <img src=""
									alt="">
								</a>
							</div>
							<div class="pro-grid animated bounceIn">
								<div class="viewproduct">
									<a href="#">SELECT</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="item-inner">
						<div class="box-image">
							<div class="effect-default">
								<a class="product-image" href="#" title=""> <img src=""
									alt="">
								</a>
							</div>
							<div class="pro-grid animated bounceIn">
								<div class="viewproduct">
									<a href="#">SELECT</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--slider blog start here -->
	</div>
	<div class="col-lg-12 slidersection">
		<div class="thumbproduct col-lg-12">
			<div class="row">
				<div class="thumbitem">
					<a class="" href="#" title=""> <img src="resources/collar.png"
						alt="">
					</a>
				</div>
				<div class="thumbitem">
					<a class="" href="#" title=""> <img src="" alt="">
					</a>
				</div>

				<div class="thumbitem">
					<a class="" href="#" title=""> <img src="" alt="">
					</a>
				</div>

				<div class="thumbitem">
					<a class="" href="#" title=""> <img src="" alt="">
					</a>
				</div>


				<div class="thumbitem">
					<a class="" href="#" title=""> <img src="" alt="">
					</a>
				</div>

				<div class="thumbitem">
					<a class="" title=""> <img src="" alt="">
					</a>
				</div>

				<div class="thumbitem">
					<a class="" href="#" title=""> <img src="" alt="">
					</a>
				</div>

				<div class="thumbitem">
					<a class="" href="#" title=""> <img src="" alt="">
					</a>
				</div>
			</div>
		</div>
	</div>
<div id="fabrics-home-mask"></div>
</body>
</html>