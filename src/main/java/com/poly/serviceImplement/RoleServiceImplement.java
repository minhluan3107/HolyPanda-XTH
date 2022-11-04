package com.poly.serviceImplement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.entity.Role;
import com.poly.repository.RoleRepository;
import com.poly.service.RoleService;

@Service
public class RoleServiceImplement implements RoleService{
	@Autowired
	RoleRepository roleDAO;

	@Override
	public List<Role> getAll() {
	
		return roleDAO.findAll();
	}
	
	
}
