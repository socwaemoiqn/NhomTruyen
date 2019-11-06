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
	
	@RequestMapping(value = "/editTruyen", method = RequestMethod.POST)
	private String editTruyen(HttpServletRequest request, Model model) {
		return "";
	}
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	private String deleteTruyen(HttpServletRequest request, Model model) {
		return "";
	}

	@RequestMapping(value = "/xem_truyen", method = RequestMethod.GET)
	private String xemTruyenPage(Model model, @ModelAttribute("idtruyen") String maTruyen) {

		TruyenInfoByTruyen tr = truyenDao.SelectTruyenByMa(maTruyen);
		List<ChiTietDanhMucTruyenInfo> ctdm = dmtruyenDao.listTenDMByMaTruyen(maTruyen);

		List<ChuongInfo> listChuongByTruyen = chuongDao.listChuongByIdTruyen(maTruyen);
		int slChuong = listChuongByTruyen.size();

		model.addAttribute("truyenById", tr);
		model.addAttribute("dmById", ctdm);
		model.addAttribute("listChuongOfTruyen", listChuongByTruyen);
		model.addAttribute("slChuong", slChuong);
		return "admin/ql_truyen_xemtruyen";
	}

	@RequestMapping(value = "/xem_chuong", method = RequestMethod.GET)
	public String xemChuongPage(Model model, @RequestParam("idChuong") String idChuong) {
		ChuongInfo chuongOfId = chuongDao.chuongOfID(idChuong);
		model.addAttribute("noiDung", chuongOfId.getNoiDung());
		model.addAttribute("tieuDe", chuongOfId.getTieuDe());
		model.addAttribute("id", chuongOfId.getId());
		return "admin/ql_truyen_xemchuong";
	}

	@RequestMapping(value = "/xem_chuong/addChuong", method = RequestMethod.POST)
	public String addChuongPage(Model model, @RequestParam("idtruyen") String idTruyen, HttpServletRequest request) {
		String idChuong = Helper.CreateId("CH");
		String tieuDe = request.getParameter("ten");
		String noiDung = request.getParameter("noiDung");
		int trangThai = 1;
		String ngayTao = Helper.getCurrentDateAndTime();
		// tạo 1 đối tượng
		ChuongInfo newChuong = new ChuongInfo(idChuong, idTruyen, tieuDe, noiDung, trangThai, ngayTao);
		// insert vào csdl
		chuongDao.insertChuong(newChuong);

		return "redirect:/quan-tri/ql_truyen/xem_chuong?idChuong=" + idChuong;
	}

	@RequestMapping(value = "/xem_chuong/editChuong", method = RequestMethod.POST)
	public String editChuongForm(Model model, @RequestParam("ten") String ten, @RequestParam("noidung") String nd,
			@RequestParam("idChuong") String id) {
		boolean kt = chuongDao.upDataChuong(ten, nd, id);
		if (kt)
			return "redirect:/admin/ql_truyen";
		else
			return "redirect:/quan-tri/ql_truyen/xem_chuong?idChuong=" + id;
	}

}
