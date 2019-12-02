package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.ChuongDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.DanhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TacGiaDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Form.TruyenAddForm;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietDanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietTheLoaiTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChuongInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.SelectTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TacGiaInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TruyenInfo;

@Controller(value = "QL_TruyenControllerOfAdmin")
@RequestMapping(value = "/quan-tri/ql-truyen")
public class QL_TruyenController {

	@Autowired
	private ChuongDAO chuongDao;
	@Autowired
	private TruyenDAO truyenDao;
	@Autowired
	private DanhMucTruyenDAO dmtruyenDao;
	@Autowired
	private TheLoaiTruyenDAO theLoaiTruyenDao;
	@Autowired
	private TacGiaDAO tacGiaDao;

	// Phương thức này được gọi mỗi lần có Submit.
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		Object target = dataBinder.getTarget();
		if (target == null) {
			return;
		}
		System.out.println("Target=" + target);

		if (target.getClass() == TruyenAddForm.class) {

			// Đăng ký để chuyển đổi giữa các đối tượng multipart thành byte[]
			dataBinder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
		}
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String QlTruyenPage(Model model, @RequestParam(value = "page", defaultValue = "1") String pageStr) {
		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 10;
		final int Max_Navigation = 3;

		PaginationResult<SelectTruyenInfo> listTruyen = truyenDao.litsTruyen(page, Max_Result, Max_Navigation);
		List<ChiTietTheLoaiTruyenInfo> theLoaiTruyen = theLoaiTruyenDao.dsTenTheLoai();

		Map<String, String> listUrl = truyenDao.listPathVariableString();

		TruyenAddForm truyen = new TruyenAddForm();

		model.addAttribute("tenTheLoai", theLoaiTruyen);
		model.addAttribute("listTruyen", listTruyen);
		model.addAttribute("url", listUrl);
		model.addAttribute("truyenAddForm", truyen);
		model.addAttribute("slt", listTruyen.getTotalRecords());

		return "admin/ql_truyen";
	}

