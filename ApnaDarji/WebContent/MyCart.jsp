<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png"  href="resources/favicon.png"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="MyCart.css">
<!-- <link rel="import" href="NavBar.jsp"> -->


<script type="text/javascript" language="javascript">

	function RemoveFromCart(obj){
		$.ajax({

			type : $(obj).closest('form').attr('method'),
			url : $(obj).closest('form').attr('action'),
			data : $(obj).closest('form').serialize(),
			success : function(data) {
				$(obj).parent().parent().parent().slideUp('slow', function(){ $(obj).remove(); });;
			}
		});
	}
	function SaveForLater(obj){
		$.ajax({

			type : $(obj).closest('form').attr('method'),
			url : $(obj).closest('form').attr('action'),
			data : $(obj).closest('form').serialize(),
			success : function(data) {
				$(obj).parent().parent().parent().slideUp('slow', function(){ $(obj).remove(); });;
			}
		});
	}

</script>
</head>
<body>
	<div id="nav-bar-include">
	<s:include value="NavBar.jsp"></s:include>
	</div>
	<div id="cart-title-box">
			<h2>YOUR CART ITEMS</h2>
	</div>
		<s:if test="%{cartPrdList.isEmpty()}">
		   <div id="empty-cart-box">
		   		<img src="resources/emptycart.jpg">
		   		<p>YOUR SHOPPING CART IS EMPTY</p>
		   		<hr style="width: 200px;  border-width: 2px;"/>
		   		<p>You can add items from your saved products by clicking on Add to cart button in 
		   				<a href="FavoriteProductDisplayAction">FAVORITES</a>
		   		</p>
		   		<h5>OR</h5>
		   		<p>You can get started with <a href="FabricDisplayAction">FABRICS</a></p>
		   </div>
		</s:if>
		<s:else>
			<s:iterator value="cartPrdList">
					<div id="cart-prd">
						<div class="inline-class" id="cart-prd-img">
							<img src='<s:property value="prdImg"/>'>
						</div>
						<div class="inline-class" id="cart-prd-desc">
							<p><s:property value="prdName"/></p>
							<p><p><s:property value="prodId"/></p>
							<p><s:property value="prodDesc"/></p>
								<a href="javascript: void();" >EDIT</a>
							<s:form id="remove-form" action="CartProductRemoveAction" method="POST">
								<a href="javascript: void();" onclick="RemoveFromCart(this)">REMOVE</a>
								<input id="prd_id" type="hidden" value='<s:property value="prodId"/>' name="prodId">
							</s:form>
						</div>
						<div class="inline-class" id="cart-prd-trans">
								<p> CUSTOMIZED PRODUCT</p>
								<input type="button" value="CHECKOUT">
							<s:form id="add-to-fav-form" action="CartProductMoveToFavAction" method="POST">
								<input type="button" value="SAVE FOR LATER" onclick="SaveForLater(this)">
								<input id="prd_id" type="hidden" value='<s:property value="prodId"/>' name="prodId">
							</s:form>
						</div>
					</div>
			</s:iterator>
		</s:else>
</body>

</html>