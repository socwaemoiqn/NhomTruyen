package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.DanhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.PhanHoiDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietTheLoaiTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PhanHoiInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.SelectTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TruyenInfo;

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

	@RequestMapping(value = { "/", "home", "" }, method = RequestMethod.GET)
	public String indexAdminPage(Model model) {
		List<ChiTietTheLoaiTruyenInfo> theLoaiTruyen = theLoaiTruyenDao.dsTenTheLoai();

		List<SelectTruyenInfo> listTruyenInfos = truyenDao.listTruyen();
		List<SelectTruyenInfo> listTruyenNoFull = truyenDao.selectAllTruyenNoFull();
		PaginationResult<PhanHoiInfo> slPH = phanHoiDao.paginationListPhanHoi(1, 1, 1);
		List<SelectTruyenInfo> listTopTruyen = truyenDao.selectAllTruyenByDanhMuc("hot");
		List<SelectTruyenInfo> listNewsTruyen = truyenDao.selectAllTruyenByDanhMuc("news");
		List<SelectTruyenInfo> listFullTruyen = truyenDao.selectAllTruyenByDanhMuc("full");
		// tinh ngay truoc cua truyen
		String ngayhethong = Helper.getCurrentDateAndTime();
		Map<String, String> mapNgayTruoc = new HashMap<String, String>();

		for (SelectTruyenInfo tr : listFullTruyen) {
			String ngay = tr.getNgayTao();
			String truoc = Helper.compareTime(ngay, ngayhethong);
			mapNgayTruoc.put(tr.getID(), truoc);
		}
		Map<String, String> listUrl = truyenDao.listPathVariableString();
		int slt = listTruyenInfos.size();
		int sltNoFull = listTruyenNoFull.size();

		model.addAttribute("slt", slt);
		model.addAttribute("slNoFull", sltNoFull);
		model.addAttribute("slPH", slPH.getTotalRecords());
		model.addAttribute("topTruyen", listTopTruyen);
		model.addAttribute("listNewsTruyen", listNewsTruyen);
		model.addAttribute("listFullTruyen", listFullTruyen);
		model.addAttribute("tenTheLoai", theLoaiTruyen);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("ngayTruoc", mapNgayTruoc);
		return "admin/home";
	}

	@RequestMapping(value = "/ql-nhomdich", method = RequestMethod.GET)
	public String QlNhomDichPage(Model model) {

		return "admin/ql_nhomdich";
	}

}
