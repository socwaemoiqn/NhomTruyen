package vn.com.nhomtruyen.WebsiteDocTruyen.Controller;

import java.net.HttpCookie;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.ChuongDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.DanhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.LuotXemDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TacGiaDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TaiKhoanDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TaiKhoanEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietDanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietTheLoaiTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChuongInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.LuotXemModel;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.SelectTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TacGiaInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TaiKhoanInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;

@Controller
public class HomeController {

	@Autowired
	private TaiKhoanDAO taiKhoanDAO;
	@Autowired
	private TruyenDAO truyenDao;
	@Autowired
	private DanhMucTruyenDAO dmtruyenDao;
	@Autowired
	private ChuongDAO chuongDao;
	@Autowired
	private TheLoaiTruyenDAO theLoaiTruyenDao;
	@Autowired
	private TacGiaDAO tacGiaDao;
	@Autowired
	private LuotXemDAO luotXemDAO;

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
		for (SelectTruyenInfo selectTruyenInfo : truyen) {
			selectTruyenInfo.setUrlTruyen(Helper.pathVariableString(selectTruyenInfo.getTenTruyen()));
			String tenTheLoai = "";
			List<ChiTietTheLoaiTruyenInfo> listTheLoaiByTruyen = theLoaiTruyenDao
					.listTenTlOfTruyen(selectTruyenInfo.getID());
			for (ChiTietTheLoaiTruyenInfo tl : listTheLoaiByTruyen) {
				tenTheLoai += tl.getTenTheLoai() + ", ";
			}
			selectTruyenInfo.setTheLoaiTruyen(Helper.subString(tenTheLoai));
		}

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
		model.addAttribute("truoc", mapNgayTruoc);
		model.addAttribute("truyenFull", listTruyenFull);
		return "index";
	}

	@RequestMapping(value = "/select-top-10", method = RequestMethod.POST)
	public @ResponseBody String selectTop10(HttpServletRequest request)
			throws JsonProcessingException, ClassNotFoundException, SQLException {
		String typeTime = request.getParameter("typeTime");

		List<SelectTruyenInfo> listTop10Truyen = new ArrayList<SelectTruyenInfo>();
		Calendar cal = Calendar.getInstance();
		String timeStart, timeEnd;
		switch (typeTime) {
		case "all":
			listTop10Truyen = truyenDao.selectTop10TruyenByLuotXem();

			break;
		case "day":
			timeStart = Helper.getToday() + " 00:00:00";
			timeEnd = Helper.getToday() + " 23:59:00";
			listTop10Truyen = truyenDao.selectTop10TruyenByLuotXem(timeStart, timeEnd);
			break;
		case "month":
			timeStart = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 1) + "" + "/"
					+ cal.getActualMinimum(Calendar.DATE) + " 00:00:00";
			timeEnd = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 1) + "" + "/"
					+ cal.getActualMaximum(Calendar.DATE) + " 23:59:00";
			listTop10Truyen = truyenDao.selectTop10TruyenByLuotXem(timeStart, timeEnd);
			break;
		default:
			break;
		}
		ObjectMapper mapper = new ObjectMapper();
		for (SelectTruyenInfo selectTruyenInfo : listTop10Truyen) {
			String urlTruyen = Helper.pathVariableString(selectTruyenInfo.getTenTruyen());
			List<ChiTietTheLoaiTruyenInfo> listTheLoai = theLoaiTruyenDao.listTenTlOfTruyen(selectTruyenInfo.getID());
			String strTheLoaiTruyen = "";
			for (ChiTietTheLoaiTruyenInfo chiTietTL : listTheLoai) {
				strTheLoaiTruyen += chiTietTL.getTenTheLoai() + ", ";
			}
			strTheLoaiTruyen = strTheLoaiTruyen.substring(0, strTheLoaiTruyen.length() - 2);
			selectTruyenInfo.setUrlTruyen(urlTruyen);
			selectTruyenInfo.setTheLoaiTruyen(strTheLoaiTruyen);
		}
		String json = mapper.writeValueAsString(listTop10Truyen);
		return json;
	}

	@RequestMapping(value = "/{tenTruyen}", method = RequestMethod.GET)
	public String truyenPage(Model model, HttpSession session, @PathVariable("tenTruyen") String tenTruyen,
			@RequestParam(value = "page", defaultValue = "1") String pageStr) {

		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 10;
		final int Max_Navigation = 5;

		Map<String, String> urlTruyen = truyenDao.listPathVariableString();
		String maTruyen = urlTruyen.get(tenTruyen);

		SelectTruyenInfo tr = truyenDao.selectTruyenByMa(maTruyen);
		List<ChiTietTheLoaiTruyenInfo> listTheLoai = theLoaiTruyenDao.listTenTlOfTruyen(maTruyen);
		String tenTheLoai = "";
		for (ChiTietTheLoaiTruyenInfo chiTiet : listTheLoai) {
			tenTheLoai += chiTiet.getTenTheLoai() + ", ";
		}
		tr.setTheLoaiTruyen(Helper.subString(tenTheLoai));

		List<ChiTietDanhMucTruyenInfo> ctdm = dmtruyenDao.listTenDMByMaTruyen(maTruyen);
		String sort = "ASC";
		PaginationResult<ChuongInfo> listPaginationChuong = chuongDao.listChuongOfTruyen(maTruyen, sort, page,
				Max_Result, Max_Navigation);
		List<SelectTruyenInfo> truyenCungTacGia = truyenDao.selectAllTruyenByTacGia(tr.getTenTacGia());
		List<ChuongInfo> listChuong = chuongDao.listChuongOfTruyenSortASC(maTruyen);
		List<ChuongInfo> listChuongMoi = chuongDao.listChuongOfTruyenSortDESC(maTruyen);
		Map<String, String> urlChuong = new HashMap<String, String>();
		int i = 1;
		for (ChuongInfo ch : listChuong) {
			urlChuong.put(ch.getId(), Helper.pathVariableString(i + ""));
			i++;
		}
		model.addAttribute("truyenById", tr);
		model.addAttribute("dmById", ctdm);
		model.addAttribute("listChuong", listPaginationChuong);
		model.addAttribute("truyenCungTacGia", truyenCungTacGia);
		model.addAttribute("urlChuong", urlChuong);
		model.addAttribute("tenTruyen", tenTruyen);
		model.addAttribute("urlTacGia", Helper.pathVariableString(tr.getTenTacGia()));
		model.addAttribute("chuongMoi", listChuongMoi);

		session.setAttribute("truyenVuaDoc", tr);

		loadTheLoaiAndDanhMucTruyen(model);

		return "info_truyen";
	}

	@RequestMapping(value = "/{tenTruyen}/{chuongSo}", method = RequestMethod.GET)
	public String chuongPage(Model model, @PathVariable("tenTruyen") String tenTruyen,
			@PathVariable("chuongSo") String chuongSo, HttpSession session,HttpServletRequest request) {

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

		// get truyện vừa đọc.

		model.addAttribute("chuongSau", chuongSau);
		model.addAttribute("chuongTruoc", chuongTruoc);
		
		ChuongInfo chuongOfId = chuongDao.chuongInfo(idChuong);
		model.addAttribute("maTruyen", chuongOfId.getIDTruyen());
		model.addAttribute("noiDung", chuongOfId.getNoiDung());
		model.addAttribute("tieuDe", chuongOfId.getTieuDe());
		model.addAttribute("listChuong", urlChuong);
		model.addAttribute("tenTR", truyen.getTenTruyen()); 
		model.addAttribute("tenUrlTruyen", tenTruyen);
		model.addAttribute("chuongHienTai", chuongHienTai);
		loadTheLoaiAndDanhMucTruyen(model);
		Map<String, String> object_readed = new HashMap<String, String>();
		object_readed.put("maTruyen", chuongOfId.getIDTruyen());
		object_readed.put("tenTruyen", truyen.getTenTruyen());
		object_readed.put("chuongHienTai", chuongHienTai + "");
		object_readed.put("urlTruyen", tenTruyen + "/chuong-" + chuongHienTai);
		//thêm chức năng truyện vừa đọc
		ArrayList<Map<String, String>> array_readed = session.getAttribute("array_readed") != null
				? (ArrayList<Map<String, String>>) session.getAttribute("array_readed")
				: new ArrayList<Map<String, String>>();
		array_readed = reserveArray(array_readed);  // Đảo ngược lại mảng
		array_readed = hienThiTruyenVuaDoc(array_readed, object_readed);
		session.setAttribute("array_readed", reserveArray(array_readed)); // Lưu vào session
	///////////////////////////////
		LuotXemModel luotXemModel = new LuotXemModel();
		if(luotXemDAO.findLuotXem(chuongOfId.getIDTruyen())== null)
		{
			luotXemModel.setMaTruyen(chuongOfId.getIDTruyen());
			luotXemModel.setLuotXem(1);
			luotXemModel.setNgayXem(Helper.getCurrentDateAndTime());
			luotXemDAO.insert(luotXemModel);
		}
		else
		{
			luotXemModel = luotXemDAO.findLuotXem(chuongOfId.getIDTruyen());
			luotXemDAO.updateLuotXem(luotXemModel);
		}
		return "xem_chuong";
	}

	public ArrayList<Map<String, String>> hienThiTruyenVuaDoc(ArrayList<Map<String, String>> array_readed,
			Map<String, String> object_readed) {
		if (array_readed.size() != 0) // Nếu đã có truyện
		{

			boolean checkExsit = false; // Biến kiểm tra xem truyện có tồn tại trong mảng trước đó chưa
			int limit = 5; // Giới hạn chỉ lưu 5 truyện gần nhất
			for (int j = 0; j < array_readed.size(); j++) // Duyệt mảng
			{
				if (array_readed.get(j).get("maTruyen").equals(object_readed.get("maTruyen"))) // Nếu đã tồn tại truyện
																								// vừa
																								// chọn đọc trong mảng
				{
					Map<String, String> itemLast = array_readed.get(array_readed.size() - 1); // Lưu tạm item cuối cùng
																								// ra

					array_readed.set(j, itemLast); // Đảo vị trí giữa 2 truyện
					array_readed.set(array_readed.size() - 1, object_readed); // Gán item cuối cùng bằng item vừa đọc
					checkExsit = true; // Đưa biến kiểm tra về true
					break;
				}
			}
			if (!checkExsit) // Nếu không tồn tại truyện vừa chọn đọc trong mảng
			{
				if (array_readed.size() >= limit) // Nếu mảng đã có số lượng >= 5
				{
					for (int j = 0; j < array_readed.size() - 1; j++) { // Duyệt mảng xóa lùi các truyện
						array_readed.set(j, array_readed.get(j + 1));
					}
					array_readed.set(array_readed.size() - 1, object_readed); // Gán truyện mới nhất vào vị trí cuối
																				// cùng
				} else // Nếu số lượng truyện < 5
				{
					array_readed.add(object_readed); // Thêm truyện vào mảng
				}

			}
		} else // Mảng rỗng (Chưa có truyện nào)
		{
			array_readed.add(object_readed); // Thêm truyện vào
		}
		return array_readed;
	}

	public ArrayList<Map<String, String>> reserveArray(ArrayList<Map<String, String>> array) {
		ArrayList<Map<String, String>> newArray = new ArrayList<Map<String, String>>();
		for (int i = 0; i < array.size(); i++) {
			newArray.add(i, array.get(array.size() - 1 - i));
		}
		return newArray;
	}

	@RequestMapping(value = "/danh-muc/{danh-muc}", method = RequestMethod.GET)
	public String danhMucPage(Model model, @PathVariable("danh-muc") String tenDanhMucPath) {
		loadTheLoaiAndDanhMucTruyen(model);

		List<SelectTruyenInfo> listTruyenByDanhMuc = null;
		String gioiThieu = "";
		String tenDanhMuc = "";
		if (tenDanhMucPath.equals("truyen-full")) {
			listTruyenByDanhMuc = truyenDao.selectAllTruyenByDanhMuc("full");
			gioiThieu = "Danh sách những truyện đã full, có nhiều người đọc và quan tâm nhất.";
			tenDanhMuc = "Truyện Full";
		}
		if (tenDanhMucPath.equals("truyen-hot")) {
			listTruyenByDanhMuc = truyenDao.selectAllTruyenByDanhMuc("hot");
			gioiThieu = "Danh sách những truyện đang hot, có nhiều người đọc và quan tâm nhất trong tháng này.";
			tenDanhMuc = "Truyện Hot";
		}
		if (tenDanhMucPath.equals("truyen-news")) {
			listTruyenByDanhMuc = truyenDao.selectAllTruyenByDanhMuc("news");
			gioiThieu = "Danh sách những truyện mới cập nhật.";
			tenDanhMuc = "Truyện News";
		}
		model.addAttribute("danhMucTruyen", listTruyenByDanhMuc);
		model.addAttribute("gioiThieu", gioiThieu);
		model.addAttribute("tenDanhMuc", tenDanhMuc);
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
	public String tacGiaPage(Model model, @PathVariable("tacGia") String pathTacGia) {
		loadTheLoaiAndDanhMucTruyen(model);
		List<TacGiaInfo> listTacGia = tacGiaDao.listTacGia();
		Map<String, Object> mapTacGia = new HashMap<String, Object>();
		for (TacGiaInfo tacGiaInfo : listTacGia) {
			mapTacGia.put(Helper.pathVariableString(tacGiaInfo.getTenTacGia()), tacGiaInfo);
		}
		TacGiaInfo tacGia = (TacGiaInfo) mapTacGia.get(pathTacGia);
		String tenTacgia = tacGia.getTenTacGia();
		List<SelectTruyenInfo> listTruyenByTacGia = truyenDao.selectAllTruyenByTacGia(tenTacgia);
		model.addAttribute("listTacGia", listTruyenByTacGia);
		model.addAttribute("tenTacGia", tenTacgia);
		model.addAttribute("gioiThieu", tacGia.getGioiThieu());
		return "tac_gia";
	}

	@RequestMapping("/tim-kiem")
	public String searchPage(Model model, @RequestParam("tu-khoa") String tuKhoa) {
		loadTheLoaiAndDanhMucTruyen(model);
		List<SelectTruyenInfo> listTruyenTimKiem = truyenDao.searchTruyen(tuKhoa);
		Map<String, String> map = new HashMap<String, String>();

		for (SelectTruyenInfo selectTruyenInfo : listTruyenTimKiem) {
			map.put(selectTruyenInfo.getID(), Helper.pathVariableString(selectTruyenInfo.getTenTruyen()));
		}

		model.addAttribute("listTruyenSearch", listTruyenTimKiem);
		model.addAttribute("path", map);
		model.addAttribute("tuKhoa", tuKhoa);
		return "search";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)

	public String login(@RequestParam("username") String userName, @RequestParam("password") String passWord,
			HttpServletRequest request, HttpSession session) {

		String back = request.getHeader("Referer");
		String requestStr = "";
		if (userName.isEmpty() || passWord.isEmpty()) {
			session.setAttribute("mess", "Chưa nhập đủ thông tin");
			requestStr = "redirect:" + back;
		}
		TaiKhoanEntity taikhoan = taiKhoanDAO.findTaiKhoanEntityByTen(userName);
		if (taikhoan == null || !taikhoan.getMatKhau().equals(passWord)) {
			session.setAttribute("mess", "Tài khoản hoặc mật khẩu không chính xác");
			requestStr = "redirect:" + back;
		} 
		else if(!taikhoan.isTrangThai()){
			session.setAttribute("mess", "Tài khoản của bạn đã bị khóa!");
			requestStr = "redirect:" + back;
		}else {
			if (taikhoan.getMaRole() == 2 || taikhoan.getMaRole() == 3) {
				session.setAttribute("mess", "Đăng nhập thành công!");
				session.setAttribute("acc_login", taikhoan);
				requestStr = "redirect:" + back;
			} else if (taikhoan.getMaRole() == 1) {
				session.setAttribute("acc_login", taikhoan);
				requestStr = "redirect:/quan-tri";
			}

		}

		return requestStr;
	}

	@RequestMapping(value = "/logup", method = RequestMethod.POST)
	public @ResponseBody String logup(HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		String email = request.getParameter("email");
		if (email.isEmpty() || password.isEmpty() || repassword.isEmpty() || username.isEmpty()) {
			return "empty";
		}
		if (!password.equals(repassword)) {
			return "password";
		}
		if (taiKhoanDAO.findTaiKhoanEntityByTen(username) != null) {
			return "exist";
		}
		TaiKhoanInfo taikhoan = new TaiKhoanInfo();
		taikhoan.setTenTaiKhoan(username);
		taikhoan.setMatKhau(password);
		taikhoan.setEmail(email);
		taiKhoanDAO.insert(taikhoan);
		return "success";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("acc_login");
		return "redirect:/index";
	}

	@RequestMapping(value = "/user_Info", method = RequestMethod.GET)
	public String userInfoPage(Model model) {
		return "user_info";
	}

}
