package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.danhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.danhMucTruyenInfo;

@Controller(value = "HomeControllerOfAdmin")
@RequestMapping(value = "/quan-tri")
public class HomeController {
	
	@Autowired
	private danhMucTruyenDAO danhMucTruyenDAO;
	
	@RequestMapping(value = {"/","home", ""}, method = RequestMethod.GET)
	public String indexAdminPage(Model model) {
		return "admin/home";
	}
	@RequestMapping(value = "/ql_danhmuc_truyen", method = RequestMethod.GET)
	public String QlDanhMucTruyenPage(Model model) {
		
		List<danhMucTruyenInfo> listDanhMuc= danhMucTruyenDAO.dsDanhMucTruyen();
		model.addAttribute("danhMucTruyen", listDanhMuc);
		
		return "admin/danhmuctruyen";
	}

	@RequestMapping(value = "/ql_theloai_truyen", method = RequestMethod.GET)
	public String QlTheLoaiTruyenPage(Model model) {
		
		
		
		return "admin/ql_theloaitruyen";
	}
	@RequestMapping(value = "/ql_truyen", method = RequestMethod.GET)
	public String QlTruyenPage(Model model) {
		
		
		return "admin/ql_truyen";
	}
	@RequestMapping(value = "/ql_nhomdich", method = RequestMethod.GET)
	public String QlNhomDichPage(Model model) {
		
		
		return "admin/ql_nhomdich";
	}
	
}
