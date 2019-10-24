package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.chuongDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.danhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.truyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.chiTietDanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.chuongInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.danhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.truyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.truyenInfoByTruyen;

@Controller(value = "QL_TruyenControllerOfAdmin")
@RequestMapping(value = "/quan-tri/ql_truyen")
public class QL_TruyenController {

	@Autowired
	private chuongDAO chuongDao;
	@Autowired
	private truyenDAO truyenDao;
	@Autowired
	private danhMucTruyenDAO dmtruyenDao;
	
	
	@RequestMapping(value = "/them", method = RequestMethod.POST)
	private String themTruyenAction(Model model, @ModelAttribute("truyen") truyenInfo truyen ) {
		return "redirect:/quan-tri/ql_truyen";
	}
	@RequestMapping(value = "/xem_truyen", method = RequestMethod.GET)
	private String xemTruyenPage(Model model, @ModelAttribute("idtruyen") int maTruyen ) {
		
		truyenInfoByTruyen tr= truyenDao.SelectTruyenByMa(maTruyen);
		List<chiTietDanhMucTruyenInfo> ctdm= dmtruyenDao.listTenDMByMaTruyen(maTruyen);
		
		model.addAttribute("truyenById", tr);
		model.addAttribute("dmById", ctdm);
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
		PaginationResult<chuongInfo> listChuongOfTruyen = chuongDao.listChuongOfTruyen(idTruyen, page, Max_Result,
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
		chuongInfo chuongOfId=chuongDao.chuongOfID(idChuong);
		model.addAttribute("noiDung", chuongOfId.getNoiDung());
		model.addAttribute("tieuDe", chuongOfId.getTieuDe());
		return "admin/ql_truyen_xemchuong";
	}

	
	@RequestMapping(value = "/ql_chuong/sua_chuong", method = RequestMethod.GET)
	public String editChuongPage(Model model, @RequestParam("idChuong") int idChuong) {
		chuongInfo chuongOfId=chuongDao.chuongOfID(idChuong);
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
			boolean kt=chuongDao.upDataChuong(nd, id);
			if(kt)
				return "redirect:/admin/ql_chuong";
			else	
			return "redirect:/quan-tri/ql_truyen/ql_chuong/xem_chuong?idChuong="+id;
	}
	
}
