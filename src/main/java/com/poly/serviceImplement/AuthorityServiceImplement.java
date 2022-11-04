package com.poly.serviceImplement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.entity.Account;
import com.poly.entity.Authority;
import com.poly.repository.AccountRepository;
import com.poly.repository.AuthorityRepository;
import com.poly.service.AuthorityService;

@Service
public class AuthorityServiceImplement implements AuthorityService{
	@Autowired
	AuthorityRepository dao;
	@Autowired
	AccountRepository acDao;

	
	public Authority create(Authority auth) {
		return dao.save(auth);
	}


	
	public List<Authority> findAll() {
		
		return dao.findAll();
	}


	
	public void delete(Integer id) {
		dao.deleteById(id);
	}
	
	public List<Authority> findAuthoritiesOfAdministrators() {
		List<Account> accounts = acDao.getAdministrators();
		return dao.authoritiesOf(accounts);
	}
}
