package vn.com.nhomtruyen.WebsiteDocTruyen.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.ChuongDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.DanhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TaiKhoanDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietDanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietTheLoaiTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChuongInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.SelectTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;

@Controller
public class HomeController {

	@Autowired
	private TaiKhoanDAO userAccountsDAO;
	@Autowired
	private TruyenDAO truyenDao;
	@Autowired
	private DanhMucTruyenDAO dmtruyenDao;
	@Autowired
	private ChuongDAO chuongDao;
	@Autowired
	private TheLoaiTruyenDAO theLoaiTruyenDao;

	public void loadTheLoaiAndDanhMucTruyen(Model model) {
		List<DanhMucTruyenInfo> danhMuc = dmtruyenDao.dsDanhMucTruyen();
		List<TheLoaiTruyenInfo> theLoaiTruyen = theLoaiTruyenDao.dsTheLoai();

		Map<String, Integer> urlTheLoai = new HashMap<String, Integer>();
		for (TheLoaiTruyenInfo tl : theLoaiTruyen) {
			urlTheLoai.put(Helper.pathVariableString(tl.getTenTheLoai()), tl.getId());
		}
		// get truyen full, hot moi
		List<SelectTruyenInfo> listTruyenFull = truyenDao.selectAllTruyenByDanhMuc("full");
		List<SelectTruyenInfo> listTruyenHot = truyenDao.selectAllTruyenByDanhMuc("hot");
		List<SelectTruyenInfo> listTruyenNew = truyenDao.selectAllTruyenByDanhMuc("news");
		Map<String, String> listUrlTruyen = truyenDao.listPathVariableString();

		model.addAttribute("danhMuc", danhMuc);
		model.addAttribute("theLoaiTruyen", theLoaiTruyen);

		model.addAttribute("truyenFull", listTruyenFull);
		model.addAttribute("truyenHot", listTruyenHot);
		model.addAttribute("truyenNew", listTruyenNew);
		model.addAttribute("urlTruyen", listUrlTruyen);
		model.addAttribute("urlTheLoai", urlTheLoai);

		int sltl = theLoaiTruyen.size();
		model.addAttribute("sltl", sltl);
	}

	@RequestMapping(value = { "/", "index", "home" }, method = RequestMethod.GET)
	public String indexPage(Model model, HttpServletRequest request) {
		// load phần thể loại truyện và danh mục truyện từ csdl
		loadTheLoaiAndDanhMucTruyen(model);
		// get list truyện
		List<SelectTruyenInfo> truyen = truyenDao.listTruyen();
		// Map<String, String> listUrl = truyenDao.listPathVariableString();

		// get ten the loai de add vao thong tin truyen
		List<ChiTietTheLoaiTruyenInfo> tenTheLoai = theLoaiTruyenDao.dsTenTheLoai();

		// tinh ngay truoc cua truyen
		String ngayhethong = Helper.getCurrentDateAndTime();
		Map<String, String> mapNgayTruoc = new HashMap<String, String>();

		for (SelectTruyenInfo tr : truyen) {
			String ngay = tr.getNgayTao();
			String truoc = Helper.compareTime(ngay, ngayhethong);
			mapNgayTruoc.put(tr.getID(), truoc);
		}

		// get truyen full,hot,news

		List<SelectTruyenInfo> listTruyenFull = truyenDao.selectAllTruyenByDanhMuc("full");

		model.addAttribute("truyen", truyen);
		// model.addAttribute("url", listUrl);

		model.addAttribute("truoc", mapNgayTruoc);
		model.addAttribute("tenTheLoai", tenTheLoai);
		model.addAttribute("truyenFull", listTruyenFull);
		return "index";
	}

