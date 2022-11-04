package com.poly.serviceImplement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.entity.Category;
import com.poly.repository.CategoryRepository;
import com.poly.service.CategoryService;

@Service
public class CategoryServiceImplement implements CategoryService{
	@Autowired
	CategoryRepository categoryDAO;

	@Override
	public List<Category> findAll() {
		return categoryDAO.findAll();
	}
	
}
