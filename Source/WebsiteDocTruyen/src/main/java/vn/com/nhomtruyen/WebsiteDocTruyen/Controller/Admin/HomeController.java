package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Authencation;
import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.DanhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.LuotXemDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.PhanHoiDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietTheLoaiTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PhanHoiInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.SelectTruyenInfo;

@Controller(value = "HomeControllerOfAdmin")
@RequestMapping(value = "/quan-tri")
public class HomeController {

	@Autowired
	private DanhMucTruyenDAO danhMucTruyenDAO;

	@Autowired
	private TheLoaiTruyenDAO theLoaiTruyenDao;
	@Autowired
	private TruyenDAO truyenDao;
	@Autowired
	private PhanHoiDAO phanHoiDao;
	@Autowired
	private LuotXemDAO luotXemDao;

	@RequestMapping(value = { "/*", "" }, method = RequestMethod.GET)
	public String indexAdminPage(HttpServletRequest request, Model model) throws ClassNotFoundException, SQLException {
		String urlRedirect = "";
		if (Authencation.Auth(request, 1)) {

			Calendar cal = Calendar.getInstance();
			String timeStart, timeEnd;
			// top truyen xem trong ngay
			timeStart = Helper.getToday() + " 00:00:00";
			timeEnd = Helper.getToday() + " 23:59:00";
			List<SelectTruyenInfo> listTop10Truyen = truyenDao.selectTop10TruyenByLuotXem(timeStart, timeEnd);
			for (SelectTruyenInfo selectTruyenInfo : listTop10Truyen) {
				SelectTruyenInfo info= truyenDao.selectTruyenByMa(selectTruyenInfo.getID());
				selectTruyenInfo.setTenTacGia(info.getTenTacGia());
				
				List<ChiTietTheLoaiTruyenInfo> listTheLoaiByTruyen=theLoaiTruyenDao.listTenTlOfTruyen(selectTruyenInfo.getID());
				String tenTheLoai="";
				for (ChiTietTheLoaiTruyenInfo ct : listTheLoaiByTruyen) {
					tenTheLoai+=ct.getTenTheLoai()+", ";
				}
				selectTruyenInfo.setTheLoaiTruyen(Helper.subString(tenTheLoai));
				selectTruyenInfo.setUrlTruyen(Helper.pathVariableString(selectTruyenInfo.getTenTruyen()));
			}
			
			
			//top truyen moi
			List<SelectTruyenInfo> listNewsTruyen = truyenDao.selectAllTruyenByDanhMuc("news");
			for (SelectTruyenInfo selectTruyenInfo : listNewsTruyen) {
				selectTruyenInfo.setUrlTruyen(Helper.pathVariableString(selectTruyenInfo.getTenTruyen()));
				List<ChiTietTheLoaiTruyenInfo> listTheLoaiByTruyen=theLoaiTruyenDao.listTenTlOfTruyen(selectTruyenInfo.getID());
				String tenTheLoai="";
				for (ChiTietTheLoaiTruyenInfo ct : listTheLoaiByTruyen) {
					tenTheLoai+=ct.getTenTheLoai()+", ";
				}
				selectTruyenInfo.setTheLoaiTruyen(Helper.subString(tenTheLoai));
				selectTruyenInfo.setLuotXem(luotXemDao.sumLuotXemOfTruyen(selectTruyenInfo.getID()));
			}
			
			//top truyen full
			List<SelectTruyenInfo> listFullTruyen = truyenDao.selectAllTruyenByDanhMuc("full");
			for (SelectTruyenInfo selectTruyenInfo : listFullTruyen) {
				selectTruyenInfo.setUrlTruyen(Helper.pathVariableString(selectTruyenInfo.getTenTruyen()));
				List<ChiTietTheLoaiTruyenInfo> listTheLoaiByTruyen=theLoaiTruyenDao.listTenTlOfTruyen(selectTruyenInfo.getID());
				String tenTheLoai="";
				for (ChiTietTheLoaiTruyenInfo ct : listTheLoaiByTruyen) {
					tenTheLoai+=ct.getTenTheLoai()+", ";
				}
				selectTruyenInfo.setTheLoaiTruyen(Helper.subString(tenTheLoai));
				selectTruyenInfo.setLuotXem(luotXemDao.sumLuotXemOfTruyen(selectTruyenInfo.getID()));
			}
			
			// tinh ngay truoc cua truyen
			String ngayhethong = Helper.getCurrentDateAndTime();
			Map<String, String> mapNgayTruoc = new HashMap<String, String>();

			for (SelectTruyenInfo tr : listFullTruyen) {
				String ngay = tr.getNgayTao();
				String truoc = Helper.compareTime(ngay, ngayhethong);
				mapNgayTruoc.put(tr.getID(), truoc);
			}

			model.addAttribute("slt", truyenDao.listTruyen().size());
			model.addAttribute("slNoFull", truyenDao.selectAllTruyenNoFull().size());
			model.addAttribute("slPH", phanHoiDao.paginationListPhanHoi(1, 1, 1).getTotalRecords());
			model.addAttribute("listNewsTruyen", listNewsTruyen);
			model.addAttribute("listFullTruyen", listFullTruyen);
			model.addAttribute("listTopTruyen", listTop10Truyen);
			model.addAttribute("ngayTruoc", mapNgayTruoc);
			urlRedirect = "admin/home";
		} else
			urlRedirect = "redirect:/";
		return urlRedirect;
	}

	@RequestMapping(value = "/ql-nhomdich", method = RequestMethod.GET)
	public String QlNhomDichPage(Model model) {

		return "admin/ql_nhomdich";
	}

}