	@RequestMapping(value = "/{tenTruyen}", method = RequestMethod.GET)
	public String truyenPage(Model model, @PathVariable("tenTruyen") String tenTruyen,@RequestParam(value = "page", defaultValue = "1") String pageStr) {

		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 1;
		final int Max_Navigation = 10;
		
		Map<String, String> urlTruyen = truyenDao.listPathVariableString();
		String maTruyen = urlTruyen.get(tenTruyen);

		SelectTruyenInfo tr = truyenDao.selectTruyenByMa(maTruyen);
		List<ChiTietDanhMucTruyenInfo> ctdm = dmtruyenDao.listTenDMByMaTruyen(maTruyen);
		 PaginationResult<ChuongInfo> listPaginationChuong= chuongDao.listChuongOfTruyen(maTruyen, page, Max_Result, Max_Navigation);
		List<SelectTruyenInfo> truyenCungTacGia = truyenDao.selectAllTruyenByTacGia(tr.getTenTacGia());
		List<ChuongInfo> listChuong = chuongDao.listChuongOfTruyenSortASC(maTruyen);
		Map<String, String> urlChuong = new HashMap<String, String>();
		int i = 1;
		for (ChuongInfo ch : listChuong) {
			urlChuong.put(ch.getId(), Helper.pathVariableString(i+""));
			i++;
		}

		// Map<String, String> urlChuong = chuongDao.listPathVariableString(maTruyen);

		List<ChiTietTheLoaiTruyenInfo> tenTheLoai = theLoaiTruyenDao.dsTenTheLoai();

		model.addAttribute("truyenById", tr);
		model.addAttribute("dmById", ctdm);
		model.addAttribute("listChuong", listPaginationChuong);
		model.addAttribute("truyenCungTacGia", truyenCungTacGia);
		model.addAttribute("urlChuong", urlChuong);
		model.addAttribute("tenTruyen", tenTruyen);
		model.addAttribute("tenTheLoai", tenTheLoai);
		model.addAttribute("urlTacGia", Helper.pathVariableString(tr.getTenTacGia()));

		loadTheLoaiAndDanhMucTruyen(model);

		return "info_truyen";
	}

	@RequestMapping(value = "/{tenTruyen}/{chuongSo}", method = RequestMethod.GET)
	public String chuongPage(Model model, @PathVariable("tenTruyen") String tenTruyen,
			@PathVariable("chuongSo") String chuongSo) {

		Map<String, String> urlTruyen = truyenDao.listPathVariableString();
		String maTruyen = urlTruyen.get(tenTruyen);
		SelectTruyenInfo truyen = truyenDao.selectTruyenByMa(maTruyen);

		List<ChuongInfo> listChuong = chuongDao.listChuongOfTruyenSortASC(maTruyen);
		Map<String, String> urlChuong = new HashMap<String, String>();
		int i = 1;
		for (ChuongInfo ch : listChuong) {
			urlChuong.put(Helper.pathVariableString("Chuong " + i), ch.getId());
			i++;
		}

		String idChuong = urlChuong.get(chuongSo);

		String[] output = chuongSo.split("-");
		int chuongHienTai = Integer.parseInt(output[1]);
		int chuongTruoc = chuongHienTai - 1;
		int chuongSau = chuongHienTai + 1;

		model.addAttribute("chuongSau", chuongSau);
		model.addAttribute("chuongTruoc", chuongTruoc);

		ChuongInfo chuongOfId = chuongDao.chuongInfo(idChuong);
		model.addAttribute("noiDung", chuongOfId.getNoiDung());
		model.addAttribute("tieuDe", chuongOfId.getTieuDe());
		model.addAttribute("listChuong", urlChuong);
		model.addAttribute("tenTR", truyen.getTenTruyen());
		model.addAttribute("tenUrlTruyen", tenTruyen);
		model.addAttribute("chuongHienTai", chuongHienTai);
		loadTheLoaiAndDanhMucTruyen(model);
		return "xem_chuong";
	}

