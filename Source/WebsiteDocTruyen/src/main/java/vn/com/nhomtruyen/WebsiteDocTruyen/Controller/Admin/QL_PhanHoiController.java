package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("quan-tri/phan-hoi")
public class QL_PhanHoiController {
	@RequestMapping("")
	public String phanHoiPage(Model model,@RequestParam(value = "page", defaultValue = "1")String pageStr)
	{
		return "admin/ql_phanhoi";
	}
}
