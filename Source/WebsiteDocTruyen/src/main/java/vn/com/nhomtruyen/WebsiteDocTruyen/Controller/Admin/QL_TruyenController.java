package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.ChuongDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.DanhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Form.TruyenAddForm;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietDanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietTheLoaiTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChuongInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TruyenInfoByTruyen;

@Controller(value = "QL_TruyenControllerOfAdmin")
@RequestMapping(value = "/quan-tri/ql_truyen")
public class QL_TruyenController {

	@Autowired
	private ChuongDAO chuongDao;
	@Autowired
	private TruyenDAO truyenDao;
	@Autowired
	private DanhMucTruyenDAO dmtruyenDao;
	@Autowired
	private TheLoaiTruyenDAO theLoaiTruyenDao;

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

	@RequestMapping(value = "/them", method = RequestMethod.POST)
	private String themTruyenAction(HttpServletRequest request, Model model,
			@ModelAttribute("truyen") TruyenAddForm truyenAddForm) {
		
		String maTruyen = Helper.CreateId("TR");

		String tenTruyen = truyenAddForm.getTenTruyen();
		int maTacGia = truyenAddForm.getMaTacGia();
		int maNhomDich = 1;
		int soChuong = truyenAddForm.getSoChuong();
		String gioiThieu = truyenAddForm.getGioiThieu();
		int luotXem = 0;
		String nguon = truyenAddForm.getNguon();
		String hinhAnh = "";
		CommonsMultipartFile[] fileDatas = truyenAddForm.getHinhAnh();
		for (CommonsMultipartFile fileData : fileDatas) {

			// Tên file gốc tại Client.
			hinhAnh = fileData.getOriginalFilename();
		}

		String trangThai = "1";
		String ngayTao = Helper.getCurrentDateAndTime();

		TruyenInfo truyenInfo = new TruyenInfo(maTruyen, tenTruyen, maTacGia, maNhomDich, soChuong, gioiThieu, luotXem,
				nguon, hinhAnh, trangThai, ngayTao);
		int[] maDanhMuc = truyenAddForm.getMaDanhMuc();
		int[] matheLoai = truyenAddForm.getMaTheLoai();

		insertChiTietDanhMuc(maTruyen, maDanhMuc);
		insertChitietTheLoai(maTruyen, matheLoai);

		doUpload(request, truyenAddForm);
		truyenDao.InsertTruyen(truyenInfo);

		return "redirect:/quan-tri/ql_truyen";
	}

	private void insertChitietTheLoai(String maTruyen, int[] matheLoai) {
		for (int ma : matheLoai) {
			ChiTietTheLoaiTruyenInfo chiTietTheLoaiTruyenInfo = new ChiTietTheLoaiTruyenInfo(maTruyen, ma);
			theLoaiTruyenDao.insertChiTietTheLoai(chiTietTheLoaiTruyenInfo);
		}
	}

	private void insertChiTietDanhMuc(String maTruyen, int[] maDanhMuc) {
		for (int ma : maDanhMuc) {
			ChiTietDanhMucTruyenInfo chiTietDanhMucTruyenInfo = new ChiTietDanhMucTruyenInfo(maTruyen, ma);
			dmtruyenDao.InsertChiTietDanhMuc(chiTietDanhMucTruyenInfo);
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
		CommonsMultipartFile[] fileDatas = truyenAddForm.getHinhAnh();
		//
		List<File> uploadedFiles = new ArrayList<File>();
		for (CommonsMultipartFile fileData : fileDatas) {

			// Tên file gốc tại Client.
			String name = fileData.getOriginalFilename();
			System.out.println("Client File Name = " + name);

			if (name != null && name.length() > 0) {
				try {
					// Tạo file tại Server.
					File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + name);

					// Luồng ghi dữ liệu vào file trên Server.
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(fileData.getBytes());
					stream.close();
					//
					uploadedFiles.add(serverFile);
					System.out.println("Write file: " + serverFile);
				} catch (Exception e) {
					System.out.println("Error Write file: " + name);
				}
			}
		}

	}

	@RequestMapping(value = "/xem_truyen", method = RequestMethod.GET)
	private String xemTruyenPage(Model model, @ModelAttribute("idtruyen") String maTruyen) {

		TruyenInfoByTruyen tr = truyenDao.SelectTruyenByMa(maTruyen);
		List<ChiTietDanhMucTruyenInfo> ctdm = dmtruyenDao.listTenDMByMaTruyen(maTruyen);
		
		List<ChuongInfo> listChuongByTruyen = chuongDao.listChuongByIdTruyen(maTruyen);
		int slChuong=listChuongByTruyen.size();
		
		model.addAttribute("truyenById", tr);
		model.addAttribute("dmById", ctdm);
		model.addAttribute("listChuongOfTruyen", listChuongByTruyen);
		model.addAttribute("slChuong", slChuong);
		return "admin/ql_truyen_xemtruyen";
	}

	@RequestMapping(value = "/ql_chuong", method = RequestMethod.GET)
	public String qlChuongPage(Model model, @RequestParam("idtruyen") int idTruyen,
			@RequestParam(value = "page", defaultValue = "1") String pageStr) {
		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 3;
		final int Max_Navigation = 3;
		PaginationResult<ChuongInfo> listChuongOfTruyen = chuongDao.listChuongOfTruyen(idTruyen, page, Max_Result,
				Max_Navigation);
		// List<chuongInfo> listChuongOfTruyen = chuongDao.dsDanhMucTruyen(idTruyen);
		model.addAttribute("listChuongOfTruyen", listChuongOfTruyen);
		model.addAttribute("idt", idTruyen);

		return "admin/ql_truyen_ql_chuong";
	}

	@RequestMapping(value = "/ql_chuong/them_chuong", method = RequestMethod.GET)
	public String themtruyenPage(Model model) {
		String noi = "";
		model.addAttribute("noi", noi);
		return "admin/ql_truyen_themchuong";
	}

	@RequestMapping(value = "/ql_chuong/xem_chuong", method = RequestMethod.GET)
	public String xemChuongPage(Model model, @RequestParam("idChuong") int idChuong) {
		ChuongInfo chuongOfId = chuongDao.chuongOfID(idChuong);
		model.addAttribute("noiDung", chuongOfId.getNoiDung());
		model.addAttribute("tieuDe", chuongOfId.getTieuDe());
		return "admin/ql_truyen_xemchuong";
	}

	@RequestMapping(value = "/ql_chuong/sua_chuong", method = RequestMethod.GET)
	public String editChuongPage(Model model, @RequestParam("idChuong") int idChuong) {
		ChuongInfo chuongOfId = chuongDao.chuongOfID(idChuong);
		model.addAttribute("noiDung", chuongOfId.getNoiDung());
		model.addAttribute("tieuDe", chuongOfId.getTieuDe());
		model.addAttribute("id", chuongOfId.getId());
		return "admin/ql_truyen_suachuong";
	}

	@RequestMapping(value = "/ql_chuong/addChuong", method = RequestMethod.POST)
	public String addChuongPage(Model model) {

		return "admin/ql_truyen_xemchuong";
	}

	@RequestMapping(value = "/ql_chuong/editChuong", method = RequestMethod.POST)
	public String editChuongForm(Model model, @RequestParam("noidung") String nd, @RequestParam("idChuong") int id) {
		boolean kt = chuongDao.upDataChuong(nd, id);
		if (kt)
			return "redirect:/admin/ql_chuong";
		else
			return "redirect:/quan-tri/ql_truyen/ql_chuong/xem_chuong?idChuong=" + id;
	}

}
