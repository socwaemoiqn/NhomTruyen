package vn.com.nhomtruyen.WebsiteDocTruyen.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.ChuongDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.DanhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TaiKhoanDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietDanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChuongInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TaiKhoanInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TruyenInfoByTruyen;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TruyenSelectInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.UserAccountsInfo;

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

	@RequestMapping(value = { "/", "index", "home" }, method = RequestMethod.GET)
	public String indexPage(Model model,HttpServletRequest request) {
		List<TruyenSelectInfo> truyen=truyenDao.listTR();
		List<DanhMucTruyenInfo> danhMuc=dmtruyenDao.dsDanhMucTruyen();
		List<TheLoaiTruyenInfo> theLoaiTruyen=theLoaiTruyenDao.dsTheLoai();
		model.addAttribute("truyen", truyen);
		model.addAttribute("danhMuc",  danhMuc);
		model.addAttribute("theLoaiTruyen",  theLoaiTruyen);
		
		
		int sltl= theLoaiTruyen.size();
		model.addAttribute("sltl",  sltl);
		
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPage(Model model, @RequestParam("userName") String userName,
			@RequestParam("passWord") String passWord, HttpSession session) {
		String request = "";
		//userAccountsInfo user = userAccountsDAO.login(userName, passWord);
		TaiKhoanInfo tk=userAccountsDAO.ck_login(userName, passWord);
		if (tk != null) {
			String role = tk.getTenRole();
			if (role.equals("Admin")) {
				session.setAttribute("admin", tk);
				request = "redirect:/quan-tri";
			} else if (role.equals("tlt")) {
				session.setAttribute("tlt",tk);
				request = "redirect:/nhom-dich";
			} else {
				session.setAttribute("client", tk);
				request = "redirect:/user_Info";
			}

		} else {
			model.addAttribute("loi", "loi");
			request = "redirect:/index";
		}
		return request;

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(Model model) {
		return "redirect:/index";
	}

	@RequestMapping(value = "/user_Info", method = RequestMethod.GET)
	public String userInfoPage(Model model) {
		return "user_info";
	}
	@RequestMapping(value = "/truyen", method = RequestMethod.GET)
	public String truyenInfoPage(Model model, @RequestParam("idTruyen")  int maTruyen) {
		
		TruyenInfoByTruyen tr= truyenDao.SelectTruyenByMa(maTruyen);
		List<ChiTietDanhMucTruyenInfo> ctdm= dmtruyenDao.listTenDMByMaTruyen(maTruyen);
		List<ChuongInfo> listChuong = chuongDao.listChuongByIdTruyen(maTruyen); 
		
		model.addAttribute("truyenById", tr);
		model.addAttribute("dmById", ctdm);
		model.addAttribute("listChuong", listChuong);
		
		
		return "info_truyen";
	}
	@RequestMapping(value = "/truyen/chuong", method = RequestMethod.GET)
	public String chuongPage(Model model, @RequestParam("id") int id) {
		ChuongInfo chuongOfId=chuongDao.chuongOfID(id);
		model.addAttribute("noiDung", chuongOfId.getNoiDung());
		model.addAttribute("tieuDe", chuongOfId.getTieuDe());
		return "xem_chuong";
	}
}
