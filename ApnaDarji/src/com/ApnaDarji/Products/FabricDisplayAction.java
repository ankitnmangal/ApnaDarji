package com.ApnaDarji.Products;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.ApnaDarji.DAO.ProductDAO;
import com.ApnaDarji.DAO.ProductDAOImpl;
import com.ApnaDarji.Model.FavoriteProducts;
import com.ApnaDarji.Model.Product;
import com.google.gson.Gson;

public class FabricDisplayAction{

		private List<Product> prdList = new ArrayList<Product>();
		private String filter;
		ProductDAO prdDAO = new ProductDAOImpl();
		
		public String GetAllProducts(){
			
			prdList = prdDAO.GetAllProducts();
			
			return "SUCCESS";
		}
		
		public void  GetFilteredData() throws IOException{
			
			ServletActionContext.getResponse().setContentType("application/json");
		    PrintWriter responseStream = ServletActionContext.getResponse().getWriter();
		    System.out.println(filter);
		    
		    List<Product> prodList = new ArrayList<Product>();
		    Product prd = new Product();
		    prd.setProdDesc("arpit");
		    prodList.add(prd);
		    Set<Product> prdSet  = new HashSet<Product>(prodList);
		    prodList = new ArrayList<Product>(prdSet);
		   
		    responseStream.write("success");
		}
		
		
		public List<Product> getPrdList() {
			return prdList;
		}
		public void setPrdList(List<Product> prdList) {
			this.prdList = prdList;
		}

		public String getFilter() {
			return filter;
		}

		public void setFilter(String filter) {
			this.filter = filter;
		}
}
