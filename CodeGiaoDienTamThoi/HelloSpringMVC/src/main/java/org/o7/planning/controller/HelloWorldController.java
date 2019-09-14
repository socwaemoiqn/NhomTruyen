package org.o7.planning.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
 
@Controller
public class HelloWorldController {
 
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public String index(Model model)
	{
		model.addAttribute("name","Việt Vương");
		return "index";
	}
	@RequestMapping(value = "/home",method = RequestMethod.GET)
	@ResponseBody
	public String index2(Model model)
	{
		
		return "<script>alert('This is home page');location.href='/HelloSpringMVC'</script>";
	}
}