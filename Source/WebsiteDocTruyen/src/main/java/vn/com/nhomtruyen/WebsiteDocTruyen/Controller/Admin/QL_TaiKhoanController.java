package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Authencation;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.RoleDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TaiKhoanDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.RoleInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TaiKhoanInfo;

@Controller
@RequestMapping(value="/quan-tri/tai-khoan")
public class QL_TaiKhoanController {
	@Autowired
	private TaiKhoanDAO taiKhoanDao;
	@Autowired
	private RoleDAO roleDao;
	
	public PaginationResult<TaiKhoanInfo> getData(HttpServletRequest request)
	{
		int Max_Result = 10;
		final int Max_Navigation = 10;
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		String search = request.getParameter("search") != null ? request.getParameter("search") : "";
		PaginationResult<TaiKhoanInfo> list;
		if(search.isEmpty() || search.equals(""))
			list = taiKhoanDao.paginationListTaiKhoan(page, Max_Result, Max_Navigation);
		else
		{
			Max_Result = 100;
			list = taiKhoanDao.getTaiKhoanByTen(page, Max_Result, Max_Navigation, search);
			Map<String,String> mess =new HashMap<String, String>();
			mess.put("status","Tìm kiếm thành công!");
			mess.put("name","Tìm được "+list.getTotalRecords()+" kết quả!");
			request.getSession().setAttribute("mess", mess);
		}
			
		return list;
	}
	@RequestMapping(value = { "/*","" },method = RequestMethod.GET)
	public String taiKhoanPage(Model model,HttpServletRequest request) {
		String urlRedirect =  !Authencation.Auth(request,1) ? "redirect:/" : "admin/ql_taikhoan";
		PaginationResult<TaiKhoanInfo> data = getData(request);
		model.addAttribute("listTaiKhoan",data);
		List<RoleInfo> listRole = getListRole();
		model.addAttribute("listRole",listRole);
		return urlRedirect;
	}
	@RequestMapping(value = "/insert",method = RequestMethod.POST)
	public String insert(HttpServletRequest request,HttpSession session)
	{
		Map<String,String> mess = new HashMap<String, String>();
		String tenTaiKhoan = request.getParameter("tentaikhoan").trim();
		String matKhau = request.getParameter("matkhau") != "" ? request.getParameter("matkhau") : "123456";
		String email = request.getParameter("email")!= "" ? request.getParameter("email"): "Chưa có" ;
		if(tenTaiKhoan.length() > 0 && tenTaiKhoan.length() <= 50)
		{
			if(taiKhoanDao.findTaiKhoanEntityByTen(tenTaiKhoan) == null)
			{
				TaiKhoanInfo taikhoaninfo = new TaiKhoanInfo();
				taikhoaninfo.setTenTaiKhoan(tenTaiKhoan);
				taikhoaninfo.setMatKhau(matKhau);
				taikhoaninfo.setEmail(email);
				taiKhoanDao.insert(taikhoaninfo);
				
				mess.put("status", "Thêm tài khoản thành công!");
				mess.put("name","Tài khoản vừa được thêm: "+tenTaiKhoan);
			}
			else
			{
				mess.put("status", "Thêm tài khoản không thành công!");
				mess.put("name","Tài khoản vừa được thêm đã tồn tại!");
			}
			
			
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
	@RequestMapping(value = "/ajax",method = RequestMethod.POST)
	public @ResponseBody String getTaiKhoanById(HttpServletRequest request) throws JsonProcessingException
	{
		int id = Integer.parseInt(request.getParameter("id"));
		TaiKhoanInfo tg = taiKhoanDao.getTaiKhoanById(id);
		 ObjectMapper mapper = new ObjectMapper();
		 String json = mapper.writeValueAsString(tg);
		return json;
	}
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String sua(HttpServletRequest request, HttpSession session)
	{
		String matKhau = request.getParameter("matkhau") != "" ? request.getParameter("matkhau") : "123456";
		String email = request.getParameter("email")!= "" ? request.getParameter("email"): "Chưa có" ;
			TaiKhoanInfo taikhoan = new TaiKhoanInfo();
			taikhoan.setMaTaiKhoan(Integer.parseInt(request.getParameter("id")));
			taikhoan.setMaRole(Integer.parseInt(request.getParameter("role")));
			taikhoan.setMatKhau(matKhau);
			taikhoan.setEmail(email);
			taikhoan.setTrangThai(Boolean.parseBoolean(request.getParameter("trangthai")));
			taiKhoanDao.edit(taikhoan);
			Map<String,String> mess = new HashMap<String, String>();
			mess.put("status", "Cập nhật thành công!");
			mess.put("name","Tài khoản vừa được sửa: "+request.getParameter("tentaikhoan"));
	
		session.setAttribute("mess", mess);
		String back = request.getHeader("Referer");
		return "redirect:"+back;
	}
	@RequestMapping(value = "/xoa/{id}",method = RequestMethod.POST)
	public String xoa(HttpServletRequest request, HttpSession session,@PathVariable(value="id")String id)
	{
		//tao taiKhoanInfo
		TaiKhoanInfo taikhoan = taiKhoanDao.getTaiKhoanById(Integer.parseInt(id));
		//thong bao xoa
		Map<String,String> mess = new HashMap<String,String>();
		mess.put("status", "Xóa thành công!");
		mess.put("name","Tài khoản vừa được xóa: "+taikhoan.getTenTaiKhoan());
		session.setAttribute("mess", mess);
		//thuc hien xoa 
		taiKhoanDao.xoa(Integer.parseInt(id));
		//rederect lai trang
		String back = request.getHeader("Referer");
		return "redirect:"+back;
	}
	
	public List<RoleInfo> getListRole()
	{
		List<RoleInfo> listRole = roleDao.getListRole();
		return listRole;
	}
	@RequestMapping(value = "/select-all/{action}",method = RequestMethod.POST)
	public String select(HttpServletRequest request,HttpSession session,@PathVariable(value = "action")String action) throws JsonParseException, JsonMappingException, IOException
	{
		String json = request.getParameter("array_id");
		ObjectMapper mapper = new ObjectMapper();	
		String[] array_id = mapper.readValue(json, String[].class);
		Map<String,String> mess = new HashMap<String, String>();
		TaiKhoanInfo taikhoan = new TaiKhoanInfo();
		switch (action) {
		case "enable":
			for (String id : array_id) {
				taikhoan.setMaRole(Integer.parseInt(id));
				taikhoan.setTrangThai(true);
				taiKhoanDao.updateTrangThai(taikhoan);
				mess.put("status", "Kích hoạt thành công!"); 
				mess.put("name","Kích hoạt: "+array_id.length+" tài khoản");
			}
			break;
		case "disable":			
			for (String id : array_id) {
				taikhoan.setMaRole(Integer.parseInt(id));
				taikhoan.setTrangThai(false);
				taiKhoanDao.updateTrangThai(taikhoan);
				mess.put("status", "Vô hiệu hóa thành công!");
				mess.put("name","Vô hiệu: "+array_id.length+" tài khoản");
			}
			break;
		case "delete":
			for (String id : array_id) {
				taiKhoanDao.xoa(Integer.parseInt(id));
				mess.put("status", "Xóa thành công!");
				mess.put("name","Vừa xóa: "+array_id.length+" tài khoản");
			}
			break;
		default:
			break;
		}
		session.setAttribute("mess", mess);
		String back = request.getHeader("Referer");
		return "redirect:"+back;
	}

}