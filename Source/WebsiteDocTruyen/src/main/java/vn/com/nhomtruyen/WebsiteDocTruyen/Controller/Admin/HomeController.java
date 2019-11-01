package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.DanhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TacGiaDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Form.TruyenAddForm;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietDanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TacGiaInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TruyenSelectInfo;

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

	@RequestMapping(value = "/ql_danhmuc_truyen", method = RequestMethod.GET)
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

	@RequestMapping(value = "/ql_theloai_truyen", method = RequestMethod.GET)
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

	@RequestMapping(value = "/ql_truyen", method = RequestMethod.GET)
	public String QlTruyenPage(Model model, @RequestParam(value = "page", defaultValue = "1") String pageStr) {
		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 2;
		final int Max_Navigation = 3;

		PaginationResult<TruyenSelectInfo> listTruyen = truyenDao.litsTruyen(page, Max_Result, Max_Navigation);

		model.addAttribute("listTruyen", listTruyen);

		List<ChiTietDanhMucTruyenInfo> dmtruyen = danhMucTruyenDAO.listTenDM();
		model.addAttribute("dmt", dmtruyen);
		TruyenAddForm truyen = new TruyenAddForm();
		model.addAttribute("truyenAddForm", truyen);

		return "admin/ql_truyen";
	}

	@RequestMapping(value = "/ql_nhomdich", method = RequestMethod.GET)
	public String QlNhomDichPage(Model model) {

		return "admin/ql_nhomdich";
	}

	@RequestMapping(value = "/ql_tacgia", method = RequestMethod.GET)
	public String QlTacGiaPage(Model model) {

		return "admin/ql_tacgia";
	}

	@ModelAttribute("danhMuc")
	public List<DanhMucTruyenInfo> getDanhMuc() {
		List<DanhMucTruyenInfo> danhMuc = danhMucTruyenDAO.dsDanhMucTruyen();
		return danhMuc;
	}

	@ModelAttribute("tacGia")
	public List<TacGiaInfo> getTacGia() {
		List<TacGiaInfo> tacGia = tacGiaDao.listTacGia();
		return tacGia;
	}

	@ModelAttribute("theLoai")
	public List<TheLoaiTruyenInfo> getTheLoai() {
		List<TheLoaiTruyenInfo> theLoai = theLoaiTruyenDAO.dsTheLoai();
		return theLoai;
	}

}
