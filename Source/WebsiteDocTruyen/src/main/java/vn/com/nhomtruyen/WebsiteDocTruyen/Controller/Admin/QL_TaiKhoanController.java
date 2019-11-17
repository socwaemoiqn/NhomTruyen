package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.InfoTaiKhoanDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TaiKhoanDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.InfoTaiKhoanEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TacGiaEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TaiKhoanEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.InfoTaiKhoanModel;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TacGiaInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TaiKhoanInfo;

@Controller
@RequestMapping(value="/quan-tri/tai-khoan")
public class QL_TaiKhoanController {
	@Autowired
	private TaiKhoanDAO taiKhoanDao;
	@Autowired
	private InfoTaiKhoanDAO infoTaiKhoanDAO;
	public PaginationResult<TaiKhoanInfo> getData(String pageStr)
	{
		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 10;
		final int Max_Navigation = 10;
		PaginationResult<TaiKhoanInfo> list = taiKhoanDao.paginationListTaiKhoan(page, Max_Result, Max_Navigation);
		return list;
	}
	@RequestMapping(value = "",method = RequestMethod.GET)
	public String taiKhoanPage(Model model,@RequestParam(value = "page",defaultValue = "1")String pageStr) {
		PaginationResult<TaiKhoanInfo> data = getData(pageStr);
		model.addAttribute("listTaiKhoan",data);
		
		return "admin/ql_taikhoan";
	}
	@RequestMapping(value = "/insert",method = RequestMethod.POST)
	public String insert(HttpServletRequest request,HttpSession session)
	{
		Map<String,String> mess = new HashMap<String, String>();
		String tenTaiKhoan = request.getParameter("tentaikhoan");
		String matKhau = request.getParameter("matkhau") != "" ? request.getParameter("matkhau") : "123456";
		String email = request.getParameter("email")!= "" ? request.getParameter("email"): "Chưa có" ;
		if(tenTaiKhoan.length() > 0 && tenTaiKhoan.length() <= 50)
		{
			TaiKhoanInfo taikhoaninfo = new TaiKhoanInfo();
			taikhoaninfo.setTenTaiKhoan(tenTaiKhoan);
			taikhoaninfo.setMatKhau(matKhau);
			taikhoaninfo.setEmail(email);
			TaiKhoanEntity taikhoan = taiKhoanDao.insert(taikhoaninfo);
			int id = taikhoan.getMaTaiKhoan();
			
			mess.put("status", "Thêm tác giả thành công!");
			mess.put("name","Tác giả vừa được thêm: "+tenTaiKhoan);
			
		}
		else
		{
			mess.put("status", "Thêm tài khoản không thành công!");
			mess.put("name","Độ dài tên tài khoản 50 ký tự và không để trống");
		}
		session.setAttribute("mess", mess);
		String back = request.getHeader("Referer");
		return "redirect:"+back;
	} 
	@RequestMapping(value = "/search",method = RequestMethod.GET)
	public String search(HttpServletRequest request,HttpSession session, @RequestParam(value="page",defaultValue = "1")String pageStr) 
	{
		String key = request.getParameter("key");
		if(!key.isEmpty())
		{
			int page = 1;
			try {
				page = Integer.parseInt(pageStr);
			} catch (Exception e) {
				// TODO: handle exception
			}
			final int Max_Result = 100;
			final int Max_Navigation = 10;
			PaginationResult<TaiKhoanInfo> listTaiKhoan = taiKhoanDao.getTaiKhoanByTen(page, Max_Result, Max_Navigation,key);
			request.setAttribute("listTaiKhoan",listTaiKhoan);
			Map<String,String> mess = new HashMap<String, String>();
			mess.put("status", "Tìm kiếm thành công!");
			mess.put("name","Tìm được: "+listTaiKhoan.getList().size()+" kết quả!");
			session.setAttribute("mess", mess);
			return "admin/ql_taikhoan";
		}
		return "redirect:/quan-tri/tai-khoan";
	}

}