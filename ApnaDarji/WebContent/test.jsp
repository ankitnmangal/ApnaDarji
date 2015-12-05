<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">

<script>
	$(document).ready(function() {
		$(".tab1 .single-bottom").hide();
		$(".tab2 .single-bottom").hide();
		$(".tab3 .single-bottom").hide();
		$(".tab4 .single-bottom").hide();
		$(".tab5 .single-bottom").hide();

		$(".tab1 ul").click(function() {
			$(".tab1 .single-bottom").slideToggle(300);
			$(".tab2 .single-bottom").hide();
			$(".tab3 .single-bottom").hide();
			$(".tab4 .single-bottom").hide();
			$(".tab5 .single-bottom").hide();
		})
		$(".tab2 ul").click(function() {
			$(".tab2 .single-bottom").slideToggle(300);
			$(".tab1 .single-bottom").hide();
			$(".tab3 .single-bottom").hide();
			$(".tab4 .single-bottom").hide();
			$(".tab5 .single-bottom").hide();
		})
		$(".tab3 ul").click(function() {
			$(".tab3 .single-bottom").slideToggle(300);
			$(".tab4 .single-bottom").hide();
			$(".tab5 .single-bottom").hide();
			$(".tab2 .single-bottom").hide();
			$(".tab1 .single-bottom").hide();
		})
		$(".tab4 ul").click(function() {
			$(".tab4 .single-bottom").slideToggle(300);
			$(".tab5 .single-bottom").hide();
			$(".tab3 .single-bottom").hide();
			$(".tab2 .single-bottom").hide();
			$(".tab1 .single-bottom").hide();
		})
		$(".tab5 ul").click(function() {
			$(".tab5 .single-bottom").slideToggle(300);
			$(".tab4 .single-bottom").hide();
			$(".tab3 .single-bottom").hide();
			$(".tab2 .single-bottom").hide();
			$(".tab1 .single-bottom").hide();
		})
	});
	$(window).load(
			function() {
				$("#slider-range").slider(
						{
							range : true,
							min : 0,
							max : 400000,
							values : [ 8500, 350000 ],
							slide : function(event, ui) {
								$("#amount").val(
										"$" + ui.values[0] + " - $"
												+ ui.values[1]);
							}
						});
				$("#amount").val(
						"$" + $("#slider-range").slider("values", 0) + " - $"
								+ $("#slider-range").slider("values", 1));

			});
</script>

