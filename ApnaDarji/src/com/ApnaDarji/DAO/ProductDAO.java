package com.ApnaDarji.DAO;

import java.util.List;

import com.ApnaDarji.Model.Product;

public interface ProductDAO {
	
	
	List<Product> GetAllProducts();

	Product getProductByProdId(String prodId);
	
	

}
