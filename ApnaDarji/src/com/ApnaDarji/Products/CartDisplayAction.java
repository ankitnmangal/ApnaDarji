package com.ApnaDarji.Products;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.ApnaDarji.Model.CartItems;
import com.ApnaDarji.Model.FavoriteProducts;
import com.ApnaDarji.Model.Product;

public class CartDisplayAction implements SessionAware{

	private List<Product> cartPrdList = new ArrayList<Product>();
	private SessionMap<String, Object> sessionMap; 
	@Override
	public void setSession(Map<String, Object> map) {
		this.sessionMap = (SessionMap<String, Object>) map;
	}

	public String execute(){
		Object obj = sessionMap.get("cartList");
		System.out.println("CART DISPLAY ACTION");
		if(obj != null && !((CartItems) obj).getPrdIdList().isEmpty())
		{
			CartItems cartPrds = (CartItems) obj;
			List<String> cartProdsIDList = cartPrds.getPrdIdList();
			for(int i=1; i<=cartProdsIDList.size(); i++){
//				take prodIds from this list and fetch products from db and create a list of all favorite prds of user.........
				Product prd = new Product();
				prd.setProdDesc("Plain Shirt");
				prd.setProdDesc("Raymonds Blue color light checks");
				prd.setProdId(cartProdsIDList.get(i-1).toString());
				prd.setProdPrice(23777777);
				prd.setPrdImg("resources/bgimg1.jpg");
				
				cartPrdList.add(prd);
			}
		}
		{
			System.out.println("CART DISPLAY ACTION LIST IS empty or session is null");
		}
			return "SUCCESS";
	}

	public List<Product> getCartPrdList() {
		return cartPrdList;
	}

	public void setCartPrdList(List<Product> cartPrdList) {
		this.cartPrdList = cartPrdList;
	}
}
