package vn.com.nhomtruyen.WebsiteDocTruyen.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {
	@RequestMapping("/search")
	public String searchPage()
	{
		return "search";
	}
}
