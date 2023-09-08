package com.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import com.dao.TodoDao;
import com.model.Todo;

@Controller
public class HomeController {

	@Autowired
	private TodoDao todoDao;
	
	@RequestMapping(path="/home",method=RequestMethod.GET)
	public String home(Model m) {
		
		String str="home";
		m.addAttribute("page", str);
		List<Todo> allTodo = this.todoDao.getAllTodos();
		m.addAttribute("todos",allTodo );
		return "home";
	}
	
	@RequestMapping("/add")
	public String addTodo(Model m)
	{
		Todo t = new Todo();
		m.addAttribute("page","add");
		m.addAttribute("Todo", t);
		
		return "home";
	}
	@RequestMapping(path="/saveTodo" , method=RequestMethod.POST)
	public RedirectView saveToDo(@ModelAttribute("Todo")Todo t  ,Model m,HttpServletRequest request)
	{
		System.out.println(t);
		t.setTodoDate(new Date());
		this.todoDao.saveTodo(t);
		
		RedirectView redirect = new RedirectView();
		redirect.setUrl(request.getContextPath()+"/home");
	
		return redirect;
	}
}
