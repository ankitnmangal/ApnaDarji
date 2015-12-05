<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png"  href="resources/favicon.png"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fabrics</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
<link rel="stylesheet" type="text/css" href="Fabrics.css">
<link rel="stylesheet" type="text/css" href="quickview.css">
<!-- <link rel="import" href="NavBar.jsp"> -->
<script type="text/javascript" language="javascript">
	function favorite(obj) {
		$(obj).hide();
		if ($(obj).attr('class') == 'fav-img-white') {
			$(obj).parent('form').parent('.fav-div').children(
					'#remove-fav-form').children('.fav-img-red').show();
			var cnt = parseInt($('#fav-itm-cnt').text());
			cnt = cnt + 1;
			$('#fav-itm-cnt').text(cnt);
		} else {
			$(obj).parent('form').parent('.fav-div').children('#add-fav-form')
					.children('.fav-img-white').show();
			var cnt = parseInt($('#fav-itm-cnt').text());
			cnt = cnt - 1;
			$('#fav-itm-cnt').text(cnt);
		}

		$.ajax({

					type : $(obj).closest('form').attr('method'),
					url : $(obj).closest('form').attr('action'),
					data : $(obj).closest('form').serialize(),
					success : function(data) {

			}
		});
	}
	function QuickView(obj) {
		$('#prd-container').children('#prd-img-cont').children('#obj-img')
				.prop('src',$(obj).parent().parent('.prd')
								  .children('.prd-img').children('img').attr('src'));
		
		$('#prd-container').children('#prd-info-cont').children('#prd-content1').children('#qv-prodDesc')
				.text($(obj).parent().parent('.prd')
				  					.children('.prd-desc-div').children('.prd-desc').text());
	
		$('#prd-container').children('#prd-info-cont').children('#prd-content1').children('#qv-fabQuality')
				.text($(obj).parent().parent('.prd').children('#fab-quality').attr('value'));
		
		$('#prd-container').children('#prd-info-cont').children('#prd-content1').children('#qv-material')
				.text($(obj).parent().parent('.prd').children('#fab-material').attr('value'));
	
		$('#prd-container').children('#prd-info-cont').children('#prd-content1').children('#qv-price')
				.text($(obj).parent().parent('.prd')
		  					.children('.prc-str-div').children('.price').text());
		
		$('#prd-container').children('#prd-info-cont').children('#prd-content1').children('#qv-stock')
				.text($(obj).parent().parent('.prd')
		  					.children('.stck-div').children('.stck-text').text());
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

	$(document).ready(function() {
		$('.fav-img-red').hide();
		$('#fabrics-home-mask').click(function() {
			$(this).fadeOut(500);
			$('#prd-container').hide(0);
		});
		
		size_prd = $("#fab-prd-list ul").size();
// 		alert(size_prd);
	    x=40;
	    $('#fab-prd-list ul:lt('+x+')').show();
	    $('#loadMore').show();
	    $('#loadMore').click(function () {
	        x= (x+40 <= size_prd) ? x+40 : size_prd;
	        $('#fab-prd-list ul:lt('+x+')').show();
	         $('#showLess').show();
	        if(x == size_prd){
	            $('#loadMore').hide();
	        }
	    });
	    $('#showLess').click(function () {
	        x=(x-40<0) ? 40 : x-40;
	        $('#fab-prd-list ul').not(':lt('+x+')').hide();
	        $('#loadMore').show();
	         $('#showLess').show();
	        if(x == 40){
	            $('#showLess').hide();
	        }
	    });
	});
	
	function loadFilteredData(obj){
		var filtersData = "";
		filtersData = $(":checkbox:checked").map(function() { return this.id}).get().join('');
		if(filtersData == ""){
			filtersData = "GetAll";
		}
		alert(filtersData);
// 		 $('#loader-mask').show();
		  
			$.ajax({
				type : 'GET',
				url : 'FabricFilterAction',
				data: {'filter':filtersData},
				success : function(data) {
					$('#loader-mask').hide();
// 					var result  = $.trim(""+data);
// 					$.each(data, function(k, v) {
// 			            alert(k + ' is ' + v);
// 			        });
				}
			});
	   
	}
</script>

</head>
<body>
	<div id="nav-bar-include">
		<s:include value="NavBar.jsp"></s:include>
	</div>
	<!-- 	<div class="nav-bar"> -->
	<!-- 		<div class="standard-tab"> -->
	<!-- 			<abbr id="std-prm" class="inline">PREMIUM</abbr> <abbr id="std-std" -->
	<!-- 				class="inline">STANDARD</abbr> <abbr id="std-norm" class="inline">NORMAL</abbr> -->
	<!-- 		</div> -->
	<!-- 	</div> -->

	<!-- -------------------------------------quickView Popup---------------------------------------------------- -->

	<div id="prd-container">
		
		<div id="prd-img-cont">
			<img class="floating-arw" src="resources/arrowleft.png" /> <img
				id="obj-img" src="resources/mario1.jpg" /> <img
				class="floating-arw" src="resources/arrowright.png" />
		</div>
		<div id="prd-info-cont">
			<div id="prd-content1" class="prd-info-child-cont">
				<h3 id="qv-prodDesc">Product Desc</h3>
				 <span id="qv-fabQuality">Type: delux </span> 
				 <span id="qv-material">Material: cotton</span> 
				 <h3 id="qv-price">price</h3>
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
				<form action="CustomizationAction" method='post'>
					<input id="qv-prd_id" type="hidden" value="" name="prodId">
					<input type="submit" value="CUSTOMIZE" /> <br> 
<!-- 				<input type="button" value="SAVE FOR LATER" /> -->
				</form>
			</div>

		</div>
	</div>
<!-- ----------------------------------------------------quick view endss.... -->


	<!-- -------------------------------fabrics-home-mask to cover the whole screen---------------------------------------- -->
	<div id="fabrics-home-mask"></div>
	<!-------------------------------------------------------------------------------------------------------- -->
<!-- 	<div id="filter-box" class="fab-inline"> -->
<!-- 			<div class="panelstick"> -->
<!-- 				<div id="panel-grid-list" class="panel-grid"> -->
<!-- 					<h3 class="header">Type</h3> -->
<!-- 					<ul class="content"> -->
<!-- 						<li> -->
<!-- 							<div class="row1 scroll-pane"> -->
<!-- 								<div class=""> -->
<%-- 								<input  onclick="loadFilteredData(this)" type="checkbox" id="TypePremium"><span >PREMIUM</span> --%>
<%-- 								<input  onclick="loadFilteredData(this)" type="checkbox" id="TypeDeluxe"><span >DELUXE</span> --%>
<%-- 								<input  onclick="loadFilteredData(this)" type="checkbox" id="TypeStandard"><span >STANDARD</span> --%>
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 					<h3 class="header">Section ADAR</h3> -->
<!-- 					<ul id="" class="content"> -->
<!-- 						<li> -->
<!-- 							<div class="row1 scroll-pane"> -->
<!-- 								<div class="col col-4"> -->
<!-- 									<label class="checkbox"><input type="checkbox" -->
<!-- 										name="checkbox"><i></i>kutis</label> <label class="checkbox"><input -->
<!-- 										type="checkbox" name="checkbox"><i></i>churidar kurta</label> -->
<!-- 									<label class="checkbox"><input type="checkbox" -->
<!-- 										name="checkbox"><i></i>salwar</label> -->

<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 					<h3 class="header">Section AB</h3> -->
<!-- 					<ul class="content"> -->
<!-- 						<li><a href="#">Bahamas, The</a></li> -->
<!-- 						<li><a href="#">Bahrain</a></li> -->
<!-- 						<li><a href="#">Bangladesh</a></li> -->
<!-- 					</ul> -->
<!-- 					<h3 class="header">Section AC</h3> -->
<!-- 					<ul class="content"> -->
<!-- 						<li><a href="#">Cambodia</a></li> -->
<!-- 						<li><a href="#">Cameroon</a></li> -->
<!-- 						<li><a href="#">Canada</a></li> -->
<!-- 						<li><a href="#">Cape Verde</a></li> -->
<!-- 						<li><a href="#">Central African Republic</a></li> -->
<!-- 						<li><a href="#">Chad</a></li> -->
<!-- 					</ul> -->
<!-- 					<h3 class="header">Section AsdfsC</h3> -->
<!-- 					<ul class="content"> -->
<!-- 						<li><a href="#">Cambodia</a></li> -->
<!-- 						<li><a href="#">Cameroon</a></li> -->
<!-- 						<li><a href="#">Canada</a></li> -->
<!-- 						<li><a href="#">Cape Verde</a></li> -->
<!-- 						<li><a href="#">Central African Republic</a></li> -->
<!-- 						<li><a href="#">Chad</a></li> -->
<!-- 					</ul> -->
<!-- 					<h3 class="header">Section AdfsdC</h3> -->
<!-- 					<ul class="content"> -->
<!-- 						<li><a href="#">Cambodia</a></li> -->
<!-- 						<li><a href="#">Cameroon</a></li> -->
<!-- 						<li><a href="#">Canada</a></li> -->
<!-- 						<li><a href="#">Cape Verde</a></li> -->
<!-- 						<li><a href="#">Central African Republic</a></li> -->
<!-- 						<li><a href="#">Chad</a></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 		</div> -->
	<div id="fab-prd-list" class="fab-inline">
	<s:set var="discount" value=".75"/>
		<s:iterator value="prdList">
		<s:set var="discPlusPrice" value="prodPrice / #discount" />
		<ul style="display: none;">
			<div class="prd fab-inline">
				<input id="fab-quality" type="hidden" value='<s:property value="fabric_Quality_Type"/>' name="fabric_Quality_Type">
				<input id="fab-material" type="hidden" value='<s:property value="materialType"/>' name="materialType">
				<input id="prd_id" type="hidden" value='<s:property value="prodId"/>' name="prodId">
				<div class="fav-div">
					<s:form id="add-fav-form" action="FavoriteProductAddAction"	method="POST">
						<img src="resources/heart.png" onClick="favorite(this)" class="fav-img-white" />
						<input id="prd_id" type="hidden" value='<s:property value="prodId"/>' name="prodId">
					</s:form>
					<s:form id="remove-fav-form" action="FavoriteProductRemoveAction" method="POST">
						<img src="resources/redheart.png" onClick="favorite(this)" class="fav-img-red" />
						<input id="prd_id" type="hidden" value='<s:property value="prodId"/>' name="prodId">
					</s:form>
				</div>
				<div class="prd-img">
					<img onClick="QuickView(this)" src='<s:property value="prdImg"/>'>
				</div>
				<div class="prc-str-div">
					<span class="price"> End Product Price: &#x20B9;<b><s:property value="prodPrice" /></b></span>
					<span class="price-with-disc"><strike> &#x20B9;<b><s:property value="%{#attr.discPlusPrice}" /></b></strike></span>
					<span class="discount">(-25%)</span>
<!-- 					<div class="str fab-inline"></div> -->
				</div>
				<div class="stck-div">
					<p class="stck-text">
						<s:if test="inStock == 'Y'">
							IN STOCK
						</s:if>
						<s:else>
							OUT OF STOCK
						</s:else>
					</p>
				</div>
				<div class="prd-desc-div">
					<p class="prd-desc">
						<s:property value="prodDesc" />
					</p>
				</div>
				<div class="cstmz-ovrw-div">
					<form action="CustomizationAction" method='post'>
						<input id="prd_id" type="hidden" value='<s:property value="prodId"/>' name="prodId">
						<input type="submit" class="cstmz-div fab-inline" value="CUSTOMIZE" />
					</form>
					<input type="button" class="ovrw-div fab-inline" onClick="QuickView(this)" value="QUICK VIEW" />
				</div>
			</div>
		</ul>
		</s:iterator>

<!-- 		<div class="prd fab-inline"> -->
<!-- 			<div class="fav-div"> -->
<%-- 				<s:form id="add-fav-form" action="FavoriteProductAddAction" --%>
<%-- 					method="POST"> --%>
<!-- 					<img src="resources/heart.png" onClick="favorite(this)" -->
<!-- 						class="fav-img-white" /> -->
<!-- 					<input id="prd_id" type="hidden" value="prodId" name="prodId"> -->
<%-- 				</s:form> --%>
<%-- 				<s:form id="remove-fav-form" action="FavoriteProductRemoveAction" --%>
<%-- 					method="POST"> --%>
<!-- 					<img src="resources/redheart.png" onClick="favorite(this)" -->
<!-- 						class="fav-img-red" /> -->
<!-- 					<input id="prd_id" type="hidden" value="prodId" name="prodId"> -->
<%-- 				</s:form> --%>
<!-- 			</div> -->
<!-- 			<div class="prd-img"> -->
<!-- 				<img src="resources/bgimg.jpg"> -->
<!-- 			</div> -->

<!-- 			<div class="prc-str-div"> -->
<!-- 				<abbr class="price fab-inline">$23</abbr> -->
<!-- 				<div class="str fab-inline"></div> -->
<!-- 			</div> -->
<!-- 			<div class="stck-div"> -->
<!-- 				<p class="stck-text">In Stock</p> -->
<!-- 			</div> -->
<!-- 			<div class="prd-desc-div"> -->
<!-- 				<p class="prd-desc">product describtion dgjksbdgkjsn rsgnoirng -->
<!-- 					rgnoeirn</p> -->
<!-- 			</div> -->
<!-- 			<div class="cstmz-ovrw-div"> -->
<!-- 				<input type="button" class="cstmz-div fab-inline" value="CUSTOMIZE" /> <input -->
<!-- 					type="submit" class="ovrw-div fab-inline" onClick="QuickView(this)" /> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="prd fab-inline"> -->
<!-- 			<div class="fav-div"> -->
<%-- 				<s:form id="add-fav-form" action="FavoriteProductAddAction" --%>
<%-- 					method="POST"> --%>
<!-- 					<img src="resources/heart.png" onClick="favorite(this)" -->
<!-- 						class="fav-img-white" /> -->
<!-- 					<input id="prd_id" type="hidden" value="prodId" name="prodId"> -->
<%-- 				</s:form> --%>
<%-- 				<s:form id="remove-fav-form" action="FavoriteProductRemoveAction" --%>
<%-- 					method="POST"> --%>
<!-- 					<img src="resources/redheart.png" onClick="favorite(this)" -->
<!-- 						class="fav-img-red" /> -->
<!-- 					<input id="prd_id" type="hidden" value="prodId" name="prodId"> -->
<%-- 				</s:form> --%>
<!-- 			</div> -->
<!-- 			<div class="prd-img"> -->
<!-- 				<img src="resources/bgimg.jpg"> -->
<!-- 			</div> -->

<!-- 			<div class="prc-str-div"> -->
<!-- 				<abbr class="price fab-inline">$23</abbr> -->
<!-- 				<div class="str fab-inline"></div> -->
<!-- 			</div> -->
<!-- 			<div class="stck-div"> -->
<!-- 				<p class="stck-text">In Stock</p> -->
<!-- 			</div> -->
<!-- 			<div class="prd-desc-div"> -->
<!-- 				<p class="prd-desc">product describtion dgjksbdgkjsn rsgnoirng -->
<!-- 					rgnoeirn</p> -->
<!-- 			</div> -->
<!-- 			<div class="cstmz-ovrw-div"> -->
<!-- 				<input type="button" class="cstmz-div fab-inline" value="CUSTOMIZE" /> <input -->
<!-- 					type="submit" class="ovrw-div fab-inline" onClick="QuickView(this)" /> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="prd fab-inline"> -->
<!-- 			<div class="fav-div"> -->
<%-- 				<s:form id="add-fav-form" action="FavoriteProductAddAction" --%>
<%-- 					method="POST"> --%>
<!-- 					<img src="resources/heart.png" onClick="favorite(this)" -->
<!-- 						class="fav-img-white" /> -->
<!-- 					<input id="prd_id" type="hidden" value="prodId" name="prodId"> -->
<%-- 				</s:form> --%>
<%-- 				<s:form id="remove-fav-form" action="FavoriteProductRemoveAction" --%>
<%-- 					method="POST"> --%>
<!-- 					<img src="resources/redheart.png" onClick="favorite(this)" -->
<!-- 						class="fav-img-red" /> -->
<!-- 					<input id="prd_id" type="hidden" value="prodId" name="prodId"> -->
<%-- 				</s:form> --%>
<!-- 			</div> -->
<!-- 			<div class="prd-img"> -->
<!-- 				<img src="resources/bgimg.jpg"> -->
<!-- 			</div> -->

<!-- 			<div class="prc-str-div"> -->
<!-- 				<abbr class="price fab-inline">$23</abbr> -->
<!-- 				<div class="str fab-inline"></div> -->
<!-- 			</div> -->
<!-- 			<div class="stck-div"> -->
<!-- 				<p class="stck-text">In Stock</p> -->
<!-- 			</div> -->
<!-- 			<div class="prd-desc-div"> -->
<!-- 				<p class="prd-desc">product describtion dgjksbdgkjsn rsgnoirng -->
<!-- 					rgnoeirn</p> -->
<!-- 			</div> -->
<!-- 			<div class="cstmz-ovrw-div"> -->
<!-- 				<input type="button" class="cstmz-div fab-inline" value="CUSTOMIZE" /> <input -->
<!-- 					type="submit" class="ovrw-div fab-inline" onClick="QuickView(this)" /> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="prd fab-inline"> -->
<!-- 			<div class="fav-div"> -->
<%-- 				<s:form id="add-fav-form" action="FavoriteProductAddAction" --%>
<%-- 					method="POST"> --%>
<!-- 					<img src="resources/heart.png" onClick="favorite(this)" -->
<!-- 						class="fav-img-white" /> -->
<!-- 					<input id="prd_id" type="hidden" value="prodId" name="prodId"> -->
<%-- 				</s:form> --%>
<%-- 				<s:form id="remove-fav-form" action="FavoriteProductRemoveAction" --%>
<%-- 					method="POST"> --%>
<!-- 					<img src="resources/redheart.png" onClick="favorite(this)" -->
<!-- 						class="fav-img-red" /> -->
<!-- 					<input id="prd_id" type="hidden" value="prodId" name="prodId"> -->
<%-- 				</s:form> --%>
<!-- 			</div> -->
<!-- 			<div class="prd-img"> -->
<!-- 				<img src="resources/bgimg.jpg"> -->
<!-- 			</div> -->

<!-- 			<div class="prc-str-div"> -->
<!-- 				<abbr class="price fab-inline">$23</abbr> -->
<!-- 				<div class="str fab-inline"></div> -->
<!-- 			</div> -->
<!-- 			<div class="stck-div"> -->
<!-- 				<p class="stck-text">In Stock</p> -->
<!-- 			</div> -->
<!-- 			<div class="prd-desc-div"> -->
<!-- 				<p class="prd-desc">product describtion dgjksbdgkjsn rsgnoirng -->
<!-- 					rgnoeirn</p> -->
<!-- 			</div> -->
<!-- 			<div class="cstmz-ovrw-div"> -->
<!-- 				<input type="button" class="cstmz-div fab-inline" value="CUSTOMIZE" /> <input -->
<!-- 					type="submit" class="ovrw-div fab-inline" onClick="QuickView(this)" /> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="prd fab-inline"> -->
<!-- 			<div class="fav-div"> -->
<%-- 				<s:form id="add-fav-form" action="FavoriteProductAddAction" --%>
<%-- 					method="POST"> --%>
<!-- 					<img src="resources/heart.png" onClick="favorite(this)" -->
<!-- 						class="fav-img-white" /> -->
<!-- 					<input id="prd_id" type="hidden" value="prodId" name="prodId"> -->
<%-- 				</s:form> --%>
<%-- 				<s:form id="remove-fav-form" action="FavoriteProductRemoveAction" --%>
<%-- 					method="POST"> --%>
<!-- 					<img src="resources/redheart.png" onClick="favorite(this)" -->
<!-- 						class="fav-img-red" /> -->
<!-- 					<input id="prd_id" type="hidden" value="prodId" name="prodId"> -->
<%-- 				</s:form> --%>
<!-- 			</div> -->
<!-- 			<div class="prd-img"> -->
<!-- 				<img src="resources/bgimg.jpg"> -->
<!-- 			</div> -->

<!-- 			<div class="prc-str-div"> -->
<!-- 				<abbr class="price fab-inline">$23</abbr> -->
<!-- 				<div class="str fab-inline"></div> -->
<!-- 			</div> -->
<!-- 			<div class="stck-div"> -->
<!-- 				<p class="stck-text">In Stock</p> -->
<!-- 			</div> -->
<!-- 			<div class="prd-desc-div"> -->
<!-- 				<p class="prd-desc">product describtion dgjksbdgkjsn rsgnoirng -->
<!-- 					rgnoeirn</p> -->
<!-- 			</div> -->
<!-- 			<div class="cstmz-ovrw-div"> -->
<!-- 				<input type="button" class="cstmz-div fab-inline" value="CUSTOMIZE" /> <input -->
<!-- 					type="submit" class="ovrw-div fab-inline" onClick="QuickView(this)" /> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="prd fab-inline"> -->
<!-- 			<div class="fav-div"> -->
<%-- 				<s:form id="add-fav-form" action="FavoriteProductAddAction" --%>
<%-- 					method="POST"> --%>
<!-- 					<img src="resources/heart.png" onClick="favorite(this)" -->
<!-- 						class="fav-img-white" /> -->
<!-- 					<input id="prd_id" type="hidden" value="prodId" name="prodId"> -->
<%-- 				</s:form> --%>
<%-- 				<s:form id="remove-fav-form" action="FavoriteProductRemoveAction" --%>
<%-- 					method="POST"> --%>
<!-- 					<img src="resources/redheart.png" onClick="favorite(this)" -->
<!-- 						class="fav-img-red" /> -->
<!-- 					<input id="prd_id" type="hidden" value="prodId" name="prodId"> -->
<%-- 				</s:form> --%>
<!-- 			</div> -->
<!-- 			<div class="prd-img"> -->
<!-- 				<img src="resources/bgimg.jpg"> -->
<!-- 			</div> -->

<!-- 			<div class="prc-str-div"> -->
<!-- 				<abbr class="price fab-inline">$23</abbr> -->
<!-- 				<div class="str fab-inline"></div> -->
<!-- 			</div> -->
<!-- 			<div class="stck-div"> -->
<!-- 				<p class="stck-text">In Stock</p> -->
<!-- 			</div> -->
<!-- 			<div class="prd-desc-div"> -->
<!-- 				<p class="prd-desc">product describtion dgjksbdgkjsn rsgnoirng -->
<!-- 					rgnoeirn</p> -->
<!-- 			</div> -->
<!-- 			<div class="cstmz-ovrw-div"> -->
<!-- 				<input type="button" class="cstmz-div fab-inline" value="CUSTOMIZE" /> <input -->
<!-- 					type="submit" class="ovrw-div fab-inline" onClick="QuickView(this)" /> -->
<!-- 			</div> -->
<!-- 		</div> -->
	
	</div>
	<br>
	<div id="show-hide-div"><a id="loadMore">SHOW MORE FABRIC</a> <a id="showLess">SHOW LESS FABRIC</a></div><br>
	
</body>
</html>