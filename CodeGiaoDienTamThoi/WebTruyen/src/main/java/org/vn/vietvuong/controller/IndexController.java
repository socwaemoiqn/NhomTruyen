package org.vn.vietvuong.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
  @RequestMapping("/")
  public String hello() {
	 return "index";
  }
  @RequestMapping("/login")
  public String login(HttpServletRequest request)
  {
	  List<String> list = new ArrayList<>();
	  list.add("viet12asas");
	  list.add("dsada");
	  request.setAttribute("list", list);
	  request.setAttribute("message", "Sai tài khoản hoặc mật khẩu");
	  return "index";
  }
}
