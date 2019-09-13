package vn.com.nhomtruyen.WebsiteDocTruyen.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = {"/", "index"}, method = RequestMethod.GET)
	public String indexPage(Model model) {
		return "index";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(Model model) {
		return "redirect:/index";
	}
}