	@RequestMapping(value = "tim-kiem/", method = RequestMethod.GET)
	public String timKiemTruyen(Model model, @RequestParam(value = "page", defaultValue = "1") String pageStr,
			@RequestParam("tu-khoa") String tuKhoa, HttpSession session) {
		if (!tuKhoa.isEmpty()) {
			int page = 1;
			try {
				page = Integer.parseInt(pageStr);
			} catch (Exception e) {
				// TODO: handle exception
			}
			final int Max_Result = 10;
			final int Max_Navigation = 3;

			PaginationResult<SelectTruyenInfo> listTruyen = truyenDao.getTruyenByTen(tuKhoa, page, Max_Result,
					Max_Navigation);
			List<ChiTietTheLoaiTruyenInfo> theLoaiTruyen = theLoaiTruyenDao.dsTenTheLoai();

			Map<String, String> listUrl = truyenDao.listPathVariableString();

			TruyenAddForm truyen = new TruyenAddForm();

			model.addAttribute("tenTheLoai", theLoaiTruyen);
			model.addAttribute("listTruyen", listTruyen);
			model.addAttribute("url", listUrl);
			model.addAttribute("truyenAddForm", truyen);
			model.addAttribute("slt", listTruyen.getTotalRecords());
			session.setAttribute("tuKhoa", tuKhoa);

			return "admin/ql_truyen";
		}
		return "redirect:/quan-tri/ql-truyen";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	private String themTruyenForm(HttpServletRequest request, Model model,
			@ModelAttribute("truyenAddForm") @Validated TruyenAddForm truyenAddForm, BindingResult result,
			HttpSession session) {
		if (result.hasErrors()) {
			return "redirect:/quan-tri/ql-truyen";
		}
		String maTruyen = Helper.CreateId("TR");

		String tenTruyen = truyenAddForm.getTenTruyen();
		int maTacGia = truyenAddForm.getMaTacGia();

		int maNhomDich = 1;
		int soChuong = 0;
		String gioiThieu = truyenAddForm.getGioiThieu();
		int luotXem = 0;
		String nguon = truyenAddForm.getNguon();
		String hinhAnh = "";
		CommonsMultipartFile fileDatas = truyenAddForm.getHinhAnh();
		// Tên file gốc tại Client.
		hinhAnh = fileDatas.getOriginalFilename();
		
		boolean full = false;
		boolean hot = false;
		boolean news = true;
		boolean hienThi = true;
		String ngayTao = Helper.getCurrentDateAndTime();

		TruyenInfo truyenInfo = new TruyenInfo(maTruyen, tenTruyen, maTacGia, maNhomDich, soChuong, gioiThieu, luotXem,
				nguon, hinhAnh, full, hot, news, hienThi, ngayTao);
		// int[] maDanhMuc = truyenAddForm.getMaDanhMuc();
		int[] matheLoai = truyenAddForm.getMaTheLoai();

		// insertChiTietDanhMuc(maTruyen, maDanhMuc);
		themChitietTheLoai(maTruyen, matheLoai);

		doUpload(request, truyenAddForm);
		truyenDao.insertTruyen(truyenInfo);
		Map<String, String> tr = new HashMap<String, String>();
		tr.put(maTruyen, tenTruyen);
		session.setAttribute("name_truyen_add", tr);

		return "redirect:/quan-tri/ql-truyen";
	}

	@RequestMapping(value = "/them-tac-gia", method = RequestMethod.POST)
	private String themTacGia(HttpServletRequest request, Model model, HttpSession session) {
		String tenTacGia = request.getParameter("tenTacGia");
		String gioiThieu = request.getParameter("gioiThieu");
		if (tenTacGia.length() > 0 && tenTacGia.length() <= 50) {
			TacGiaInfo tacgiainfo = new TacGiaInfo();
			tacgiainfo.setGioiThieu(gioiThieu);
			tacgiainfo.setTenTacGia(tenTacGia);
			tacGiaDao.insert(tacgiainfo);

			session.setAttribute("tenTacGia", tenTacGia);
		}
		String back = request.getHeader("Referer");
		return "redirect:" + back;
	}

	private void themChitietTheLoai(String maTruyen, int[] matheLoai) {
		for (int ma : matheLoai) {
			ChiTietTheLoaiTruyenInfo chiTietTheLoaiTruyenInfo = new ChiTietTheLoaiTruyenInfo(maTruyen, ma);
			theLoaiTruyenDao.insertChiTietTheLoai(chiTietTheLoaiTruyenInfo);
		}
	}

	private void doUpload(HttpServletRequest request, //
			TruyenAddForm truyenAddForm) {

		// Thư mục gốc upload file.
		String uploadRootPath = request.getServletContext().getRealPath("/") + "truyen/img";
		System.out.println("uploadRootPath=" + uploadRootPath);

		File uploadRootDir = new File(uploadRootPath);
		//
		// Tạo thư mục gốc upload nếu nó không tồn tại.
		if (!uploadRootDir.exists()) {
			uploadRootDir.mkdirs();
		}
		CommonsMultipartFile fileDatas = truyenAddForm.getHinhAnh();
		// Tên file gốc tại Client.
		String name = fileDatas.getOriginalFilename();
		System.out.println("Client File Name = " + name);

		if (name != null && name.length() > 0) {
			try {
				// Tạo file tại Server.
				File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + name);

				// Luồng ghi dữ liệu vào file trên Server.
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(fileDatas.getBytes());
				stream.close();
				//
				System.out.println("Write file: " + serverFile);
			} catch (Exception e) {
				System.out.println("Error Write file: " + name);
			}
		}
		

	}

	@RequestMapping(value = "/ajax", method = RequestMethod.POST)
	public @ResponseBody String getTruyen(Model model, HttpServletRequest request) throws JsonProcessingException {
		String maTruyen = request.getParameter("id");
		SelectTruyenInfo info = truyenDao.selectTruyenByMa(maTruyen);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(info);
		return json;
	}

