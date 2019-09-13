package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller(value = "QL_DanhMucTruyenControllerOfAdmin")
@RequestMapping(value = "/quan-tri/ql_danhmuc_truyen")
public class QL_DanhMucTruyenController {
	
	@RequestMapping(value = "/them", method = RequestMethod.POST)
	public String themDMTruyenPage() {
		
		
		return "redirect:/quan-tri/ql_danhmuc_truyen";
	}
}
