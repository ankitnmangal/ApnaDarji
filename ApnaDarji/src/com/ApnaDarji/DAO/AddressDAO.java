/**
 * 
 */
package com.ApnaDarji.DAO;

import java.util.List;

import com.ApnaDarji.Model.Address;
import com.ApnaDarji.Model.Product;

/**
 * @author shekhawd
 *
 */
public interface AddressDAO {
	
	
	public List<Address> getAllAddresses(long userId);
	public void addAddress(Address address, long userId);
	public boolean updateAddress(Address address,long userId);
	public boolean deleteAddress(long userId, long addrId);
	

}
