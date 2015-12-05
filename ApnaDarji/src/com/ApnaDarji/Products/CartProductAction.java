package com.ApnaDarji.Products;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.ApnaDarji.Model.CartItems;
import com.ApnaDarji.Model.FavoriteProducts;

public class CartProductAction  implements SessionAware{

	private SessionMap<String, Object> sessionMap; 
	private String prodId;
	boolean inSession;
	@Override
	public void setSession(Map<String, Object> map) {
		this.sessionMap = (SessionMap<String, Object>) map;
	}


	public void AddToCart() {
		Object obj = sessionMap.get("cartList");
		if(obj != null && !((CartItems) obj).getPrdIdList().isEmpty())
		{
			System.out.println(prodId);
			CartItems cartprdsess = (CartItems) obj;
			
			if(!cartprdsess.getPrdIdList().contains(prodId))
			{
				cartprdsess.getPrdIdList().add(prodId);
			
				if( sessionMap.get("inSession")!= null && inSession == (boolean) sessionMap.get("inSession"))
				{
					sessionMap.put("cartList", cartprdsess);
					System.out.println("add item in db");
				}
				else
				{
					sessionMap.put("cartList", cartprdsess);				
				}
					System.out.println("added");
			}
		}
		else
		{
			CartItems cartPrd =  new CartItems();
			List<String> tempPrdIdList = new ArrayList<String>();
			System.out.println("here");
			tempPrdIdList.add(prodId); 
			System.out.println(prodId);
			cartPrd.setPrdIdList(tempPrdIdList);
			System.out.println("here");
			if( sessionMap.get("inSession")!= null && inSession == (boolean) sessionMap.get("inSession"))
			{
				sessionMap.put("cartList", cartPrd);
				System.out.println("add item in db");
			}
			else
			{
				sessionMap.put("cartList", cartPrd);				
			}
			
			
			System.out.println("added");
		}
	
		
	}
	public void RemoveCartItem(){
		Object obj = sessionMap.get("cartList");
		if(obj != null && !((CartItems) obj).getPrdIdList().isEmpty())
		{
			System.out.println(prodId);
			CartItems cartprdsess = (CartItems) obj;
				if(cartprdsess.getPrdIdList().contains(prodId))
				{
					if( sessionMap.get("inSession")!= null && inSession == (boolean) sessionMap.get("inSession"))
					{
						cartprdsess.getPrdIdList().remove(prodId);
						sessionMap.put("cartList", cartprdsess);
						System.out.println("remove from db");
					}
					else
					{
						cartprdsess.getPrdIdList().remove(prodId);
						sessionMap.put("cartList", cartprdsess);
						System.out.println("removed");
					}
				}
		}
	}
	
	public void MoveToFav(){
		Object obj = sessionMap.get("favList");
		System.out.println("MOVE TO FAV");
		if(obj != null && !((FavoriteProducts) obj).getPrdIdList().isEmpty())
		{
			System.out.println(prodId);
			FavoriteProducts fvrtprdsess = (FavoriteProducts) obj;
			
			if(!fvrtprdsess.getPrdIdList().contains(prodId))
			{
				fvrtprdsess.getPrdIdList().add(prodId);
				System.out.println("arpit");
				if( sessionMap.get("inSession")!= null && inSession == (boolean) sessionMap.get("inSession"))
				{
					sessionMap.put("favList", fvrtprdsess);
					System.out.println("add item in db");
					System.out.println("insession adding prod");
				}
				else
				{
					sessionMap.put("favList", fvrtprdsess);		
					System.out.println(" not in session adding prod");
				}
					System.out.println("added");
			}
		}
		else
		{
			FavoriteProducts fvrtPrd =  new FavoriteProducts();
			List<String> tempPrdIdList = new ArrayList<String>();
			System.out.println("here");
			tempPrdIdList.add(prodId); 
			System.out.println(prodId);
			fvrtPrd.setPrdIdList(tempPrdIdList);
			System.out.println("here");
			if( sessionMap.get("inSession")!= null && inSession == (boolean) sessionMap.get("inSession"))
			{
				sessionMap.put("favList", fvrtPrd);
				System.out.println("add item in db");
			}
			else
			{
				sessionMap.put("favList", fvrtPrd);				
			}
			
			
			System.out.println("added");
		}
		obj = sessionMap.get("cartList");
		if(obj != null && !((CartItems) obj).getPrdIdList().isEmpty())
		{
			System.out.println(prodId);
			CartItems cartprdsess = (CartItems) obj;
				if(cartprdsess.getPrdIdList().contains(prodId))
				{
					if( sessionMap.get("inSession")!= null && inSession == (boolean) sessionMap.get("inSession"))
					{
						cartprdsess.getPrdIdList().remove(prodId);
						sessionMap.put("cartList", cartprdsess);
						System.out.println("remove from db");
					}
					else
					{
						cartprdsess.getPrdIdList().remove(prodId);
						sessionMap.put("cartList", cartprdsess);
						System.out.println("removed");
					}
				}
		}
	
	}


	public String getProdId() {
		return prodId;
	}


	public void setProdId(String prodId) {
		this.prodId = prodId;
	}


}