	@RequestMapping(value = "/delete-ajax", method = RequestMethod.POST)
	private @ResponseBody String deleteTruyen(Model model, HttpServletRequest request, HttpSession session)
			throws JsonParseException, JsonMappingException, IOException {
		String listID = request.getParameter("json");
		ObjectMapper mapper = new ObjectMapper();
//		
//		String json=mapper.writeValueAsString(listID.getBytes());
		String[] idTr = mapper.readValue(listID, String[].class);
//	
		List<String> tenTruyen = new ArrayList<String>();
		for (String id : idTr) {
			SelectTruyenInfo tr = truyenDao.selectTruyenByMa(id);
			truyenDao.xoaTruyen(id);
			// xóa toàn bộ chương của truyên
			List<ChuongInfo> danhSachChuongCuaTruyen = chuongDao.listChuongOfTruyenSortDESC(tr.getID());
			for (ChuongInfo chuong : danhSachChuongCuaTruyen) {
				chuongDao.deleteChuong(chuong.getId());
			}

			tenTruyen.add(tr.getTenTruyen());
		}
		session.setAttribute("name_truyen", tenTruyen);

		// model.addAttribute(, tenTruyen);

		return "Xóa thành công.";
	}

	@RequestMapping(value = "/update-ajax", method = RequestMethod.POST)
	private @ResponseBody String updateDanhMucTruyen(Model model, HttpServletRequest request, HttpSession session)
			throws JsonParseException, JsonMappingException, IOException {

		String listFull = request.getParameter("full");
		String listFull_unchecked = request.getParameter("full_unchecked");
		String listHot = request.getParameter("hot");
		String listHot_unchecked = request.getParameter("hot_unchecked");
		String listNew = request.getParameter("news");
		String listNew_unchecked = request.getParameter("news_unchecked");
		String listShow = request.getParameter("show");
		String listShow_unchecked = request.getParameter("show_unchecked");

		ObjectMapper mapper = new ObjectMapper();

		String[] idTr_full = mapper.readValue(listFull, String[].class);
		String[] idTr_full_unchecked = mapper.readValue(listFull_unchecked, String[].class);

		String[] idTr_hot = mapper.readValue(listHot, String[].class);
		String[] idTr_hot_unchecked = mapper.readValue(listHot_unchecked, String[].class);

		String[] idTr_new = mapper.readValue(listNew, String[].class);
		String[] idTr_new_unchecked = mapper.readValue(listNew_unchecked, String[].class);

		String[] idTr_show = mapper.readValue(listShow, String[].class);
		String[] idTr_show_unchecked = mapper.readValue(listShow_unchecked, String[].class);

		upDateTrFull(idTr_full, "full", true);
		upDateTrFull(idTr_full_unchecked, "full", false);
		//
		upDateTrFull(idTr_hot, "hot", true);
		upDateTrFull(idTr_hot_unchecked, "hot", false);
		//
		upDateTrFull(idTr_new, "news", true);
		upDateTrFull(idTr_new_unchecked, "news", false);
		//
		upDateTrFull(idTr_show, "hienThi", true);
		upDateTrFull(idTr_show_unchecked, "hienThi", false);

		return "Update thành công";
	}

	@RequestMapping(value = "/kiem-tra-ten", method = RequestMethod.POST)
	private @ResponseBody String kiemTraten(Model model, HttpServletRequest request, HttpSession session)
			throws JsonParseException, JsonMappingException, IOException {

		String ten = request.getParameter("ten");
		String ng = request.getParameter("nguon");
		String gt = request.getParameter("gioithieu");
		boolean truyen = truyenDao.selectTruyenByTen(ten);
		if (truyen) {
			return "false";
		}
		return ten;
	}

