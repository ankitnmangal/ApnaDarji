package com.ApnaDarji.Products;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.ApnaDarji.Model.FavoriteProducts;
import com.ApnaDarji.Model.Product;

public class FavoriteProductDisplayAction implements SessionAware{
	
	private List<Product> FavPrdList = new ArrayList<Product>();
	private SessionMap<String, Object> sessionMap; 
	
	@Override
	public void setSession(Map<String, Object> map) {
		this.sessionMap = (SessionMap<String, Object>) map;
	}

	public String execute(){
		Object obj = sessionMap.get("favList");
		if(obj != null && !((FavoriteProducts) obj).getPrdIdList().isEmpty())
		{
			FavoriteProducts fvrtPrds = (FavoriteProducts) obj;
			List<String> fvrtProdsIDList = fvrtPrds.getPrdIdList();
			for(int i=1; i<=fvrtProdsIDList.size(); i++){
//				take prodIds from this list and fetch products from db and create a list of all favorite prds of user.........
				Product prd = new Product();
				prd.setProdDesc("Plain Shirt");
				prd.setProdDesc("Raymonds Blue color light checks");
				prd.setProdId(fvrtProdsIDList.get(i-1).toString());
				prd.setProdPrice(23);
				prd.setPrdImg("resources/bgimg1.jpg");
				
				FavPrdList.add(prd);
			}
		}
		{
			System.out.println("empty");
		}
			return "SUCCESS";
	}

	public List<Product> getFavPrdList() {
		return FavPrdList;
	}

	public void setFavPrdList(List<Product> favPrdList) {
		FavPrdList = favPrdList;
	}

}
