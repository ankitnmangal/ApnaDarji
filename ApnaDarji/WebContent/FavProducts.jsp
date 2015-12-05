<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png"  href="resources/favicon.png"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Favorites</title>

<link rel="stylesheet" type="text/css" href="FavProducts.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" language="javascript">

	function AddToCart(obj){
		$.ajax({

			type : $(obj).closest('form').attr('method'),
			url : $(obj).closest('form').attr('action'),
			data : $(obj).closest('form').serialize(),
			success : function(data) {
				$(obj).parent().parent().parent().slideUp('slow', function(){ $(obj).remove(); });;
			}
		});
	}
	function RemoveFromFav(obj){
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
	<div id="fav-title-box">
			<h2>YOUR FAVORITE PRODUCTS</h2>
	</div>
	<s:if test="%{FavPrdList.isEmpty()}">
	   <div id="empty-cart-box">
	   		<img src="resources/emptyheart.png">
	   		<p>YOUR FAVORITES LIST IS EMPTY</p>
	   		<hr style="width: 200px;  border-width: 2px;"/>
	   		<p>You can add items from your favorites by clicking on SAVE FOR LATER button in your
	   				<a href="CartDisplayAction">CART</a>
	   		</p>
	   		<h5>OR</h5>
	   		<p>You can get started with <a href="FabricDisplayAction">FABRICS</a></p>
	   </div>
	</s:if>
	<s:else>
		<s:iterator value="FavPrdList">
				<div id="fav-prd">
					<div class="inline-class" id="fav-prd-img">
						<img src='<s:property value="prdImg"/>'>
					</div>
					<div class="inline-class" id="fav-prd-desc">
						<p><s:property value="prdName"/></p>
						<p><p><s:property value="prodId"/></p>
						<p><s:property value="prodDesc"/></p>
						<s:if test="%{customized == true}">
							<a>EDIT</a>
						</s:if>
						
						<s:form id="add-to-fav-form" action="FavoriteProductRemoveAction" method="POST">
							<a onclick="RemoveFromFav(this)" class="glyphicon glyphicon-trash">REMOVE</a>
							<input id="prd_id" type="hidden" value='<s:property value="prodId"/>' name="prodId">
						</s:form>
						
					</div>
					<div class="inline-class" id="fav-prd-trans">
						<s:if test="customized == 'Y'">
							<p> CUSTOMIZED PRODUCT</p>
							<input type="button" value="CHECKOUT">
							<s:form id="add-to-fav-form" action="FavoriteProductMoveToCartAction" method="POST">
								<input type="button" value="ADD TO CART" onclick="AddToCart(this)">
								<input id="prd_id" type="hidden" value='<s:property value="prodId"/>' name="prodId">
							</s:form>
							
						</s:if>
						<s:else>
							<p>FAVORITE FABRIC</p>
							<form action="CustomizationAction" method='post'>
								<input id="prd_id" type="hidden" value='<s:property value="prodId"/>' name="prodId">
								<input type="submit" value="CUSTOMIZE" />
							</form>
						</s:else>
					</div>
				</div>
		</s:iterator>
	</s:else>
</body>

</html>
