package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.danhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.tacGiaDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.theLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.truyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.danhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.tacGiaInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.theLoaiTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.truyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.truyenSelectInfo;

@Controller(value = "HomeControllerOfAdmin")
@RequestMapping(value = "/quan-tri")
public class HomeController {

	@Autowired
	private danhMucTruyenDAO danhMucTruyenDAO;

	@Autowired
	private theLoaiTruyenDAO theLoaiTruyenDAO;
	
	@Autowired
	private truyenDAO truyenDao;
	
	@Autowired
	private tacGiaDAO tacGiaDao;

	@RequestMapping(value = { "/", "home", "" }, method = RequestMethod.GET)
	public String indexAdminPage(Model model) {
		return "admin/home";
	}

	@RequestMapping(value = "/ql_danhmuc_truyen", method = RequestMethod.GET)
	public String QlDanhMucTruyenPage(Model model, @RequestParam(value = "page", defaultValue = "1") String pageStr) {

		// List<danhMucTruyenInfo> listDanhMuc= danhMucTruyenDAO.dsDanhMucTruyen();

		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 2;
		final int Max_Navigation = 1;
		PaginationResult<danhMucTruyenInfo> listDanhMuc = danhMucTruyenDAO.listDanhMucTruyen(page, Max_Result,
				Max_Navigation);

		model.addAttribute("danhMucTruyen", listDanhMuc);
		
		

		return "admin/ql_danhmuctruyen";
	}

	@RequestMapping(value = "/ql_theloai_truyen", method = RequestMethod.GET)
	public String QlTheLoaiTruyenPage(Model model, @RequestParam(value = "page", defaultValue = "1") String pageStr) {
		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 3;
		final int Max_Navigation = 4;

		PaginationResult<theLoaiTruyenInfo> listTheLoaiTruyen = theLoaiTruyenDAO.listTheLoaiTruyen(page, Max_Result,
				Max_Navigation);

		model.addAttribute("listTheLoaiTruyen", listTheLoaiTruyen);

		return "admin/ql_theloaitruyen";
	}

	@RequestMapping(value = "/ql_truyen", method = RequestMethod.GET)
	public String QlTruyenPage(Model model, @RequestParam(value = "page", defaultValue = "1") String pageStr) {
		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 3;
		final int Max_Navigation = 4;
		
		PaginationResult<truyenSelectInfo> listTruyen= truyenDao.litTruyen(page, Max_Result, Max_Navigation);
		
		model.addAttribute("listTruyen", listTruyen);
		
		
		truyenInfo truyen = new truyenInfo();
		model.addAttribute("truyen", truyen);
		
		return "admin/ql_truyen";
	}
	
	@RequestMapping(value = "/ql_nhomdich", method = RequestMethod.GET)
	public String QlNhomDichPage(Model model) {

		return "admin/ql_nhomdich";
	}
	
	@RequestMapping(value = "/ql_tacgia", method = RequestMethod.GET)
	public String QlTacGiaPage(Model model) {

		return "admin/ql_tacgia";
	}
	
	@ModelAttribute("danhMuc")
	public List<danhMucTruyenInfo> getDanhMuc(){
		List<danhMucTruyenInfo> danhMuc= danhMucTruyenDAO.dsDanhMucTruyen();
		return danhMuc;	
	}
	
	@ModelAttribute("tacGia")
	public List<tacGiaInfo> getTacGia(){
		List<tacGiaInfo> tacGia= tacGiaDao.listTacGia();
		return tacGia;	
	}
	
	@ModelAttribute("theLoai")
	public List<theLoaiTruyenInfo> getTheLoai(){
		List<theLoaiTruyenInfo> theLoai=theLoaiTruyenDAO.dsTheLoai(); 
		return theLoai;	
	}

}
