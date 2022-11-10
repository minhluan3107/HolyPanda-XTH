package com.poly.service;

import java.util.List;

import com.poly.entity.Account;
import com.poly.entity.Product;

public interface AccountService {
	
	public Account findById(String username);

	public List<Account> getAdministrators();

	public List<Account> findAll();
	
	
}
