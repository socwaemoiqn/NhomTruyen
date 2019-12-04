package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.io.IOException;
import java.util.HashMap;
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
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.RoleInfo;

@Controller
@RequestMapping(value = "/quan-tri/tai-khoan/vai-tro")
public class QL_TaiKhoan_VaiTroController {
	@Autowired
	private RoleDAO roleDAO;
	public PaginationResult<RoleInfo> getData(HttpServletRequest request)
	{
		int Max_Result = 10;
		final int Max_Navigation = 10;
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		String search = request.getParameter("search") != null ? request.getParameter("search") : "";
		PaginationResult<RoleInfo> list;
		if(search.isEmpty() |search.equals(""))
			list = roleDAO.paginationListRole(page, Max_Result, Max_Navigation);
		else
		{
			Max_Result = 100;
			list = roleDAO.getRoleByTen(page, Max_Result, Max_Navigation, search);
			Map<String,String> mess =new HashMap<String, String>();
			mess.put("status","Tìm kiếm thành công!");
			mess.put("name","Tìm được "+list.getTotalRecords()+" kết quả!");
			request.getSession().setAttribute("mess", mess);
		
		}
			
		return list;
	}
	@RequestMapping(value = {"/*",""}, method = RequestMethod.GET)
	public String quyenNguoDungPage(Model model,HttpServletRequest request) {
		String urlRedirect =  !Authencation.Auth(request,1) ? "redirect:/" : "admin/ql_taikhoan_vaitro";
		PaginationResult<RoleInfo> list = getData(request);
		model.addAttribute("listRole",list);
		return urlRedirect;
	}
	@RequestMapping(value = "/ajax",method = RequestMethod.POST)
	public @ResponseBody String getTacGiaById(HttpServletRequest request) throws JsonProcessingException
	{
		int id = Integer.parseInt(request.getParameter("id"));
		RoleInfo role = roleDAO.getRoleById(id);
		 ObjectMapper mapper = new ObjectMapper();
		 String json = mapper.writeValueAsString(role);
		return json;
	}
	@RequestMapping(value = "/insert",method = RequestMethod.POST)
	public String insert(HttpServletRequest request,HttpSession session)
	{
		String tenRole = request.getParameter("tenRole");
		Map<String,String> mess = new HashMap<String, String>();
		if(tenRole.length() > 0 && tenRole.length() <= 50)
		{
			RoleInfo role = new RoleInfo();
			role.setTenRole(tenRole);
			role.setGioiThieu(request.getParameter("gioiThieu"));
			roleDAO.insert(role);
		
			mess.put("status", "Thêm vai trò thành công!");
			mess.put("name","Tác giả vừa được thêm: "+tenRole);
			
		}
		else
		{	mess.put("status", "Thêm vai trò không thành công!");
			mess.put("name","Độ dài tên vai trò ít hơn 50 ký tự và không để trống");
			
		}
		session.setAttribute("mess", mess);
		String back = request.getHeader("Referer");
		return "redirect:"+back;
	} 
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String edit(HttpServletRequest request,HttpSession session)
	{
		Map<String,String> mess = new HashMap<String, String>();
		String tenRole= request.getParameter("tenRole");
		if(tenRole.length() > 0 && tenRole.length() <= 50)
		{
			RoleInfo role = new RoleInfo();
			role.setMaRole(Integer.parseInt(request.getParameter("id")));
			role.setTenRole(tenRole);
			role.setGioiThieu(request.getParameter("gioiThieu"));
			role.setTrangThai(Boolean.parseBoolean(request.getParameter("trangThai")));	
			roleDAO.edit(role);
			mess.put("status", "Sửa vai trò thành công!");
			mess.put("name","Vai trò vừa được sửa: "+tenRole);
		}
		else {
			mess.put("status", "Thêm vai trò không thành công!");
			mess.put("name","Độ dài tên vai trò 50 ký tự và không để trống");
		}
		session.setAttribute("mess", mess);
		String back = request.getHeader("Referer");
		return "redirect:"+back;
	}
	@RequestMapping(value="/xoa/{id}",method = RequestMethod.POST)
	public String xoa(HttpServletRequest request, HttpSession session,@PathVariable(value="id")String id)
	{
		int maRole = Integer.parseInt(id);
		RoleInfo role = roleDAO.getRoleById(maRole);
		roleDAO.xoa(maRole);
		Map<String,String> mess = new HashMap<String, String>();
		mess.put("status", "Xóa vai trò thành công!");
		mess.put("name","Vai trò vừa được xóa: "+role.getTenRole());
		session.setAttribute("mess", mess);
		String back = request.getHeader("Referer");
		return "redirect:"+back;
	}
	@RequestMapping(value = "/select-all/{action}",method = RequestMethod.POST)
	public String selectAll(HttpServletRequest request,HttpSession session,@PathVariable(value="action")String action) throws JsonParseException, JsonMappingException, IOException
	{
		String json = request.getParameter("array_id");
		ObjectMapper mapper = new ObjectMapper();	
		String[] array_id = mapper.readValue(json, String[].class);
		Map<String,String> mess = new HashMap<String, String>();
		RoleInfo role = new RoleInfo();
		switch (action) {
		case "enable":
			for (String id : array_id) {
				role.setMaRole(Integer.parseInt(id));
				role.setTrangThai(true);
				roleDAO.updateTrangThai(role);
				mess.put("status", "Kích hoạt thành công!");
				mess.put("name","Kích hoạt: "+array_id.length+" vai trò");
			}
			break;
		case "disable":			
			for (String id : array_id) {
				role.setMaRole(Integer.parseInt(id));
				role.setTrangThai(false);
				roleDAO.updateTrangThai(role);
				mess.put("status", "Vô hiệu hóa thành công!");
				mess.put("name","Vô hiệu: "+array_id.length+" vai trò");
			}
			break;
		case "delete":
			for (String id : array_id) {
				roleDAO.xoa(Integer.parseInt(id));
				mess.put("status", "Xóa thành công!");
				mess.put("name","Vừa xóa: "+array_id.length+" vai trò");
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
