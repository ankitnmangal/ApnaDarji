/**
 * 
 */
package com.ApnaDarji.Model;

/**
 * @author DASHARATH1992
 *
 */
public class CustomizedProducts {

	
	private int ProductID;
	private String Prod_Color;
	private String Prod_Image_Path;
	/**
	 * @return the prod_Image_Path
	 */
	public String getProd_Image_Path() {
		return Prod_Image_Path;
	}
	/**
	 * @param prod_Image_Path the prod_Image_Path to set
	 */
	public void setProd_Image_Path(String prod_Image_Path) {
		Prod_Image_Path = prod_Image_Path;
	}
	/**
	 * @return the productID
	 */
	public int getProductID() {
		return ProductID;
	}

	/**
	 * @return the prod_Color
	 */
	public String getProd_Color() {
		return Prod_Color;
	}
	/**
	 * @param productID the productID to set
	 */
	public void setProductID(int productID) {
		ProductID = productID;
	}
	/**
	 * @param prod_Color the prod_Color to set
	 */
	public void setProd_Color(String prod_Color) {
		Prod_Color = prod_Color;
	}
}
