/**
 * 
 */
package com.ApnaDarji.DAO;

import com.ApnaDarji.Model.CustomizedProducts;

/**
 * @author DASHARATH1992
 *
 */
public interface CustomizedProductsDAO {
	public CustomizedProducts getCustomizedProducts(int userId);
	public void addCustomizedProducts(CustomizedProducts CustomizedProduct, String userId);

}
