<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png"  href="resources/favicon.png"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Orders</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="MyOrders.css">


<script type="text/javascript" language="javascript">
	$(document).ready(function() {
		$('#open-orders-div').show();
	});
	
	function changeTab(obj){
// 		alert(obj.id);
		$(obj).siblings('li').removeClass('tab-selected');
		$(obj).addClass('tab-selected');
		$('.myOrders').hide(500);
		if (obj.id == "closed-orders-tab") 
		{
			$("#closed-orders-div").show(500);
		} 
		else 
		{
			if (obj.id == "open-orders-tab") {
				$("#open-orders-div").show(500);
			} else {

					}
		}
	}
</script>
</head>
<body>
	<div id="nav-bar-include">
		<s:include value="NavBar.jsp"></s:include>
	</div>
	<div id="main-outer-box">
		<div id="tab-box">
			<ul>
				<li id="open-orders-tab" onClick="changeTab(this)"  class="tab-selected"><abbr>OPEN ORDERS</abbr></li>
				<li id="closed-orders-tab" onClick="changeTab(this)"><abbr>CLOSED ORDERS</abbr></li>
<!-- 				<li id="return-orders-tab" onClick="changeTab(this)"><abbr>RETURNED ORDERS</abbr></li> -->
<!-- 				<li id="exchange-orders-tab" onClick="changeTab(this)"><abbr>EXCHANGED ORDERS</abbr></li> -->
			</ul>
		</div>
		
			<div class="myOrders" id="closed-orders-div">
				<div id="orders-title-box">
					<h2>CLOSED ORDERS</h2>
				</div>
				<s:iterator value="closedOrderList">
					<div id="orders-box">
						<div id="orders-details">
							<p> Order ID: <s:property value="orderNum"/></p>
							<p>Placed on <s:property value="orderDate"/> at 3:14pm</p>
							<br>
							<p>Total Amount: <s:property value="totalAmt"/>Rs.</p>
						</div>
						<div id="orders-prd">
							<div class="inline-class" id="order-prd-img">
								<img  src="resources/bgimg1.jpg">
							</div>
							<div class="inline-class" id="order-prd-desc">
								<p>Product Name</p>
								<p><s:property value="prd.prodDesc"/></p>
								<p>QTY</p>
							</div>
							<div class="inline-class" id="order-prd-trans">
								<p><s:property value="orderStatus"/></p>
							</div>
						</div>
					</div>
				</s:iterator>
			</div>
		
<!-- 		 --- -->


		<div class="myOrders" id="open-orders-div">
			<div id="orders-title-box">
				<h2>OPEN ORDERS</h2>
			</div>
			<s:iterator value="openOrderListCanBeCanceledList">
				<div id="orders-box">
					<div id="orders-details">
						<p> Order ID: <s:property value="orderNum"/></p>
						<p>Placed on <s:property value="orderDate"/> at 3:14pm</p>
						<br>
						<p>Total Amount: <s:property value="totalAmt"/>Rs.</p>
					</div>
					<div id="orders-prd">
						<div class="inline-class" id="order-prd-img">
							<img alt="Product Image" src="resources/bgimg1.jpg">
						</div>
						<div class="inline-class" id="order-prd-desc">
							<p>Product Name</p>
							<p><s:property value="prd.prodDesc"/></p>
							<p>QTY</p>
						</div>
						<div class="inline-class" id="order-prd-trans">
							<p><s:property value="orderStatus"/></p>
							<input type="submit" value="CANCEL ORDER" id="order-cancel-but">
						</div>
					</div>
				</div>
			</s:iterator>
			<s:iterator value="openOrderListCanBeExchOrRtrnList">
				<div id="orders-box">
					<div id="orders-details">
						<p> Order ID: <s:property value="orderNum"/></p>
						<p>Placed on <s:property value="orderDate"/> at 3:14pm</p>
						<br>
						<p>Total Amount: <s:property value="totalAmt"/>Rs.</p>
					</div>
					<div id="orders-prd">
						<div class="inline-class" id="order-prd-img">
							<img alt="Product Image" src="resources/bgimg1.jpg">
						</div>
						<div class="inline-class" id="order-prd-desc">
							<p>Product Name</p>
							<p><s:property value="prd.prodDesc"/></p>
							<p>QTY</p>
						</div>
						<div class="inline-class" id="order-prd-trans">
							<p><s:property value="orderStatus"/></p>
							
							<input type="submit" value="RETURN" id="order-return-but">
							<input type="submit" value="EXCHANGE" id="order-exchange-but">
						</div>
					</div>
				</div>
			</s:iterator>
			<s:iterator value="openOrderListwithNothingList">
				<div id="orders-box">
					<div id="orders-details">
						<p> Order ID: <s:property value="orderNum"/></p>
						<p>Placed on <s:property value="orderDate"/> at 3:14pm</p>
						<br>
						<p>Total Amount: <s:property value="totalAmt"/>Rs.</p>
					</div>
					<div id="orders-prd">
						<div class="inline-class" id="order-prd-img">
							<img alt="Product Image" src="resources/bgimg1.jpg">
						</div>
						<div class="inline-class" id="order-prd-desc">
							<p>Product Name</p>
							<p><s:property value="prd.prodDesc"/></p>
							<p>QTY</p>
						</div>
						<div class="inline-class" id="order-prd-trans">
							<p><s:property value="orderStatus"/></p>
						</div>
					</div>
				</div>
			</s:iterator>
		</div>
			

		
		
	</div>
</body>
</html>