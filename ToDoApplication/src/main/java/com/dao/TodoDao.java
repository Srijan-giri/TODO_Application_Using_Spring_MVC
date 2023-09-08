package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.model.Todo;

@Component
public class TodoDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public void saveTodo(Todo t)
	{
		this.hibernateTemplate.saveOrUpdate(t);
	}
	
	public List<Todo> getAllTodos(){
		return this.hibernateTemplate.loadAll(Todo.class);
	}
}