</head>
<body>

	<div class="product-model">

		<div class="rsidebar span_1_of_left">
			<section class="sky-form">
			<div class="product_right">
				<h4 class="m_2">
					<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Categories
				</h4>
				<div class="tab1">
					<ul class="place">
						<li class="sort">Fashion</li>
						<li class="by"><img src="images/do.png" alt=""></li>
						<div class="clearfix"></div>
					</ul>
					<div class="single-bottom">
						<a href="#"><p>Gifts</p></a> <a href="#"><p>Flowers</p></a> <a
							href="#"><p>Shoes</p></a> <a href="#"><p>Suits</p></a> <a
							href="#"><p>Dresses</p></a>
					</div>
				</div>
				<div class="tab2">
					<ul class="place">
						<li class="sort">Women Ethnic Wear</li>
						<li class="by"><img src="images/do.png" alt=""></li>
						<div class="clearfix"></div>
					</ul>
					<div class="single-bottom">
						<a href="#"><p>Sarees & More</p></a> <a href="#"><p>Salwar
								Suits</p></a>
					</div>
				</div>
				<div class="tab3">
					<ul class="place">
						<li class="sort">Personal Care</li>
						<li class="by"><img src="images/do.png" alt=""></li>
						<div class="clearfix"></div>
					</ul>
					<div class="single-bottom">
						<a href="#"><p>Make Up</p></a>
					</div>
				</div>
				<div class="tab4">
					<ul class="place">
						<li class="sort">Jewellery</li>
						<li class="by"><img src="images/do.png" alt=""></li>
						<div class="clearfix"></div>
					</ul>
					<div class="single-bottom">
						<a href="#"><p>Fashion</p></a> <a href="#"><p>Precious</p></a> <a
							href="#"><p>1 Gram Gold</p></a>
					</div>
				</div>
				<div class="tab5">
					<ul class="place">
						<li class="sort">Specials</li>
						<li class="by"><img src="images/do.png" alt=""></li>
						<div class="clearfix"></div>
					</ul>
					<div class="single-bottom">
						<a href="#"><p>Cakes</p></a> <a href="#"><p>Party Items</p></a> <a
							href="#"><p></p></a> <a href="#"><p>Relax Chairs</p></a>
					</div>
				</div>

				<section class="sky-form">
				<h4>
					<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>DISCOUNTS
				</h4>
				<div class="row row1 scroll-pane">
					<div class="col col-4">
						<label class="checkbox"><input type="checkbox"
							name="checkbox" checked=""><i></i>Upto - 10% (20)</label>
					</div>
					<div class="col col-4">
						<label class="checkbox"><input type="checkbox"
							name="checkbox"><i></i>40% - 50% (5)</label> <label
							class="checkbox"><input type="checkbox" name="checkbox"><i></i>30%
							- 20% (7)</label> <label class="checkbox"><input type="checkbox"
							name="checkbox"><i></i>10% - 5% (2)</label> <label
							class="checkbox"><input type="checkbox" name="checkbox"><i></i>Other(50)</label>
					</div>
				</div>
				</section>
				<section class="sky-form">
				<h4>
					<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Price
				</h4>
				<ul class="dropdown-menu1">
					<li><a href="">
							<div id="slider-range"></div> <input type="text" id="amount"
							style="border: 0; font-weight: NORMAL; font-family: 'Arimo', sans-serif;" />
					</a></li>
				</ul>
				</section>
				<!---->

				<section class="sky-form">
				<h4>
					<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Type
				</h4>
				<div class="row row1 scroll-pane">
					<div class="col col-4">
						<label class="checkbox"><input type="checkbox"
							name="checkbox" checked=""><i></i>1 Gram Gold (30)</label>
					</div>
					<div class="col col-4">
						<label class="checkbox"><input type="checkbox"
							name="checkbox"><i></i>Gold Plated (30)</label> <label
							class="checkbox"><input type="checkbox" name="checkbox"><i></i>Platinum
							(30)</label> <label class="checkbox"><input type="checkbox"
							name="checkbox"><i></i>Silver (30)</label> <label
							class="checkbox"><input type="checkbox" name="checkbox"><i></i>Jewellery
							Sets (30)</label> <label class="checkbox"><input type="checkbox"
							name="checkbox"><i></i>Stone Items (30)</label>
					</div>
				</div>
				</section>
				<section class="sky-form">
				<h4>
					<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Brand
				</h4>
				<div class="row row1 scroll-pane">
					<div class="col col-4">
						<label class="checkbox"><input type="checkbox"
							name="checkbox" checked=""><i></i>Akasana Collectio</label>
					</div>
					<div class="col col-4">
						<label class="checkbox"><input type="checkbox"
							name="checkbox"><i></i>Colori</label> <label class="checkbox"><input
							type="checkbox" name="checkbox"><i></i>Crafts Hub</label> <label
							class="checkbox"><input type="checkbox" name="checkbox"><i></i>Jisha</label>
						<label class="checkbox"><input type="checkbox"
							name="checkbox"><i></i>Karatcart</label> <label class="checkbox"><input
							type="checkbox" name="checkbox"><i></i>Titan</label> <label
							class="checkbox"><input type="checkbox" name="checkbox"><i></i>Amuktaa</label>
					</div>
				</div>
				</section>
			</div>
		</div>
	</div>
	</div>

	</div>
</body>
</html>