	public void upDateTrFull(String[] maTruyen, String trangThai, boolean value) {
		if (maTruyen != null) {
			for (String id : maTruyen) {
				truyenDao.capNhatTrangThaiTruyen(id, trangThai, value);
			}
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	private String deleteTruyenForm(Model model, HttpServletRequest request, HttpSession session) {
		String maTruyen = request.getParameter("idTruyen");
		SelectTruyenInfo tr = truyenDao.selectTruyenByMa(maTruyen);
		// lấy tên truyện để thông báo cho người dùng.
		session.setAttribute("name_truyen", tr.getTenTruyen());

		// xóa toàn bộ chương của truyên
		List<ChuongInfo> danhSachChuongCuaTruyen = chuongDao.listChuongOfTruyenSortDESC(tr.getID());
		for (ChuongInfo chuong : danhSachChuongCuaTruyen) {
			chuongDao.deleteChuong(chuong.getId());
		}

		// xóa truyện trong csdl
		truyenDao.xoaTruyen(maTruyen);

		return "redirect:/quan-tri/ql-truyen";
	}

	@RequestMapping(value = "/{tenTruyen}", method = RequestMethod.GET)
	private String xemTruyenPage(Model model, @PathVariable("tenTruyen") String tenTruyen) {

		TruyenAddForm truyen = new TruyenAddForm();

		Map<String, String> urlTruyen = truyenDao.listPathVariableString();
		String maTruyen = urlTruyen.get(tenTruyen);

		SelectTruyenInfo tr = truyenDao.selectTruyenByMa(maTruyen);
		List<ChiTietDanhMucTruyenInfo> ctdm = dmtruyenDao.listTenDMByMaTruyen(maTruyen);
		List<ChiTietTheLoaiTruyenInfo> cttl = theLoaiTruyenDao.listTenTlOfTruyen(maTruyen);

		List<ChuongInfo> listChuongByTruyen = chuongDao.listChuongOfTruyenSortDESC(maTruyen);
		Map<String, String> urlChuong = chuongDao.listPathVariableString(maTruyen);

		List<ChuongInfo> listChuong = chuongDao.listChuongOfTruyenSortASC(maTruyen);
		Map<String, String> soChuong = new HashMap<String, String>();
		int i = 1;
		for (ChuongInfo ch : listChuong) {

			soChuong.put(ch.getId(), "Chương " + i);
			i++;
		}

		int slChuong = listChuongByTruyen.size();

		model.addAttribute("truyenById", tr);
		model.addAttribute("dmById", ctdm);
		model.addAttribute("temtl", cttl);
		model.addAttribute("listChuongOfTruyen", listChuongByTruyen);
		model.addAttribute("slChuong", slChuong);
		model.addAttribute("tenTruyen", tenTruyen);
		model.addAttribute("urlChuong", urlChuong);
		model.addAttribute("soChuong", soChuong);

		model.addAttribute("truyenEditForm", truyen);

		return "admin/ql_truyen_xemtruyen";
	}

	@RequestMapping(value = "/{tenTruyen}/edit-truyen", method = RequestMethod.POST)
	private String editTruyen(HttpServletRequest request, @PathVariable("tenTruyen") String tenTruyen, Model model,
			@ModelAttribute("truyenEditForm") TruyenAddForm truyenAddForm) {
		Map<String, String> urlTruyen = truyenDao.listPathVariableString();
		String maTruyen = urlTruyen.get(tenTruyen);
		SelectTruyenInfo truyenCu = truyenDao.selectTruyenByMa(maTruyen);
		

		String tenTruyenMoi = (truyenAddForm.getTenTruyen().isEmpty()) ? truyenCu.getTenTruyen() : truyenAddForm.getTenTruyen();

		System.out.println(tenTruyenMoi + "");
		String hinhAnhMoi = "";
		CommonsMultipartFile fileDatas = truyenAddForm.getHinhAnh();
		// Tên file gốc tại Client.
		hinhAnhMoi = (!fileDatas.getOriginalFilename().isEmpty()) ? fileDatas.getOriginalFilename()
				: truyenCu.getHinhAnh();
		
		List<TacGiaInfo> list = tacGiaDao.listTacGia();
		int maTacGiaCu=-1;
		System.out.println(truyenCu.getTenTacGia());
		for(TacGiaInfo k : list) {
			if(k.getTenTacGia().equals(truyenCu.getTenTacGia()))
			{
				maTacGiaCu=k.getID();
				break;
			}
			
		}
		int maTacGiaMoi = (!(truyenAddForm.getMaTacGia() == -1)) ? truyenAddForm.getMaTacGia() : maTacGiaCu;

		int[] matheLoaiMoi = truyenAddForm.getMaTheLoai();
		if (matheLoaiMoi.length >= 1) {
			// xoa all tl trong bang chi tiet the loai
			theLoaiTruyenDao.xoaChiTietTheLoaiTheoTruyen(maTruyen);
			// cap nhat lai the loai trong bang chi tiet the loai
			themChitietTheLoai(maTruyen, matheLoaiMoi);
		}

		String nguonMoi = (!truyenAddForm.getNguon().isEmpty()) ? truyenAddForm.getNguon() : truyenCu.getNguon();
		String gioiThieuMoi = (!truyenAddForm.getGioiThieu().isEmpty()) ? truyenAddForm.getGioiThieu()
				: truyenCu.getGioiThieu();
		TruyenInfo truyenInfo = new TruyenInfo();
		truyenInfo.setID(maTruyen);
		truyenInfo.setTenTruyen(tenTruyenMoi);
		truyenInfo.setHinhAnh(hinhAnhMoi);
		truyenInfo.setMaTacGia(maTacGiaMoi);
		truyenInfo.setNguon(nguonMoi);
		truyenInfo.setGioiThieu(gioiThieuMoi);
		truyenDao.capNhatTruyen(truyenInfo);
		return "redirect:/quan-tri/ql-truyen/" + Helper.pathVariableString(tenTruyenMoi);
	}
	
	@RequestMapping(value = "/{tenTruyen}/{tenChuong}", method = RequestMethod.GET)
	public String xemChuongPage(Model model, @PathVariable("tenTruyen") String tenTruyen,
			@PathVariable("tenChuong") String tenChuong) {
		Map<String, String> urlTruyen = truyenDao.listPathVariableString();
		String maTruyen = urlTruyen.get(tenTruyen);

		Map<String, String> urlChuong = chuongDao.listPathVariableString(maTruyen);
		String idChuong = urlChuong.get(tenChuong);

		System.out.println(idChuong);
		ChuongInfo chuongInfo = chuongDao.chuongInfo(idChuong);
		model.addAttribute("chuongInfo", chuongInfo);
		model.addAttribute("tenTruyen", tenTruyen);
		model.addAttribute("tenChuong", tenChuong);
		return "admin/ql_truyen_xemchuong";
	}
	@RequestMapping(value = "/tac-gia/{id}",method = RequestMethod.GET)
	public String getTruyenTheoTacGia(Model model,
			@PathVariable(value = "id")String id,
			@RequestParam(value = "page", defaultValue = "1")String pageStr)
	{
		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 10;
		final int Max_Navigation = 3;
		int maTacGia = Integer.parseInt(id);
		PaginationResult<SelectTruyenInfo> listTruyen = truyenDao.getTruyenByTacGia(maTacGia, page, Max_Result, Max_Navigation);
		List<ChiTietTheLoaiTruyenInfo> theLoaiTruyen = theLoaiTruyenDao.dsTenTheLoai();

		Map<String, String> listUrl = truyenDao.listPathVariableString();
		
		TruyenAddForm truyen = new TruyenAddForm();

		model.addAttribute("tenTheLoai", theLoaiTruyen);
		model.addAttribute("listTruyen", listTruyen);
		model.addAttribute("url", listUrl);
		model.addAttribute("truyenAddForm", truyen);
		model.addAttribute("slt", listTruyen.getTotalRecords());
		return "admin/ql_truyen";
	}

	@ModelAttribute("danhMuc")
	public List<DanhMucTruyenInfo> getDanhMuc() {
		List<DanhMucTruyenInfo> danhMuc = dmtruyenDao.dsDanhMucTruyen();
		return danhMuc;
	}

	@ModelAttribute("tacGia")
	public List<TacGiaInfo> getTacGia() {
		List<TacGiaInfo> tacGia = tacGiaDao.listTacGia();
		return tacGia;
	}

	@ModelAttribute("theLoai")
	public List<TheLoaiTruyenInfo> getTheLoai() {
		List<TheLoaiTruyenInfo> theLoai = theLoaiTruyenDao.dsTheLoai();
		return theLoai;
	}

}