	@RequestMapping(value = "/danh-muc/{danh-muc}", method = RequestMethod.GET)
	public String danhMucPage(Model model, @PathVariable("danh-muc") String tenDanhMucPath) {
		loadTheLoaiAndDanhMucTruyen(model);

		List<SelectTruyenInfo> listTruyenByDanhMuc = null;
		String gioiThieu = "";
		String tenDanhMuc="";
		if (tenDanhMucPath.equals("truyen-full")) {
			listTruyenByDanhMuc = truyenDao.selectAllTruyenByDanhMuc("full");
			gioiThieu = "Danh sách những truyện đã full, có nhiều người đọc và quan tâm nhất.";
			tenDanhMuc="Truyện Full";
		}
		if (tenDanhMucPath.equals("truyen-hot")) {
			listTruyenByDanhMuc = truyenDao.selectAllTruyenByDanhMuc("hot");
			gioiThieu = "Danh sách những truyện đang hot, có nhiều người đọc và quan tâm nhất trong tháng này.";
			tenDanhMuc="Truyện Hot";
		}
		if (tenDanhMucPath.equals("truyen-news")) {
			listTruyenByDanhMuc = truyenDao.selectAllTruyenByDanhMuc("news");
			gioiThieu = "Danh sách những truyện mới cập nhật.";
			tenDanhMuc="Truyện News";
		}
		model.addAttribute("danhMucTruyen", listTruyenByDanhMuc);
		model.addAttribute("gioiThieu", gioiThieu);
		model.addAttribute("tenDanhMuc",tenDanhMuc);
		return "danh_muc";
	}

	@RequestMapping(value = "/the-loai/{the-loai}", method = RequestMethod.GET)
	public String theLoaiPage(Model model, @PathVariable("the-loai") String tenTheLoai) {
		loadTheLoaiAndDanhMucTruyen(model);

		List<TheLoaiTruyenInfo> theLoaiTruyen = theLoaiTruyenDao.dsTheLoai();
		Map<String, String> urlTheLoai = new HashMap<String, String>();
		Map<String, String> gioiThieuTheLoai = new HashMap<String, String>();
		for (TheLoaiTruyenInfo tl : theLoaiTruyen) {
			urlTheLoai.put(Helper.pathVariableString(tl.getTenTheLoai()), tl.getTenTheLoai());
			gioiThieuTheLoai.put(Helper.pathVariableString(tl.getTenTheLoai()), tl.getGioiThieu());
		}

		String tenTL = urlTheLoai.get(tenTheLoai);
		String gioiThieu = gioiThieuTheLoai.get(tenTheLoai);
		List<SelectTruyenInfo> listTl = truyenDao.selectAllTheLoaiTruyen(tenTL);

		model.addAttribute("listTheLoai", listTl);
		model.addAttribute("tenTheLoai", tenTL);
		model.addAttribute("gioiThieuTheLoai", gioiThieu);

		return "the-loai";
	}
	
	@RequestMapping(value = "/tac-gia/{tacGia}", method = RequestMethod.GET)
	public String tacGiaPage(Model model, @PathVariable("tacGia") String tenTacGia) {
		loadTheLoaiAndDanhMucTruyen(model);

	
		return "the-loai";
	}
	
	

	@RequestMapping("/tim-kiem")
	public String searchPage(Model model, @RequestParam("tu-khoa") String tuKhoa) {
		loadTheLoaiAndDanhMucTruyen(model);
		List<SelectTruyenInfo> listTruyenTimKiem = truyenDao.searchTruyen(tuKhoa);

		model.addAttribute("listTruyenSearch", listTruyenTimKiem);
		model.addAttribute("tuKhoa", tuKhoa);
		return "search";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPage(Model model, @RequestParam("userName") String userName,
			@RequestParam("passWord") String passWord, HttpSession session) {
//		String request = "";
//		// userAccountsInfo user = userAccountsDAO.login(userName, passWord);
//		TaiKhoanInfo tk = userAccountsDAO.ck_login(userName, passWord);
//		if (tk != null) {
//			String role = tk.getTenRole();
//			if (role.equals("Admin")) {
//				session.setAttribute("admin", tk);
//				request = "redirect:/quan-tri";
//			} else if (role.equals("tlt")) {
//				session.setAttribute("tlt", tk);
//				request = "redirect:/nhom-dich";
//			} else {
//				session.setAttribute("client", tk);
//				request = "redirect:/user_Info";
//			}
//
//		} else {
//			model.addAttribute("loi", "loi");
//			request = "redirect:/index";
//		}
		return "";

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(Model model) {
		return "redirect:/index";
	}

	@RequestMapping(value = "/user_Info", method = RequestMethod.GET)
	public String userInfoPage(Model model) {
		return "user_info";
	}

}
