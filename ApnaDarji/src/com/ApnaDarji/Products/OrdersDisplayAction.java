package com.ApnaDarji.Products;

import java.util.ArrayList;
import java.util.List;

import com.ApnaDarji.Model.Order;

public class OrdersDisplayAction {
	
	private List<Order> openOrderListwithNothingList = new ArrayList<Order>();
	private List<Order> openOrderListCanBeCanceledList = new ArrayList<Order>();
	private List<Order> openOrderListCanBeExchOrRtrnList = new ArrayList<Order>();
	private List<Order> closedOrderList = new ArrayList<Order>();
	
	String openStatus_Cancel[]= {"PO","AFM","ASTTM","FRT"};	
	String openStatus_ExchOrRtrn[]={"UODP","URP","UEP"};
	String openStatus_Nothing[]= {"UM","OFD"};
	String closedStatus[] = {"CANCELED","DELIVERED","EXCHANGED","RETURNED"};
	
	public String execute(){
				
				for(int i=1;i<=4;i++)
				{
					Order order = new Order();
					order.setOrderId(i+"");
					order.setOrderNum(i+"7501");
					order.setOrderDate("Sat, "+i+7+"th Nov. 2015");
					order.setPaymentMode("COD");
					order.setShippingDate("Mon, "+i+"th Nov. 2015");
					order.setTotalAmt(""+i*234);
					order.setDeliveryDate("Sat, "+i+7+"th Nov. 2015");
					order.setOrderStatus(openStatus_Cancel[i-1]);
					order.getPrd().setProdDesc("cancel"+i);
					openOrderListCanBeCanceledList.add(order);
				}
								
				for(int i=1;i<=3;i++)
				{
					Order order = new Order();
					order.setOrderId(i+"");
					order.setOrderNum(i+"7501");
					order.setOrderDate("Sat, "+i+7+"th Nov. 2015");
					order.setPaymentMode("COD");
					order.setShippingDate("Mon, "+i+"th Nov. 2015");
					order.setTotalAmt(""+i*234);
					order.setDeliveryDate("Sat, "+i+7+"th Nov. 2015");
					order.setOrderStatus(openStatus_ExchOrRtrn[i-1]);
					order.getPrd().setProdDesc("ExchOrRtrn"+i);
					openOrderListCanBeExchOrRtrnList.add(order);
				}

				for(int i=1;i<=2;i++)
				{
					Order order = new Order();
					order.setOrderId(i+"");
					order.setOrderNum(i+"7501");
					order.setOrderDate("Sat, "+i+7+"th Nov. 2015");
					order.setPaymentMode("COD");
					order.setShippingDate("Mon, "+i+"th Nov. 2015");
					order.setTotalAmt(""+i*234);
					order.setDeliveryDate("Sat, "+i+7+"th Nov. 2015");
					order.setOrderStatus(openStatus_Nothing[i-1]);
					order.getPrd().setProdDesc("Nothing"+i);
					openOrderListwithNothingList.add(order);
				}
				
				for(int i=1;i<=4;i++)
				{
					Order order = new Order();
					order.setOrderId(i+"");
					order.setOrderNum(i+"7501");
					order.setOrderDate("Sat, "+i+7+"th Nov. 2015");
					order.setPaymentMode("COD");
					order.setShippingDate("Mon, "+i+"th Nov. 2015");
					order.setTotalAmt(""+i*234);
					order.setDeliveryDate("Sat, "+i+7+"th Nov. 2015");
					order.setOrderStatus(closedStatus[i-1]);
					order.getPrd().setProdDesc("closed"+i);
					closedOrderList.add(order);
				}
		
		return "SUCCESS";
	}

	public List<Order> getOpenOrderListwithNothingList() {
		return openOrderListwithNothingList;
	}

	public void setOpenOrderListwithNothingList(
			List<Order> openOrderListwithNothingList) {
		this.openOrderListwithNothingList = openOrderListwithNothingList;
	}

	public List<Order> getOpenOrderListCanBeCanceledList() {
		return openOrderListCanBeCanceledList;
	}

	public void setOpenOrderListCanBeCanceledList(
			List<Order> openOrderListCanBeCanceledList) {
		this.openOrderListCanBeCanceledList = openOrderListCanBeCanceledList;
	}

	public List<Order> getOpenOrderListCanBeExchOrRtrnList() {
		return openOrderListCanBeExchOrRtrnList;
	}

	public void setOpenOrderListCanBeExchOrRtrnList(
			List<Order> openOrderListCanBeExchOrRtrnList) {
		this.openOrderListCanBeExchOrRtrnList = openOrderListCanBeExchOrRtrnList;
	}

	public List<Order> getClosedOrderList() {
		return closedOrderList;
	}

	public void setClosedOrderList(List<Order> closedOrderList) {
		this.closedOrderList = closedOrderList;
	}

	
}
