package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Authencation;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.DanhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TaiKhoanEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;

@Controller(value = "HomeControllerOfAdmin")
@RequestMapping(value = "/quan-tri")
public class HomeController {

	@Autowired
	private DanhMucTruyenDAO danhMucTruyenDAO;

	@Autowired
	private TheLoaiTruyenDAO theLoaiTruyenDAO;


	@RequestMapping(value = { "/*", "home", "" }, method = RequestMethod.GET)
	public String indexAdminPage(HttpServletRequest request) {
		String urlRedirect =  !Authencation.Auth(request,1) ? "redirect:/" : "admin/home";
		return urlRedirect;
	}

	


	

	@RequestMapping(value = "/ql-nhomdich", method = RequestMethod.GET)
	public String QlNhomDichPage(Model model) {
			
		return "admin/ql_nhomdich";
	}



	

}
