package com.ApnaDarji.Products;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.ApnaDarji.DAO.ProductDAO;
import com.ApnaDarji.DAO.ProductDAOImpl;
import com.ApnaDarji.Model.Product;
import com.opensymphony.xwork2.ModelDriven;

public class CustomizationAction  implements SessionAware,ModelDriven<Product>{

//	private String prodId;
	ProductDAO prodDAO = new ProductDAOImpl();
	Product	prod = new Product();
	private SessionMap<String, Object> sessionMap; 
	@Override
	public void setSession(Map<String, Object> map) {
		this.sessionMap = (SessionMap<String, Object>) map;
	}
	
	@Override
	public Product getModel() {
		// TODO Auto-generated method stub
		return prod;
	}

	public String execute(){
		System.out.println(prod.getProdId());
		Object obj = sessionMap.get("customizedProd");
		System.out.println("Cutomization ACTION");
		if(obj != null)// && !((customizedProd) obj).getPrdIdList().isEmpty())
			{
				//customizedProd customPrds = (customizedProd) obj;
					//fetch records for  old custom prod on the basis of prod ID
				
			}
		else
			{
				System.out.println("Customization ACTION LIST IS empty");
				 prod = prodDAO.getProductByProdId(prod.getProdId());
				System.out.println(prod.getProdId());
				System.out.println(prod.getProdPrice());
			}
		return "SUCCESS";
	}

	public Product getProd() {
		return prod;
	}

	public void setProd(Product prod) {
		this.prod = prod;
	}

}
