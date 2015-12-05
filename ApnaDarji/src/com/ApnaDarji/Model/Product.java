package com.ApnaDarji.Model;

public class Product {

	private long pID;
	private String prodId;
	private String prdType;
	private char inStock;	
	private String prodDesc;
	private int prodPrice;
	private int prodPriceIncldDisc;
	private String prdColor;	
	private String prdImg;	
	private String company_Quality_Type;
	private String grpId;
	private String fabric_Quality_Type;
	private String materialType;
	private String brand;

	public long getpID() {
		return pID;
	}
	public String getProdId() {
		return prodId;
	}
	public String getPrdType() {
		return prdType;
	}
	public char getInStock() {
		return inStock;
	}
	public String getProdDesc() {
		return prodDesc;
	}
	public int getProdPrice() {
		return prodPrice;
	}
	public String getPrdColor() {
		return prdColor;
	}
	public String getPrdImg() {
		return prdImg;
	}
	public String getCompany_Quality_Type() {
		return company_Quality_Type;
	}
	public String getGrpId() {
		return grpId;
	}
	public String getFabric_Quality_Type() {
		return fabric_Quality_Type;
	}
	public void setpID(long pID) {
		this.pID = pID;
	}
	public void setProdId(String prodId) {
		this.prodId = prodId;
	}
	public void setPrdType(String prdType) {
		this.prdType = prdType;
	}
	public void setInStock(char inStock) {
		this.inStock = inStock;
	}
	public void setProdDesc(String prodDesc) {
		this.prodDesc = prodDesc;
	}
	
	public void setPrdColor(String prdColor) {
		this.prdColor = prdColor;
	}
	public void setPrdImg(String prdImg) {
		this.prdImg = prdImg;
	}
	public void setCompany_Quality_Type(String company_Quality_Type) {
		this.company_Quality_Type = company_Quality_Type;
	}
	public void setGrpId(String grpId) {
		this.grpId = grpId;
	}
	public void setFabric_Quality_Type(String fabric_Quality_Type) {
		this.fabric_Quality_Type = fabric_Quality_Type;
	}
	public int getProdPriceIncldDisc() {
		return prodPriceIncldDisc;
	}
	public void setProdPriceIncldDisc(int prodPriceIncldDisc) {
		this.prodPriceIncldDisc = prodPriceIncldDisc;
	}
	public String getMaterialType() {
		return materialType;
	}
	public String getBrand() {
		return brand;
	}
	public void setMaterialType(String materialType) {
		this.materialType = materialType;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}
	
	
}

	
	
