package com.ApnaDarji.Orders;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.ApnaDarji.Model.FavoriteProducts;

public class FavoriteProductAction implements SessionAware{

	private SessionMap<String, Object> sessionMap; 
	private Long prodId;
	boolean inSession = true;
	@Override
	public void setSession(Map<String, Object> map) {
		this.sessionMap = (SessionMap<String, Object>) map;
	}


	public void addFav() throws Exception {
		Object obj = sessionMap.get("favList");
		if(obj != null && !((FavoriteProducts) obj).getPrdIdList().isEmpty())
		{
			System.out.println(prodId);
			FavoriteProducts fvrtprdsess = (FavoriteProducts) obj;
			
			if(!fvrtprdsess.getPrdIdList().contains(prodId))
			{
				fvrtprdsess.getPrdIdList().add(prodId);
			
				if( sessionMap.get("inSession")!= null && inSession == (boolean) sessionMap.get("inSession"))
				{
					sessionMap.put("favList", fvrtprdsess);
					System.out.println("add item in db");
				}
				else
				{
					sessionMap.put("favList", fvrtprdsess);				
				}
					System.out.println("added");
			}
		}
		else
		{
			FavoriteProducts fvrtPrd =  new FavoriteProducts();
			List<Long> tempPrdIdList = new ArrayList<Long>();
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
	
		
	}
	public void removeFav() throws Exception {
		Object obj = sessionMap.get("favList");
		if(obj != null && !((FavoriteProducts) obj).getPrdIdList().isEmpty())
		{
			System.out.println(prodId);
				FavoriteProducts fvrtprdsess = (FavoriteProducts) obj;
				if(fvrtprdsess.getPrdIdList().contains(prodId))
				{
					if( sessionMap.get("inSession")!= null && inSession == (boolean) sessionMap.get("inSession"))
					{
						fvrtprdsess.getPrdIdList().remove(prodId);
						sessionMap.put("favList", fvrtprdsess);
						System.out.println("remove from db");
					}
					else
					{
						fvrtprdsess.getPrdIdList().remove(prodId);
						sessionMap.put("favList", fvrtprdsess);
						System.out.println("removed");
					}
				}
		}
	}


	/**
	 * @return the prodId
	 */
	public Long getProdId() {
		return prodId;
	}


	/**
	 * @param prodId the prodId to set
	 */
	public void setProdId(Long prodId) {
		this.prodId = prodId;
	}

}
