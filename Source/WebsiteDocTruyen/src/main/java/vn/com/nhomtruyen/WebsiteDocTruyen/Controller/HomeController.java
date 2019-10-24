package vn.com.nhomtruyen.WebsiteDocTruyen.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.chuongDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.danhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.taiKhoanDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.truyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.chiTietDanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.chuongInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.taiKhoanInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.truyenInfoByTruyen;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.truyenSelectInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.userAccountsInfo;

@Controller
public class HomeController {

	@Autowired
	private taiKhoanDAO userAccountsDAO;
	@Autowired
	private truyenDAO truyenDao;
	@Autowired
	private danhMucTruyenDAO dmtruyenDao;
	@Autowired
	private chuongDAO chuongDao;

	@RequestMapping(value = { "/", "index", "home" }, method = RequestMethod.GET)
	public String indexPage(Model model) {
		List<truyenSelectInfo> truyen=truyenDao.listTR();
		model.addAttribute("truyen", truyen);
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPage(Model model, @RequestParam("userName") String userName,
			@RequestParam("passWord") String passWord, HttpSession session) {
		String request = "";
		//userAccountsInfo user = userAccountsDAO.login(userName, passWord);
		taiKhoanInfo tk=userAccountsDAO.ck_login(userName, passWord);
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
		
		truyenInfoByTruyen tr= truyenDao.SelectTruyenByMa(maTruyen);
		List<chiTietDanhMucTruyenInfo> ctdm= dmtruyenDao.listTenDMByMaTruyen(maTruyen);
		List<chuongInfo> listChuong = chuongDao.listChuongByIdTruyen(maTruyen); 
		
		model.addAttribute("truyenById", tr);
		model.addAttribute("dmById", ctdm);
		model.addAttribute("listChuong", listChuong);
		
		
		return "info_truyen";
	}
	@RequestMapping(value = "/truyen/chuong", method = RequestMethod.GET)
	public String chuongPage(Model model, @RequestParam("id") int id) {
		chuongInfo chuongOfId=chuongDao.chuongOfID(id);
		model.addAttribute("noiDung", chuongOfId.getNoiDung());
		model.addAttribute("tieuDe", chuongOfId.getTieuDe());
		return "xem_chuong";
	}
}
