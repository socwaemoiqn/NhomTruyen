package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.DanhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TacGiaDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TacGiaInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;

@Controller(value = "HomeControllerOfAdmin")
@RequestMapping(value = "/quan-tri")
public class HomeController {

	@Autowired
	private DanhMucTruyenDAO danhMucTruyenDAO;

	@Autowired
	private TheLoaiTruyenDAO theLoaiTruyenDAO;

	@Autowired
	private TruyenDAO truyenDao;

	@Autowired
	private TacGiaDAO tacGiaDao;

	@RequestMapping(value = { "/", "home", "" }, method = RequestMethod.GET)
	public String indexAdminPage(Model model) {
		return "admin/home";
	}

	@RequestMapping(value = "/ql-danhmuc-truyen", method = RequestMethod.GET)
	public String QlDanhMucTruyenPage(Model model, @RequestParam(value = "page", defaultValue = "1") String pageStr) {

		// List<danhMucTruyenInfo> listDanhMuc= danhMucTruyenDAO.dsDanhMucTruyen();

		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 2;
		final int Max_Navigation = 2;
		PaginationResult<DanhMucTruyenInfo> listDanhMuc = danhMucTruyenDAO.listDanhMucTruyen(page, Max_Result,
				Max_Navigation);

		model.addAttribute("danhMucTruyen", listDanhMuc);

		return "admin/ql_danhmuctruyen";
	}

	@RequestMapping(value = "/ql-theloai-truyen", method = RequestMethod.GET)
	public String QlTheLoaiTruyenPage(Model model, @RequestParam(value = "page", defaultValue = "1") String pageStr) {
		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 3;
		final int Max_Navigation = 4;

		PaginationResult<TheLoaiTruyenInfo> listTheLoaiTruyen = theLoaiTruyenDAO.listTheLoaiTruyen(page, Max_Result,
				Max_Navigation);

		model.addAttribute("listTheLoaiTruyen", listTheLoaiTruyen);

		return "admin/ql_theloaitruyen";
	}

	

	@RequestMapping(value = "/ql-nhomdich", method = RequestMethod.GET)
	public String QlNhomDichPage(Model model) {
			
		return "admin/ql_nhomdich";
	}



	

}
