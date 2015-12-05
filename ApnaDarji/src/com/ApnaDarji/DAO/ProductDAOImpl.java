package com.ApnaDarji.DAO;

import java.util.ArrayList;

import org.apache.log4j.Logger;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ApnaDarji.Hibernate.SessionProvider;
import com.ApnaDarji.Model.Product;

public class ProductDAOImpl implements ProductDAO{

	private static final Logger logger = Logger.getLogger(ProductDAOImpl.class);
	@Override
	public List<Product> GetAllProducts() {
		logger.error("In get all products method");
		List<Product> prdList= new ArrayList<Product>();
		
		System.out.println("taking session");
		//get connection from session factory............
		Session session = SessionProvider.getSession();
		Transaction tx = null;
		if(session == null){
			System.out.println("session is null");
			 logger.error("session is null");
		}
		else{
			System.out.println("got session");
			logger.error(" got session");
		}
		
		try 
		{
			System.out.println("begin transaction");
			logger.error("begin transaction");
		   tx = session.beginTransaction();
		   // do some work
		   System.out.println("creating query");
		   logger.error("creating query");
		   Query query = session.createQuery("FROM Product");
		    prdList = query.list();
		    System.out.println("query created");
		    logger.error("query created"+query);
		    logger.error(prdList);
			   tx.commit();
			   if(prdList==null)
			   {
				  Product prd =  new Product();
				  prd.setpID(654l);
				  logger.error("product list null");
				  prdList = new ArrayList<Product>();
				  prdList.add(prd);
				  System.out.println("NO Product Available");
			   }
		}
		catch (Exception e) 
		{
			
		   if (tx!=null) tx.rollback();
		   e.printStackTrace(); 
		   logger.error("LOG4J ERROR IN GET_ALL_PRODUCTS:"+e.toString(),e);
		   
		}
		finally 
		{
		   session.close();
		}
	
		// TODO Auto-generated method stub
		return prdList;
	}
	@Override
	public Product getProductByProdId(String prodId) {
		Product prod = new Product();

		System.out.println("taking session");
		//get connection from session factory............
		Session session = SessionProvider.getSession();
		Transaction tx = null;
		if(session == null){
			System.out.println("session is null");
		}
		else{
			System.out.println("got session");
		}
		
		try 
		{
			System.out.println("begin transaction");
		   tx = session.beginTransaction();
		   // do some work
		   System.out.println("creating query");
		   Query query = session.createQuery("FROM Product p where p.prodId=:prodId");
		   query.setString("prodId", prodId);
		    prod = (Product) query.uniqueResult();
		    System.out.println("query created");
			   tx.commit();
			   if(prod==null)
			   {
				  System.out.println("NO Product Available");
			   }
		}
		catch (Exception e) 
		{
			
		   if (tx!=null) tx.rollback();
		   e.printStackTrace(); 
		   
		}
		finally 
		{
		   session.close();
		}
	
		return prod;
	}

	
	
}
